import 'dart:core' as prefix1;
import 'dart:core';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:carousel_pro/carousel_pro.dart' as prefix0;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookmybook/app_screens/test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
    child: Container(
      width: 0.8,
    ),
  );
}

var Map = <dynamic, dynamic>{};

class Thing extends StatefulWidget {
  @override
  _thingState createState() => _thingState();
}

class _thingState extends State<Thing> {

  // Future<void> getcart() async {
  //   FirebaseUser user = await FirebaseAuth.instance.currentUser();
  //   String uid = user.uid;
  //   DocumentSnapshot snapshot =
  //       await Firestore.instance.collection('cart').document(uid).get();

  //   setState(() {
  //     Map = snapshot.data['product'];
  //   });
  // }

    Future<void> getcart()async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    DocumentSnapshot snapshot = await Firestore.instance.collection('cart').document(uid).get();

    setState(() {
      Map = snapshot.data['product'];
      
    });
  }

  Icon searchIcon = new Icon(Icons.search);
  Icon bookIcon = new Icon(Icons.bookmark);
  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier = Provider.of<BookNotifier>(context);

    //String hello=foodNotifier.currentBook.number.toString();
    Future<void> _launched;
    String _phone = foodNotifier.currentBook.number.toString();

    Future<void> _makePhoneCall(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Widget imageCarousel = new Container(
        height: 400.0,
        child:  prefix0.Carousel(
              boxFit: BoxFit.contain,
              images: [
                Image.network(
                //   ('${foodNotifier.currentBook.image}' + '?alt=media') != null
                //       ? ('${foodNotifier.currentBook.image}' + '?alt=media')
                //       : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                  foodNotifier.currentBook.image != null
                      ? foodNotifier.currentBook.image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                 )
              ],
              autoplay: false,
              dotBgColor: Colors.white10,
              dotSize: 5,
              dotIncreasedColor: Colors.black,
              dotColor: Colors.grey,
              dotIncreaseSize: 2,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
            ));
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 420.0,
            floating: false,
            pinned: true,
            snap: false,
            leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16, right: 90),
                child: Text(
                  "BookMyBook",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,

                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                  icon: searchIcon,
                  color: Colors.black,
                  onPressed: () {
                    heroTag:
                    "search";
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Test()));
                  }),
              IconButton(icon: bookIcon, color: Colors.black, onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: new ListView(children: <Widget>[imageCarousel]),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 50,
                  margin: EdgeInsets.only(top: 3),
                  child: ListTile(
                    title: Text(foodNotifier.currentBook.title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                        )),
                    trailing: Text(foodNotifier.currentBook.price ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                        )),
                    subtitle: Text(foodNotifier.currentBook.author ?? '',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  height: 50,
                  child: ListTile(
                    title: Text('about',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                        )),
                    subtitle: Text(foodNotifier.currentBook.about ?? '',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  color: Colors.white,
                  height: 70,
                  child: ListTile(
                    leading: Image(
                        height: 55,
                        width: 55,
                        image: AssetImage('depimages/user.png')),
                    title: Text(foodNotifier.currentBook.username ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        )),
                    subtitle:
                        Text(foodNotifier.currentBook.number.toString() ?? '',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 35),
                  color: Colors.white,
                  height: 70,
                  child: ListTile(
                    leading: Image(
                        height: 55,
                        width: 55,
                        image: AssetImage('depimages/rent.png')),
                    title: Text('You can rent this book per month at',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        )),
                    subtitle:
                        Text(foodNotifier.currentBook.rent.toString() ?? '',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                  height: 30.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 25),
                            height: 50,
                            width: 200.5,
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.swap_horizontal_circle,
                                size: 30,
                                color: Colors.grey,
                              ),
                              divider(),
                              Text(
                                '''Help
Community''',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ])),
                        Container(
                            padding: EdgeInsets.only(left: 35),
                            height: 50,
                            width: 190.5,
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.people,
                                size: 30,
                                color: Colors.grey,
                              ),
                              divider(),
                              Text(
                                '''Share
Books''',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ])),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  height: 30.0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 25),
                            height: 50,
                            width: 200.5,
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.contact_phone,
                                size: 30,
                                color: Colors.grey,
                              ),
                              divider(),
                              Text(
                                '''Improve
Communication''',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ])),
                        Container(
                            padding: EdgeInsets.only(left: 35),
                            height: 50,
                            width: 190.5,
                            child: Row(children: <Widget>[
                              Icon(
                                Icons.monetization_on,
                                size: 30,
                                color: Colors.grey,
                              ),
                              divider(),
                              Text(
                                '''Save
Money''',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ])),
                      ]),
                ),
              ]),
              itemExtent: 150.0)
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 15,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: 55.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 192.5,
                    child: InkWell(
                      onTap: () {
                        Map[foodNotifier.currentBook.title] =
                            foodNotifier.currentBook.price.toString();
                        putdata();
                        toast();
                      },
                      child: Text(
                        'ADD TO BAG',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  color: Colors.deepPurple,
                  child: InkWell(
                    //onTap: () => navigateToDetail(snapshot.data[index]),
                    onTap: () => setState(() {
                      _launched = _makePhoneCall('tel:$_phone');
                    }),
                    child: Text(
                      'BUY / RENT',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Future putdata() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    var product = <String, Object>{};
    product['product'] = Map;

    Firestore.instance.collection('cart').document(uid).updateData(product);
  }

  void toast() {
    Fluttertoast.showToast(
        msg: "Added to bag",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
