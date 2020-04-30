// import 'package:bookmybook/app_screens/test.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// Map<dynamic, dynamic> cartProduct;
// List<dynamic> cartNameList;
// List<dynamic> cartQuantityList;
// DocumentSnapshot cart;

// class Cart extends StatefulWidget {
//   @override
//   _AddProductState createState() => _AddProductState();
// }

// class _AddProductState extends State<Cart> {
//   Icon searchIcon = new Icon(Icons.search);

//   Future<void> updateCart(var index) async {
//     final FirebaseUser user = await FirebaseAuth.instance.currentUser();
//     final String uid = user.uid.toString();
//     setState(() {
//       cartProduct.remove('${cartNameList[index]}');
//       cartNameList.removeAt(index);
//       cartQuantityList.removeAt(index);

//       Firestore.instance
//           .collection("cart")
//           .document(uid)
//           .updateData({'product': cartProduct});
//     });
//   }

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   if (cart == null) {
//   //     Center(
//   //       child: CircularProgressIndicator(),
//   //     );
//   //   } else {
//   //     getAddOnData();
//   //   }
//   // }

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();

//   //   getAddOnData();
//   // }

//   Future<void> getAddOnData() async {
//     FirebaseUser user = await FirebaseAuth.instance.currentUser();
//     String uid = user.uid;
//     cart = await Firestore.instance.collection('cart').document(uid).get();

//     setState(() {
//       cartProduct = cart.data['product'];
//       cartNameList = cartProduct.keys.toList();
//       cartQuantityList = cartProduct.values.toList();
//       // if (cartProduct == null) {
//       //   return Center(
//       //     child: Text('Empty'),
//       //   );
//       // }
//     });
//   }

//   // Widget displayData() {
//   //   return ListView.builder(
//   //       itemCount: cartProduct.length,
//   //       itemBuilder: (context, index) {
//   //         if(cartProduct.keys == null && cartProduct.values == null){
//   //           return Center(child: Text('Empty'),);
//   //         }
//   //         else{
//   //         return Dismissible(
//   //           key: UniqueKey(),
//   //           child: Card(
//   //             elevation: 3,
//   //             child: ListTile(
//   //               title: Text('${cartNameList[index]}'),
//   //               trailing: Text('${cartQuantityList[index]}'),
//   //             ),
//   //           ),
//   //           onDismissed: (direction) {
//   //             setState(() {
//   //               updateCart(index);
//   //             });
//   //           },
//   //         );}
//   //       });
//   // }

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
//             "Add to cart",
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
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Test()));
//                 }),
//           ],
//           backgroundColor: Colors.white,
//           leading: IconButton(
//             color: Colors.black,
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(Icons.arrow_back),
//           ),
//         ),
//         body:
//             Container(child: FutureBuilder(
//                 future: getAddOnData(),
//                 builder: (BuildContext context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else {
//                 return ListView.builder(
//                   itemCount:  cartProduct.length,
//                   // gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                   //     crossAxisCount: 2, childAspectRatio: 0.80),
//                   itemBuilder: (BuildContext context, int index) {

//                     return Dismissible(
//             key: UniqueKey(),
//             child: Card(
//               elevation: 3,
//               child: ListTile(
//                 title: Text(cartNameList[index]),
//                 trailing: Text(cartQuantityList[index]),
//               ),
//             ),
//             onDismissed: (direction) {
//               setState(() {
//                 updateCart(index);
//               });
//             },
//           );
//                     // return Container(
//                     //     height: (MediaQuery.of(context).size.width / 2),
//                     //     width: (MediaQuery.of(context).size.width / 2) - 20.0,

//                     //     child: Card(
//                     //         elevation: 5,
//                     //         shape: RoundedRectangleBorder(
//                     //             borderRadius: BorderRadius.circular(10)),
//                     //         borderOnForeground: true,

//                     //         child: Material(
//                     //             child: InkWell(
//                     //            onTap: () {
//                     //           //   foodNotifier.currentBook = foodNotifier.bookList[index];
//                     //           //   Navigator.of(context).push(
//                     //           //       MaterialPageRoute(builder: (BuildContext context) {
//                     //           //     return Thing();
//                     //           //   }));
//                     //           },
//                     //           // navigateToDetail(snapshot.data[index]),

