// import 'dart:io';
// import 'package:bookmybook/app_screens/NavPages/profile.dart';
// import 'package:bookmybook/app_screens/test.dart';
// import 'package:bookmybook/notifier/auth_notifier.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'first_screen.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:intl/intl.dart';


// String _dropDownValue;
// File image;
// String filename;

// class AddProduct extends StatefulWidget {
//   // final VoidCallback college, email, name;
//   // const AddProduct({Key key, this.college, this.email, this.name});
//   @override
//   _AddProductState createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   Icon searchIcon = new Icon(Icons.search);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           primarySwatch: Colors.deepPurple,
//           appBarTheme: AppBarTheme(
//             brightness: Brightness.light,
//             elevation: 5,
//             color: ThemeData.light().canvasColor,
//           )),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: false,
//           title: Text(
//             "Upload",
//             style: TextStyle(
//               fontSize: 22,
//               color: Colors.black,
//               fontFamily: 'Montserrat',
//               fontWeight: FontWeight.bold,

//               // fontWeight: FontWeight.bold,
//             ),
//           ),
//           iconTheme: new IconThemeData(color: Colors.black),
//           actions: <Widget>[
//             IconButton(
//                 icon: searchIcon,
//                 color: Colors.black,
//                 onPressed: () {
//                   heroTag:
//                   "search";
//                   // Navigator.push(
//                   //     context, MaterialPageRoute(builder: (context) => Test()));
//                 }),
//           ],
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             color: Colors.black,
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => element()));
//             },
//             icon: Icon(Icons.arrow_back),
//           ),
//         ),
//         body: UploadThing(),
//       ),
//     );
//   }
// }

// class CommonThings {
//   static Size size;
// }

// class UploadThing extends StatefulWidget {
//   @override
//   _UploadThingState createState() => _UploadThingState();
  
// }

// class _UploadThingState extends State<UploadThing> {
//   TextEditingController imageInputController;
//   TextEditingController nameInputContoller;
//   TextEditingController autherInputController;
//   TextEditingController priceInputController;
//   TextEditingController aboutInputController;
//   TextEditingController usernameInputController;
//   TextEditingController phonenoInputController;
//   TextEditingController depInputController;
//   TextEditingController collegeInputController;
//   //User _user = User.getdata(email);


//   //  setState((){

//   //         AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

//   //   });
  
//   String id;
//   final db = Firestore.instance;
//   final _formKey = GlobalKey<FormState>();
//   String title;
//   String about;
//   String author;
//   String price;
//   String usernamee;
//   String phonenoo;
//   String dep;
//   String coollege;
//   String rent;
//   String userId;
  

//   pickerCam() async {
//     File img = await ImagePicker.pickImage(source: ImageSource.camera);
//     if (img != null) {
//       image = img;
//       setState(() {});
//     }
//   }

//   pickerGallery() async {
//     File img = await ImagePicker.pickImage(source: ImageSource.gallery);
//     if (img != null) {
//       image = img;
//       setState(() {});
//     }
//   }

//   Widget divider() {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//       child: Container(
//         width: 0.8,
//         color: Colors.black,
//       ),
//     );
//   }

//   bool validateAndSave() {
     

//     final form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       return true;
//       //print('Form is valid,Email: $_email, Password: $_password');
//     } else {
//       //print('form is invalid,Email: $_email, Password: $_password');
//       return false;
//     }
//   }

//   Widget build(BuildContext context) {
//   AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
//   userId = authNotifier.user.email;
//   void createData() async {
//     DateTime now = DateTime.now();
//     String nuevoformato = DateFormat('kk:mm:ss:MMMMd').format(now);
//     var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
//     var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';

//     final StorageReference ref =
//         FirebaseStorage.instance.ref().child(fullImageName);
//     final StorageUploadTask task = ref.putFile(image);

//     var part1 =
//         'https://firebasestorage.googleapis.com/v0/b/bookbook-c6035.appspot.com/o/';

//     var fullPathImage = part1 + fullImageName2;
//     print(fullPathImage);

//     if (_formKey.currentState.validate() && validateAndSave()) {
//       _formKey.currentState.save();
//       DocumentReference ref = await db
//           .collection("cspit")
//           .document("department")
//           .collection(_dropDownValue)
//           .add({
//         'title': '$title',
//         'author': '$author',
//         'image': '$fullPathImage',
//         'price': '$price',
//         'about': '$about',
//         'username': '$usernamee',
//         'number': '$phonenoo',
//         'rent' : '$rent',
//         'userId': '$userId'
//       });
//       setState(() => id = ref.documentID);
//       //if()
//       Fluttertoast.showToast(
//           msg: "Item Uploaded",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIos: 1,
//           backgroundColor: Colors.grey,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       //Navigator.of(context).pop(); //return to the previous screen
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => AddProduct()));
//     }
// else{

//    Fluttertoast.showToast(
//           msg: "Invalid Inputs",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIos: 1,
//           backgroundColor: Colors.grey,
//           textColor: Colors.white,
//           fontSize: 16.0);
// }
//   }

//     return ListView(
//       padding: EdgeInsets.all(8),
//       children: <Widget>[
//         Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               // Card(
//               //   child: 
//               // )
//               Container(
//                 margin: EdgeInsets.all(15),
//                 height: 380,
//                 width: 400,
//                 child: Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   borderOnForeground: true,


