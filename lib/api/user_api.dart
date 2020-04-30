import 'dart:core' as prefix0;
import 'dart:core';
import 'package:bookmybook/models/book.dart';
import 'package:bookmybook/models/user.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


bool _isEmailVerified = false;

login(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if (authResult != null) {
    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

signup(User user, AuthNotifier authNotifier) async {
  AuthResult authResult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  sendEmailVerification();

  if (authResult != null) {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = user.name;
    //updateInfo.college = user.college;

    FirebaseUser firebaseUser = authResult.user;

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(updateInfo);

      await firebaseUser.reload();

      print("Sign up: $firebaseUser");
      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      addUserData(user);
      authNotifier.setUser(currentUser);
    }
  }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance
      .signOut()
      .catchError((error) => print(error.code));

  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

  if (firebaseUser != null) {
    print(firebaseUser);
    print(firebaseUser.uid);
    authNotifier.setUser(firebaseUser);
  }
}

sendEmailVerification() async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  firebaseUser.sendEmailVerification();
}

isEmailVerified() async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  return firebaseUser.isEmailVerified;
}

//        void _checkEmailVerification() async {
//   _isEmailVerified = await isEmailVerified();
//   if (!_isEmailVerified) {
//    // _showVerifyEmailDialog();
//   }
// }




getUser(AuthNotifier authNotifier) async {
  //heroTag: 'harsh';
  FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  QuerySnapshot snapshot = await Firestore.instance
      .collection("users")
      .where('email', isEqualTo: currentUser.email)
      .getDocuments();

  List<User> _userList = [];

  snapshot.documents.forEach((document) {
    User user = User.fromMap(document.data);
    _userList.add(user);
  });
  print("UserList");
  print(_userList[0]);

  authNotifier.userList = _userList;
}


Future addUserData(User user) async {
  final ref = Firestore.instance.collection("users");
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  print("Uid:$firebaseUser.uid");
  return await ref.document(firebaseUser.uid).setData(user.toMap());
}

