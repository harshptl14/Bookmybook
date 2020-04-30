import 'dart:collection';

import 'package:bookmybook/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthNotifier with ChangeNotifier {
  FirebaseUser _user;
    List<User> _userList = [];

  User users;
  
  FirebaseUser get user => _user;
  User get userinfo => users; 
  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  void setUser(FirebaseUser user) {
    _user = user;
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