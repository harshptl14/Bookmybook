import 'dart:collection';

import 'package:bookmybook/models/book.dart';
import 'package:flutter/cupertino.dart';

class BookNotifier with ChangeNotifier {
  List<Book> _bookList = [];
  Book _currentBook;
    //Book _currentBookk;


  UnmodifiableListView<Book> get bookList => UnmodifiableListView(_bookList);

  Book get currentBook => _currentBook;

  set bookList(List<Book> bookList) {
    _bookList = bookList;
    notifyListeners();
  }

    addBook(Book book) {
    _bookList.insert(0, book);
    notifyListeners();
  }

  set currentBook(Book book) {
    _currentBook = book;
    notifyListeners();
  }

    deleteFood(Book food) {
    _bookList.removeWhere((_food) => _food.id == food.id);
    notifyListeners();
  }

}
