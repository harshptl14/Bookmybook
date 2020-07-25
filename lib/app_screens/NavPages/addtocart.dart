
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Map<dynamic, dynamic> cartProduct;
List<dynamic> cartNameList;
List<dynamic> cartQuantityList;
DocumentSnapshot cart;

class Cart extends StatefulWidget {
    const Cart({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<Cart> {
  Icon searchIcon = new Icon(Icons.search);

  Future<void> updateCart(var index) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
    setState(() {
      cartProduct.remove('${cartNameList[index]}');
      cartNameList.removeAt(index);
      cartQuantityList.removeAt(index);

      Firestore.instance
          .collection("cart")
          .document(uid)
          .updateData({'product': cartProduct});
    });
  }
  bool state;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddOnData();
  }

  Future<void> getAddOnData() async {
    setState(() {
      state = false;
    });
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    cart = await Firestore.instance.collection('cart').document(uid).get();

    setState(() {
      cartProduct=cart.data['product'];
      cartNameList= cartProduct.keys.toList();
      cartQuantityList = cartProduct.values.toList();
      state = true;
    });

    //return cart;
  }

  Widget displayData() {
    return Container(
        child: 
        // FutureBuilder(
        //     future: getAddOnData(),
        //     builder: (BuildContext context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         //print(snapshot.data.cartNameList[0]);
        //         return Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else {
                  (state == false) ? Center( child: SizedBox( height: 30,
                  width:30,
                  child: CircularProgressIndicator())) :
                 ListView.builder(
                    itemCount: cartProduct.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(
                                '${cartNameList[index]}'),
                            trailing: Text(
                                '${cartQuantityList[index]}'),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            updateCart(index);
                          });
                        },
                      );
                    }
                    ),
              //}
            );
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
