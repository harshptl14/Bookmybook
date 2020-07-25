// import 'dart:io';
// import 'package:bookmybook/api/book_api.dart';
// import 'package:bookmybook/app_screens/NavPages/home_screen.dart';
// import 'package:bookmybook/models/book.dart';
// import 'package:bookmybook/notifier/book_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// class Upload extends StatefulWidget {
//   const Upload({Key key, @required this.isUpdating}) : super(key: key);

//   final bool isUpdating;

//   //Upload({@required this.isUpdating});
//   @override
//   _UploadState createState() => _UploadState();
// }

// class _UploadState extends State<Upload> {
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController t1 = TextEditingController();

//   Book _currentBook;
//   String _imageUrl;
//   File _imageFile;
//   String _dropDownValue;
//   //User

//   // routrs : <String, WidgetBuilder>{
//   //   '/mainPage' : (BuildContext context) => new MyApp(),
//   // },

//   @override
//   void initState() {
//     super.initState();
//     if (!widget.isUpdating) {
//       //_formkey.currentState?.reset();
//       //_scaffoldKey.currentState?.re
//       t1.clear();
//     }

//     BookNotifier bookNotifier =
//         Provider.of<BookNotifier>(context, listen: false);

//     if (bookNotifier.currentBook != null) {
//       _currentBook = bookNotifier.currentBook;
//     } else {
//       _currentBook = Book();
//     }
//     //_imageUrl = bookNotifier.currentBook.image;
//     _imageUrl = _currentBook.image;
//   }

//   _showImage() {
//     if (_imageFile == null && _imageUrl == null) {
//       return Text("image placeholder");
//     } else if (_imageFile != null) {
//       print('showing image from local file');

//       return Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: <Widget>[
//           Image.file(
//             widget.isUpdating == true ?_imageFile : null,
//             fit: BoxFit.cover,
//             height: 250,
//           ),
//           FlatButton(
//             padding: EdgeInsets.all(16),
//             color: Colors.black54,
//             child: Text(
//               'Change Image',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400),
//             ),
//             onPressed: () => _getLocalImage(),
//           )
//         ],
//       );
//     } else if (_imageUrl != null) {
//       print('showing image from url');

//       return Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: <Widget>[
//           Image.network(
//             _imageUrl,
//             width: MediaQuery.of(context).size.width,
//             fit: BoxFit.cover,
//             height: 250,
//           ),
//           FlatButton(
//             padding: EdgeInsets.all(16),
//             color: Colors.black54,
//             child: Text(
//               'Change Image',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 22,
//                   fontWeight: FontWeight.w400),
//             ),
//             onPressed: () => _getLocalImage(),
//           )
//         ],
//       );
//     }
//   }

//   _getLocalImage() async {
//     File imageFile = await ImagePicker.pickImage(
//         source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

//     if (imageFile != null) {
//       setState(() {
//         _imageFile = imageFile;
//       });
//     }
//   }

//   Widget _buildtitlefield() {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: TextFormField(
//         //controller: t1,
//         initialValue: widget.isUpdating == true ? _currentBook.title : null,
//         decoration: InputDecoration(
//             labelText: 'TITLE',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (String value) {
//           if (value == null) {
//             return 'Title is required';
//           }
//           if (value.length < 3 || value.length > 20) {
//             return 'Title must be more than 3 and less than 20';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) {
//           _currentBook.title = value;
//         },
//       ),
//     );
//   }

//   Widget _buildauthorfield() {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: TextFormField(
//         //  controller: t1,
//         initialValue: widget.isUpdating == true ? _currentBook.author : null,
//         decoration: InputDecoration(
//             labelText: 'Author',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (value) {
//           if (value == null) {
//             return 'Author is required';
//           }
//           if (value.length < 3 || value.length > 20) {
//             return 'Author must be more than 3 and less than 20';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) {
//           _currentBook.author = value;
//         },
//       ),
//     );
//   }

