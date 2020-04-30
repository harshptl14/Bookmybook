import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String title;
  String price;
  String about;
  String username;
  String number;
  String image;
  String rent;
  String author;
  String userId;
  Timestamp createdAt;
  Timestamp updatedAt;
  String id;
  String firstChar;
  String department;


  Book();

  Book.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    price = data['price'];
    about = data['about'];
    username = data['username'];
    number = data['number'];
    image = data['image'];
    rent = data['rent'];
    author = data['author'];
    userId = data['userId'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
    firstChar = data['firstChar'];
    department = data['department'];
  }

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'about': about,
      'username' : username,
      'number' : number,
      'image': image,
      'rent' : rent,
      'author' : author,
      'userId' : userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'firstChar'  : firstChar,
      'department' : department,
    };
  }


}
