import 'dart:io';
import 'package:bookmybook/models/book.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;


getBooks(BookNotifier bookNotifier, String depname) async {
  //heroTag: 'harsh';
  //String dep = depname as String;
  QuerySnapshot snapshot = await Firestore.instance
      .collection("cspit")
      .document("department")
      .collection(depname).orderBy('createdAt', descending: true)
      .getDocuments();

  List<Book> _bookList = [];
  
  snapshot.documents.forEach((document) {
    Book book = Book.fromMap(document.data);
    _bookList.add(book);
  });

  bookNotifier.bookList = _bookList;
}

getBooksForHomescreen(BookNotifier bookNotifier) async {
  //heroTag: 'harsh';
  QuerySnapshot snapshot = await Firestore.instance
      .collection("cspit")
      .document("department")
      .collection("computer").orderBy('createdAt', descending: true)
      .getDocuments();

  List<Book> _bookList = [];

  snapshot.documents.forEach((document) {
    Book book = Book.fromMap(document.data);
    _bookList.add(book);
  });

  bookNotifier.bookList = _bookList;
}


getBooksForUser(BookNotifier bookNotifier) async {
  FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

  QuerySnapshot snapshot = await Firestore.instance
      .collection("cspit")
      .document("department")
      .collection("computer")
      .where('userId', isEqualTo: currentUser.email)
      //.where('number', isEqualTo: currentUser.email)
      .getDocuments();

  List<Book> _bookList = [];

  snapshot.documents.forEach((document) {
    Book book = Book.fromMap(document.data);
    _bookList.add(book);
  });

  bookNotifier.bookList = _bookList;
}

uploadFoodAndImage(Book food, bool isUpdating, File localFile, Function foodUploaded) async {
  if (localFile != null) {
    print("uploading image");

    
    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('books/images/$uuid$fileExtension');

    await firebaseStorageRef.putFile(localFile).onComplete.catchError((onError) {
      print(onError);
      return false;
    });

    String url = await firebaseStorageRef.getDownloadURL();
    print("download url: $url");
    _uploadFood(food, isUpdating, foodUploaded, imageUrl: url);
  } else {
    print('...skipping image upload');
    _uploadFood(food, isUpdating, foodUploaded);
  }
}

_uploadFood(Book food, bool isUpdating, Function foodUploaded, {String imageUrl}) async {
  CollectionReference foodRef = Firestore.instance.collection('cspit').document('department').collection(food.department);
  FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  if (imageUrl != null) {
    food.image = imageUrl;
  }

  if (isUpdating) {
    food.updatedAt = Timestamp.now();
    food.userId = currentUser.email;
    await foodRef.document(food.id).updateData(food.toMap());

    foodUploaded(food);
    print('updated food with id: ${food.id}');
  } else {
    String fChar = food.title[0];
    food.firstChar = fChar;
    print(fChar);
    food.createdAt = Timestamp.now();
    food.userId = currentUser.email;
    DocumentReference documentRef = await foodRef.add(food.toMap());

    food.id = documentRef.documentID;

    print('uploaded food successfully: ${food.toString()}');

    await documentRef.setData(food.toMap(), merge: true);

    foodUploaded(food);
  }
}

deleteFood(Book food, Function foodDeleted) async {
  if (food.image != null) {
    StorageReference storageReference =
        await FirebaseStorage.instance.getReferenceFromUrl(food.image);

    print(storageReference.path);

    await storageReference.delete();

    print('image deleted');
  }

  await Firestore.instance.collection('cspit').document('department').collection("computer").document(food.id).delete();
  foodDeleted(food);
}
