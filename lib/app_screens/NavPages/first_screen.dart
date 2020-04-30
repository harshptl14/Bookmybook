import 'package:bookmybook/api/book_api.dart';
import 'package:bookmybook/api/user_api.dart';
import 'package:bookmybook/app_screens/NavPages/NewProduct.dart';
import 'package:bookmybook/models/user.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookmybook/app_screens/displayproduct/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//QuerySnapshot qn;

class element extends StatelessWidget {
  // final VoidCallback college;
  // const element({
  //   Key key,
  //   this.college,
  // });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Carousel();
  }
}

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  Icon searchIcon = new Icon(Icons.search);
  Icon bookIcon = new Icon(Icons.bookmark);
  Icon navigatebarIcon = new Icon(Icons.desktop_windows);
  PageController _pageController;
  int currentPage = 0;
  final imageList = [
    "images/cssbook.jpg",
    "images/javabook.png",
    "images/phpbook.jpg",
    "images/nodejsbook.jpeg",
    "images/csharbook.png",
  ];

  User _user = User();
  @override
  void initState() {
    super.initState();

    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    getBooksForHomescreen(foodNotifier);

    _pageController = PageController(
      initialPage: currentPage,
      keepPage: true,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier = Provider.of<BookNotifier>(context);
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        elevation: 5,
        color: ThemeData.light().canvasColor,
      )),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "BookMyBook",
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
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => display()));
                }),
            IconButton(icon: bookIcon, color: Colors.black, onPressed: () {}),
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "New Books",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 300,
                    child: PageView.builder(
                        itemCount: imageList.length,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return animateItemBuilder(index);
                        }),
                  ),
                ),

                //Corosuel(),

                Padding(
                  padding: const EdgeInsets.only(right: 210),
                  child: Text(
                    "Recently Added",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                      height: (foodNotifier.bookList.length * 3) * 42.0,
                      child: FutureBuilder(builder: (_, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return GridView.builder(
                            itemCount: foodNotifier.bookList.length,
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.80),
                            itemBuilder: (_, index) {
                              return Card(
                                  elevation: 5,
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(5)),
                                  borderOnForeground: true,
                                  child: Container(
                                      //padding: EdgeInsets.all(5),
                                      height:
                                          (MediaQuery.of(context).size.width /
                                              2),
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20.0,
                                      decoration: BoxDecoration(
                                          //color: Colors.white10,

                                          // borderRadius: BorderRadius.circular(5.0),

                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.grey
                                          //           .withOpacity(0.3),
                                          //       spreadRadius: 1.0,
                                          //       blurRadius: 0.0)
                                          // ]
                                          ),
                                      child: Material(
                                          child: InkWell(
                                        onTap: () {
                                          foodNotifier.currentBook =
                                              foodNotifier.bookList[index];
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return Thing();
                                          }));
                                        },
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              color: Colors.white10,
                                              child: Stack(children: <Widget>[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 30),
                                                  height: 150.0,
                                                  child: InkResponse(
                                                    child: Image.network(
                                                      // ('${foodNotifier.bookList[index].image}' +
                                                      //             '?alt=media') !=
                                                      //         null
                                                      //     ? ('${foodNotifier.bookList[index].image}' +
                                                      //         '?alt=media')
                                                      //     : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                                      foodNotifier
                                                                  .bookList[
                                                                      index]
                                                                  .image !=
                                                              null
                                                          ? foodNotifier
                                                              .bookList[index]
                                                              .image
                                                          : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                                      height: 200,
                                                      width: 180,
                                                    ),
                                                  ),
                                                  // decoration: BoxDecoration(
                                                  //     borderRadius: BorderRadius.only(
                                                  //         topLeft: Radius.circular(10.0),
                                                  //         topRight: Radius.circular(10.0)),
                                                  //    ),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                              //color: Colors.white,
                                              padding: EdgeInsets.only(top: 35),
                                              child: Text(
                                                foodNotifier
                                                    .bookList[index].title,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                            Container(
                                              //color: Colors.white,
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                foodNotifier
                                                    .bookList[index].price,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))));
                            },
                            physics: ClampingScrollPhysics(),
                          );
                        }
                      })),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  animateItemBuilder(int index) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
          }

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * 250,
              width: Curves.easeOut.transform(value) * 250,
              child: child,
            ),
          );
        },
        child: Container(
            child: Card(
                elevation: 5,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewThing()));
                  },
                  child: Image.asset(imageList[index], fit: BoxFit.fill),
                ))));
  }
}