//   Widget _buildpricefield() {
//     return Container(
//       padding: EdgeInsets.all(10),
//       child: TextFormField(
//         //controller: t1,
//         initialValue: widget.isUpdating == true ? _currentBook.price : null,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//             labelText: 'PRICE',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (value) => value.isEmpty ? 'Price Can not be empty' : null,
//         onSaved: (value) {
//           _currentBook.price = value;
//         },
//       ),
//     );
//   }

//   Widget _buildrentfield() {
//     return Container(
//       padding: EdgeInsets.all(10),
//       child: TextFormField(
//         //         controller: t1,

//         initialValue: widget.isUpdating == true ? _currentBook.rent : null,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//             labelText: 'RENT',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (value) => value.isEmpty ? 'Rent Can not be empty' : null,
//         onSaved: (value) {
//           _currentBook.rent = value;
//         },
//       ),
//     );
//   }

//   Widget _buildaboutfield() {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: TextFormField(
//         //       controller: t1,

//         initialValue: widget.isUpdating == true ?_currentBook.about : null,
//         decoration: InputDecoration(
//             labelText: 'ABOUT',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (String value) {
//           if (value == null) {
//             return 'About is required';
//           }
//           if (value.length < 3 || value.length > 30) {
//             return 'About must be more than 3 and less than 30';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) {
//           _currentBook.about = value;
//         },
//       ),
//     );
//   }

//   Widget _buildphonenofield() {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: TextFormField(
//         //         controller: t1,

//         initialValue: widget.isUpdating == true ? _currentBook.number : null,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//             labelText: 'PHONENO',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (String value) {
//           if (value == null) {
//             return 'Phone no is required';
//           }
//           if (value.length < 0 || value.length > 10) {
//             return 'Phone no must be 10 digit';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) {
//           _currentBook.number = value;
//         },
//       ),
//     );
//   }

//   Widget _buildusernamefield() {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: TextFormField(
//         //          controller: t1,

//         initialValue: widget.isUpdating == true ? _currentBook.username : null,
//         decoration: InputDecoration(
//             labelText: 'USERNAME',
//             labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//             focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.deepPurple))),
//         validator: (String value) {
//           if (value == null) {
//             return 'Username is required';
//           }
//           if (value.length < 3 || value.length > 20) {
//             return 'Username must be more than 3 and less than 20';
//           } else {
//             return null;
//           }
//         },
//         onSaved: (value) {
//           _currentBook.username = value;
//           // _currentBook.userId = authNotifier.user.email;
//         },
//       ),
//     );
//   }

//   Widget _builddepartmentfield() {
//     return Container(
//       padding: EdgeInsets.all(10),
//       child: DropdownButton(
//         iconEnabledColor: Colors.grey,
//         hint: _dropDownValue == null
//             ? Text('DEPARTMENT')
//             : Text(
//                 _dropDownValue,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Montserrat',
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                 ),
//               ),
//         isExpanded: true,
//         iconSize: 30.0,
//         style: TextStyle(
//           color: Colors.grey,
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//           fontFamily: 'Montserrat',
//         ),
//         items: ['computer', 'mechanical', 'civil', 'it'].map(
//           (val) {
//             return DropdownMenuItem<String>(
//               value: val,
//               child: Text(val),
//             );
//           },
//         ).toList(),
//         onChanged: (val) {
//           setState(
//             () {
//               _dropDownValue = val;
//               _currentBook.department = val;
//             },
//           );
//         },
//       ),
//     );
//   }

//   _onBookUploaded(Book book) {
//     BookNotifier foodNotifier =
//         Provider.of<BookNotifier>(context, listen: false);

//     foodNotifier.addBook(book);
//     //Navigator.popUntil();
//     //Navigator.of(context).pushNamed('/page2');
//     Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()))
//         .then((_) => _formkey.currentState.reset());
//   }

//   _saveBook() {
//     print('saveFood Called');
//     if (!_formkey.currentState.validate()) {
//       return;
//     }

//     _formkey.currentState.save();

//     print('form saved');