//                   child: Column(children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(top: 28),
//                     height: 200.0,
//                     width: 200.0,
//                     decoration: new BoxDecoration(
//                       border: new Border.all(color: Colors.deepPurple),
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                     ),
//                     padding: new EdgeInsets.all(5.0),
//                     child: image == null
//                         ? Center(
//                             child: Text('Add Image',
//                                 style: TextStyle(
//                                   fontFamily: 'Montserrat',
//                                   fontSize: 20,
//                                 )),
//                           )
//                         : Image.file(image),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 25),
//                     child: RaisedButton(
//                       color: Colors.white,
//                       highlightElevation: 1,
//                       hoverElevation: 1,
//                       elevation: 1,
//                       hoverColor: Colors.white10,
//                       disabledElevation: 0.0,
//                       highlightColor: Colors.white,
//                       child: Container(
//                         height: 40.0,
//                         width: 160,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           shadowColor: Colors.deepPurple,
//                           color: Colors.deepPurple,
//                           elevation: 7.0,
//                           child: GestureDetector(
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),

//                             child: Center(
//                               child: Text(
//                                 'From Camera',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       onPressed: pickerCam,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(5),
//                     child: RaisedButton(
//                       color: Colors.white,
//                       highlightElevation: 0,
//                       hoverElevation: 0,
//                       elevation: 0,
//                       hoverColor: Colors.white10,
//                       disabledElevation: 0.0,
//                       highlightColor: Colors.white,
//                       child: Container(
//                         height: 40.0,
//                         width: 160,
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20.0),
//                           shadowColor: Colors.deepPurple,
//                           color: Colors.deepPurple,
//                           elevation: 7.0,
//                           child: GestureDetector(
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),

//                             child: Center(
//                               child: Text(
//                                 'From Galary',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Montserrat'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       onPressed: pickerGallery,
//                     ),
//                   )
//                 ]),
                  

//                 )
               
//                 // decoration: BoxDecoration(
//                 //   color: Colors.white,
//                 //   borderRadius: BorderRadius.circular(20.0),
//                 //   border: Border.all(color: Colors.grey.withOpacity(0.3)),
//                 // ),
                
//               ),

//               // new IconButton(
//               //   icon: new Icon(Icons.image), onPressed: pickerGallery),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: DropdownButton(

//                   iconEnabledColor: Colors.grey,
                 
//                   hint: _dropDownValue == null
//                       ? Text('DEPARTMENT')
//                       : Text(
//                           _dropDownValue,
//                           style: TextStyle(color: Colors.black,
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16,

//                           ),
//                         ),
//                   isExpanded: true,
//                   iconSize: 30.0,
//                   style: TextStyle(color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                    fontFamily: 'Montserrat',),
//                   items: ['computer', 'mechanical', 'civil', 'it'].map(
//                     (val) {
//                       return DropdownMenuItem<String>(
//                         value: val,
//                         child: Text(val),
//                       );
//                     },
//                   ).toList(),
//                   onChanged: (val) {
//                      setState(
//                        () {
//                         _dropDownValue = val;
//                        },
//                      );
//                   },
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       labelText: 'TITLE',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'Title Can not be empty' : null,
//                   onSaved: (value) => title = value,
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       labelText: 'AUTHOR',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'Author Can not be empty' : null,
//                   onSaved: (value) => author = value,
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       labelText: 'PRICE',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'Price Can not be empty' : null,
//                   onSaved: (value) => price = value,
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       labelText: 'RENT AMOUNT',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'Rent Can not be empty' : null,
//                   onSaved: (value) => rent = value,
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   //maxLines: 10,
//                   decoration: InputDecoration(
//                       labelText: 'ABOUT',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'About Can not be empty' : null,
//                   onSaved: (value) => about = value,
//                 ),
//               ),

              

//               // Container(
//               //   padding: EdgeInsets.all(10),
//               //   child: TextFormField(
//               //     decoration: InputDecoration(
//               //         labelText: 'DEPARTMENT',
//               //         labelStyle: TextStyle(
//               //             fontFamily: 'Montserrat',
//               //             fontWeight: FontWeight.bold,
//               //             color: Colors.grey),
//               //         focusedBorder: UnderlineInputBorder(
//               //             borderSide: BorderSide(color: Colors.deepPurple))),
//               //     validator: (_dropDownValue) =>
//               //         _dropDownValue.isEmpty ? 'Department Name Can not be empty' : null,
//               //     onSaved: (_dropDownValue) => dep = _dropDownValue,
//               //   ),
//               // ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                    initialValue: name,
//                   decoration: InputDecoration(
//                       labelText: 'USERNAME',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'Username Can not be empty' : null,
//                   onSaved: (value) => usernamee = value,
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   initialValue: email,
//                   decoration: InputDecoration(
//                       labelText: 'PHONENO',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'phoneno Can not be empty' : null,
//                   onSaved: (value) => phonenoo = value,
//                 ),
//               ),

//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   initialValue: college,
//                   decoration: InputDecoration(
//                       labelText: 'COLLEGE',
//                       labelStyle: TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepPurple))),
//                   validator: (value) =>
//                       value.isEmpty ? 'College Name Can not be empty' : null,
//                   onSaved: (value) => coollege = value,
//                 ),
//               ),

              

              
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.all(10),
//           child: RaisedButton(
//             color: Colors.white,
//             highlightElevation: 0,
//             hoverElevation: 0,
//             elevation: 0,
//             hoverColor: Colors.white10,
//             disabledElevation: 0.0,
//             highlightColor: Colors.white,
//             child: Container(
//               height: 40.0,
//               child: Material(
//                 borderRadius: BorderRadius.circular(20.0),
//                 shadowColor: Colors.deepPurple,
//                 color: Colors.deepPurple,
//                 elevation: 7.0,
//                 child: GestureDetector(
//                   // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),

//                   child: Center(
//                     child: Text(
//                       'UPLOAD',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Montserrat'),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             onPressed: createData,
//           ),
//         )
//       ],
//     );
//   }
// }
