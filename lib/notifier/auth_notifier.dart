import 'dart:collection';

import 'package:bookmybook/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
FirebaseUser _user;
User users;
String uid;

class AuthNotifier with ChangeNotifier {
    List<User> _userList = [];


  
  FirebaseUser get user => _user;
  User get userinfo => users; 
  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  void setUser(FirebaseUser user) {
    _user = user;
    user == null ? uid = null : uid = user.uid;
    notifyListeners();
  }

   set userList(List<User> bookList) {
    _userList = bookList;
    notifyListeners();
  }
    set userinfo(User userinfo) {
    users = userinfo;
    notifyListeners();
  } 
}