//     //_currentFood.subIngredients = _subingredients;

//     uploadFoodAndImage(
//         _currentBook, widget.isUpdating, _imageFile, _onBookUploaded);

//     print("name: ${_currentBook.title}");
//     print("author: ${_currentBook.author}");
//     print("price: ${_currentBook.price.toString()}");
//     print("rent: ${_currentBook.rent.toString()}");
//     print("about: ${_currentBook.about}");
//     print("username: ${_currentBook.username}");
//     print("number: ${_currentBook.number.toString()}");
//     print("_imageFile ${_imageFile.toString()}");
//     print("_imageUrl $_imageUrl");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//             leading: IconButton(
//               color: Colors.black,
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(Icons.arrow_back),
//             ),
//         title: Text(
//           widget.isUpdating ? 'Edit Book' : "Upload Book",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(10),
//         child: Form(
//             key: _formkey,
//             autovalidate: true,
//             child: Column(children: <Widget>[
//               _showImage(),
//               _imageFile == null && _imageUrl == null
//                   ? ButtonTheme(
//                       child: RaisedButton(
//                         onPressed: () => _getLocalImage(),
//                         child: Text(
//                           'Add Image',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     )
//                   : SizedBox(height: 0),
//               _builddepartmentfield(),
//               _buildtitlefield(),
//               _buildauthorfield(),
//               _buildpricefield(),
//               _buildrentfield(),
//               _buildaboutfield(),
//               _buildusernamefield(),
//               _buildphonenofield(),
//             ])),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           FocusScope.of(context).requestFocus(new FocusNode());
//           _saveBook();
//         },
//         child: Icon(Icons.save),
//         foregroundColor: Colors.white,
//       ),
//     );
//   }
// }

// //  Route routes(RouteSettings settings) {
// //   if (settings.name == '/page1') {
// //     return MaterialPageRoute(
// //       builder: (context) {
// //         return MyApp();
// //       },
// //     );
// //   }
// //  }

