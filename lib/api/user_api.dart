import 'dart:core' as prefix0;
import 'dart:core';
import 'package:bookmybook/models/user.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:path/path.dart';
//import 'package:shared_preferences/shared_preferences.dart';

bool _isEmailVerified = false;
//SharedPreferences prefs;
// prefs = await SharedPreferences.getInstance();

login(User user, AuthNotifier authNotifier) async {
  //prefs = await SharedPreferences.getInstance();
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
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

  var map = <String, int>{};

  Firestore.instance.collection('cart').document(firebaseUser.uid).setData(map);

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

getUser(AuthNotifier authNotifier, String id) async {
  //heroTag: 'harsh';
  //FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  QuerySnapshot snapshot = await Firestore.instance
      .collection("users")
      .where('uid', isEqualTo: id)
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

DocumentSnapshot userDetails;

getUserr() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  String uid = user.uid;
  print('currentUser in user_api');
  //print(uid);
  return await Firestore.instance.collection('users').document(uid).get();
}

// getAllUser() async {

//     FirebaseUser user = await FirebaseAuth.instance.currentUser();
//     String uid = user.uid;
//     print('currentUser in user_api');
//     print(uid);
//     return await Firestore.instance.collection('users').document(uid).get();
// }

getperticularUserr(perticularUser) async {
  String uid = perticularUser;
  print('seller user in user_api');
  //print(uid);
  return await Firestore.instance.collection('users').document(uid).get();
}

updateChatedWith(
    String uid, id, String whosename, String currentname, String image) async {
// await Firestore.instance
//           .collection("chattedWith")
//           .document("id")
//           .collection('with').document(uid)
//           .add({
//         'image': '$image',
//         'name': '$name',
//       });
  print('currentUserName');
  print(currentname);
  print('bookUserName');
  print(whosename);
  String currentUser = uid.trim();
  String chatuser = id.trim();
  String currentBookOnwer = whosename;
  String currentUserName = currentname;

  await Firestore.instance
      .collection('chattedWith')
      .document(currentUser)
      .collection('chat')
      .document(chatuser)
      .setData({
    'image': '$image',
    'name': '$currentBookOnwer',
    'id': '$chatuser',
  });

  await Firestore.instance
      .collection('chattedWith')
      .document(chatuser)
      .collection('chat')
      .document(currentUser)
      .setData({
    'image': '$image',
    'name': '$currentUserName',
    'id': '$currentUser',
  });

  //   DocumentReference documentRef = await foodRef.add(
  //     'image': '$image',
  //     'name': '$name',
  //   );

  // food.id = documentRef.documentID;
}

Future getPoasts(currentuser) async {
  QuerySnapshot qn;
  var firestore = Firestore.instance;
  qn = await firestore
      .collection('chattedWith')
      .document(currentuser)
      .collection('chat')
      .getDocuments();
  //qn = await firestore.collection("cspit").getDocuments();

  return qn.documents;
}

Future addUserData(User user) async {
  //prefs = await SharedPreferences.getInstance();
  final ref = Firestore.instance.collection("users");
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  print("Uid:$firebaseUser.uid");
  //await prefs.setString('id', firebaseUser.uid);
  user.uid = firebaseUser.uid;
  return await ref.document(firebaseUser.uid).setData(user.toMap());
}

currentuser() async {
  // FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
  // String uid = firebaseUser.uid;
  // return uid;
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  String uid = user.uid;
  return await Firestore.instance.collection('users').document(uid).get();
}

// getuser(){
// String current;
//  currentuser().then((String result) {
//   current = result;
// });
// return current;
// }