//                     //           child: Column(
//                     //             children: <Widget>[
//                     //               Container(
//                     //                 padding: EdgeInsets.only(top: 15),
//                     //                 child: Stack(children: <Widget>[
//                     //                   Container(
//                     //                     height: 160.0,
//                     //                     child: InkResponse(
//                     //                       child: Image.network(
//                     //                           // cartProduct.bookList[index].image !=null
//                     //                           //   ? cartProduct.bookList[index].image
//                     //                             //:
//                     //                             'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                     //                       ),
//                     //                     ),
//                     //                     decoration: BoxDecoration(
//                     //                       borderRadius: BorderRadius.only(
//                     //                           topLeft: Radius.circular(10.0),
//                     //                           topRight: Radius.circular(10.0)),
//                     //                     ),
//                     //                   )
//                     //                 ]),
//                     //               ),
//                     //               Container(
//                     //                 padding: EdgeInsets.only(top: 15),
//                     //                 child: Text(
//                     //                  cartNameList[index] ?? '',
//                     //                   textAlign: TextAlign.center,
//                     //                   style: TextStyle(
//                     //                       color: Colors.black,
//                     //                       fontSize: 14.0,
//                     //                       fontFamily: 'Montserrat'),
//                     //                 ),
//                     //               ),
//                     //               Container(
//                     //                 padding: EdgeInsets.only(top: 5),
//                     //                 child: Text(
//                     //                   cartQuantityList[index] ?? '',
//                     //                   textAlign: TextAlign.center,
//                     //                   style: TextStyle(
//                     //                       color: Colors.black,
//                     //                       fontSize: 14.0,
//                     //                       fontFamily: 'Montserrat'),
//                     //                 ),
//                     //               ),
//                     //             ],
//                     //           ),
//                     //         ))));
//                   },
//                   physics: ClampingScrollPhysics(),
//                 );
//               }
//             })),

//         //     Container(
//         //   height: 300,
//         //   child: displayData(),
//         // ),
//       ),
//     );
//   }
// }

import 'package:bookmybook/app_screens/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<dynamic, dynamic> cartProduct;
List<dynamic> cartNameList;
List<dynamic> cartQuantityList;
DocumentSnapshot cart;

class Cart extends StatefulWidget{
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<Cart> {
  Icon searchIcon = new Icon(Icons.search);

  Future<void> updateCart(var index) async{
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    setState(() {

      cartProduct.remove('${cartNameList[index]}');
      cartNameList.removeAt(index);
      cartQuantityList.removeAt(index);

      Firestore.instance.collection("cart").document(uid).updateData({'product': cartProduct});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddOnData();
  }

  Future<void> getAddOnData() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    cart = await Firestore.instance.collection('cart').document(uid).get();

    setState(() {
      cartProduct=cart.data['product'];
      cartNameList= cartProduct.keys.toList();
      cartQuantityList = cartProduct.values.toList();
    });
  }

  Widget displayData(){
   return Container(child: FutureBuilder(
               // future: getAddOnData(),
                builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
    return ListView.builder(
      itemCount: cartProduct.length,
      itemBuilder: (context, index){
        return Dismissible(key: UniqueKey(), child: Card(
          elevation: 3,
          child: ListTile(
            title: Text('${cartNameList[index]}'),
            trailing: Text('${cartQuantityList[index]}'),
          ),
        ),
        onDismissed: (direction){
          setState(() {
            updateCart(index);
          });
        },
         );
      }
    );
              }}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            elevation: 5,
            color: ThemeData.light().canvasColor,
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Add to cart",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,

              // fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: new IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                icon: searchIcon,
                color: Colors.black,
                onPressed: () {
                  heroTag:
                  "search";
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Test()));
                }),
          ],
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),

        body: Container(
          height: 300,
          child: displayData(),
        ),
      ),
    );
  }

}