import 'dart:io';
import 'package:bookmybook/api/book_api.dart';
import 'package:bookmybook/models/book.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Upload extends StatefulWidget {
  final bool isUpdating;

  Upload({@required this.isUpdating});
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController t1 = TextEditingController();

  Book _currentBook;
  String _imageUrl;
  File _imageFile;
  String _dropDownValue;
  //User

  @override
  void initState() {
    super.initState();
    if (!widget.isUpdating) {
      //t1.dispose();
    }
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    BookNotifier bookNotifier =
        Provider.of<BookNotifier>(context, listen: false);

    if (bookNotifier.currentBook != null) {
      _currentBook = bookNotifier.currentBook;
    } else {
      _currentBook = Book();
    }
    //_imageUrl = bookNotifier.currentBook.image;
    _imageUrl = _currentBook.image;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      return Text("image placeholder");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.file(
            _imageFile,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    } else if (_imageUrl != null) {
      print('showing image from url');

      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.network(
            _imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: 250,
          ),
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.black54,
            child: Text(
              'Change Image',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            onPressed: () => _getLocalImage(),
          )
        ],
      );
    }
  }

  _getLocalImage() async {
    File imageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

    if (imageFile != null) {
      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Widget _buildtitlefield() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        // controller: t1,
        initialValue: _currentBook.title,
        decoration: InputDecoration(
            labelText: 'TITLE',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (String value) {
          if (value == null) {
            return 'Title is required';
          }
          if (value.length < 3 || value.length > 20) {
            return 'Title must be more than 3 and less than 20';
          }
        },
        onSaved: (value) {
          _currentBook.title = value;
        },
      ),
    );
  }

  Widget _buildauthorfield() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: _currentBook.author,
        decoration: InputDecoration(
            labelText: 'Author',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (String value) {
          if (value == null) {
            return 'Author is required';
          }
          if (value.length < 3 || value.length > 20) {
            return 'Author must be more than 3 and less than 20';
          }
        },
        onSaved: (value) {
          _currentBook.author = value;
        },
      ),
    );
  }

  Widget _buildpricefield() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: _currentBook.price,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'PRICE',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (value) => value.isEmpty ? 'Price Can not be empty' : null,
        onSaved: (value) {
          _currentBook.price = value;
        },
      ),
    );
  }

  Widget _buildrentfield() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: _currentBook.rent,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'RENT',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (value) => value.isEmpty ? 'Rent Can not be empty' : null,
        onSaved: (value) {
          _currentBook.rent = value;
        },
      ),
    );
  }

  Widget _buildaboutfield() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: _currentBook.about,
        decoration: InputDecoration(
            labelText: 'ABOUT',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (String value) {
          if (value == null) {
            return 'About is required';
          }
          if (value.length < 3 || value.length > 30) {
            return 'About must be more than 3 and less than 30';
          }
        },
        onSaved: (value) {
          _currentBook.about = value;
        },
      ),
    );
  }

  Widget _buildphonenofield() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: _currentBook.number,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'PHONENO',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (String value) {
          if (value == null) {
            return 'Phone no is required';
          }
          if (value.length < 0 || value.length > 10) {
            return 'Phone no must be 10 digit';
          }
        },
        onSaved: (value) {
          _currentBook.number = value;
        },
      ),
    );
  }

  Widget _buildusernamefield() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        initialValue: _currentBook.username,
        decoration: InputDecoration(
            labelText: 'USERNAME',
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple))),
        validator: (String value) {
          if (value == null) {
            return 'Username is required';
          }
          if (value.length < 3 || value.length > 20) {
            return 'Username must be more than 3 and less than 20';
          }
        },
        onSaved: (value) {
          _currentBook.username = value;
          // _currentBook.userId = authNotifier.user.email;
        },
      ),
    );
  }

  Widget _builddepartmentfield() {
    return Container(
      padding: EdgeInsets.all(10),
      child: DropdownButton(
        iconEnabledColor: Colors.grey,
        hint: _dropDownValue == null
            ? Text('DEPARTMENT')
            : Text(
                _dropDownValue,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
        isExpanded: true,
        iconSize: 30.0,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: 'Montserrat',
        ),
        items: ['computer', 'mechanical', 'civil', 'it'].map(
          (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          },
        ).toList(),
        onChanged: (val) {
          setState(
            () {
              _dropDownValue = val;
              _currentBook.department = val;
            },
          );
        },
      ),
    );
  }

  _onBookUploaded(Book book) {
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    foodNotifier.addBook(book);
    Navigator.pop(context);
  }

  _saveBook() {
    print('saveFood Called');
    if (!_formkey.currentState.validate()) {
      return;
    }

    _formkey.currentState.save();

    print('form saved');

    //_currentFood.subIngredients = _subingredients;

    uploadFoodAndImage(
        _currentBook, widget.isUpdating, _imageFile, _onBookUploaded);

    print("name: ${_currentBook.title}");
    print("author: ${_currentBook.author}");
    print("price: ${_currentBook.price.toString()}");
    print("rent: ${_currentBook.rent.toString()}");
    print("about: ${_currentBook.about}");
    print("username: ${_currentBook.username}");
    print("number: ${_currentBook.number.toString()}");
    print("_imageFile ${_imageFile.toString()}");
    print("_imageUrl $_imageUrl");
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.isUpdating ? 'Edit Book' : "Upload Book",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _formkey,
            autovalidate: true,
            child: Column(children: <Widget>[
              _showImage(),
              _imageFile == null && _imageUrl == null
                  ? ButtonTheme(
                      child: RaisedButton(
                        onPressed: () => _getLocalImage(),
                        child: Text(
                          'Add Image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
              _builddepartmentfield(),
              _buildtitlefield(),
              _buildauthorfield(),
              _buildpricefield(),
              _buildrentfield(),
              _buildaboutfield(),
              _buildusernamefield(),
              _buildphonenofield(),
            ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _saveBook();
        },
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
      ),
    );
  }
}
