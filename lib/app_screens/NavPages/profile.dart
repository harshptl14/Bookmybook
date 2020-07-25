import 'package:bookmybook/api/book_api.dart';
import 'package:bookmybook/api/user_api.dart';
import 'package:bookmybook/app_screens/NavPages/Upload.dart';
import 'package:bookmybook/app_screens/displayproduct/productEdit.dart';
import 'package:bookmybook/app_screens/initialPages/login.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//User user;

class Profile extends StatefulWidget {
  final VoidCallback onSignedOut;
  const Profile({
    Key key,
    this.onSignedOut,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //List<Color> _colors = [Colors.deepPurple, Colors.deepPurpleAccent];
  //List<double> _stops = [0.0, 0.7];
  DocumentSnapshot snapshot;
  //User _user = User();
  Size size;

  @override
  void initState() {
    print(userr.name);
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    getBooksForUser(foodNotifier);
    //getBooks(foodNotifier);
    //getUser(authNotifier);

    super.initState();
  }

  // User user = User();
  // FirebaseUser userr;

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    //BookNotifier foodNotifier = Provider.of<BookNotifier>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor:
            //Colors.white30,
            Color.fromRGBO(247, 252, 254, 1),
        //   appBar: AppBar(
        // //     flexibleSpace: Container(
        // //       decoration: BoxDecoration(
        // //         gradient: LinearGradient(
        // //           begin: Alignment.topLeft,
        // //             end: Alignment.bottomRight,
        // //             colors: <Color>[
        // //           Colors.lightBlue,
        // //           Colors.deepPurple
        // //         ])
        // //      ),
        // //  ),
        //     elevation: 0.0,
        //     backgroundColor: Color.fromRGBO(205,184,255, 1),
        //     leading: IconButton(
        //       color: Colors.black,
        //       onPressed: () {
        //         Navigator.push(
        //             context, MaterialPageRoute(builder: (context) => element()));
        //       },
        //       icon: Icon(Icons.arrow_back),
        //     ),
        //     actions: <Widget>[
        //       IconButton(
        //           icon: Icon(Icons.settings),
        //           color: Colors.black,
        //           onPressed: () {
        //             heroTag:
        //             "search";
        //             Navigator.push(
        //                 context, MaterialPageRoute(builder: (context) => Test()));
        //           }),
        //     ],
        //   ),
        body: Container(
            child: FutureBuilder(
                future: getUserr(),
                //getUser(authNotifier),
                //stream: getUserr(),

                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    print("NAME");
                    print(snapshot.data['name']);

                    return ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(
                          height: 250,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              topBar(250),
                              Positioned(
                                top: 200,
                                child: Container(
                                  width: width * 0.9,
                                  margin:
                                      EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 25,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Stack(children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  25.0, 25.0, 50.0, 25.0),
                                              child: Image(
                                                  height: 55,
                                                  width: 55,
                                                  image: AssetImage(
                                                      'depimages/user.png')),
                                            ),
                                            SizedBox(width: 100.0),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  100.0, 37.0, 25.0, 25.0),
                                              child: Text(
                                                //authNotifier.userList[0].name ?? '',
                                                //userr.name ?? '',
                                                //snapshot.data.documents[0]['name'],
                                                snapshot.data["name"],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            )
                                          ])
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Stack(children: <Widget>[
                          Container(
                            height: height * 0.5,
                            child: Card(
                              elevation: 25,
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              margin:
                                  EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        height: 70,
                                        margin: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 10.0, 0.0),
                                        child: ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text(
                                              //authNotifier.userList[0].number ?? "Null",
                                              //userr.number ?? '',
                                              //snapshot.data.documents[0]['number'],
                                              snapshot.data["number"],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Montserrat',
                                              )),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        height: 70,
                                        margin: EdgeInsets.fromLTRB(
                                            10.0, 70.0, 10.0, 0.0),
                                        child: ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text(
                                              //authNotifier.userList[0].email ?? '',
                                              //userr.email ?? '',
                                              //snapshot.data.documents[0]['email'],
                                              snapshot.data["email"],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Montserrat',
                                              )),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        height: 70,
                                        margin: EdgeInsets.fromLTRB(
                                            10.0, 130.0, 10.0, 0.0),
                                        child: ListTile(
                                          leading: Icon(Icons.school),
                                          title: Text(
                                              //authNotifier.userList[0].college ?? '',
                                              //userr.college ?? '',
                                              //snapshot.data.documents[0]['college'],
                                              snapshot.data["college"],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Montserrat',
                                              )),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 210),
                                          height: 40.0,
                                          width: 160,
                                          alignment: Alignment.center,
                                          color: Colors.transparent,
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.deepPurple,
                                                    style: BorderStyle.solid,
                                                    width: 1.0),
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: InkWell(
                                              onTap: () =>
                                                  signout(authNotifier),
                                              child: Center(
                                                child: Text('LOGOUT',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat')),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ])
                                  ]),
                            ),
                          )
                        ]),
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.only(top: 20.0, left: 20.0),
                          child: Text(
                            "Your Uploads",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 500,
                          child: ListPage(),
                        ),
                      ],
                    );
                  }
                })));
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.white,
      child: Center(
          child: Text(
        'Profile',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 25,
          letterSpacing: 1,
        ),
      )),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  void initState() {
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    getBooksForUser(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier = Provider.of<BookNotifier>(context);

    return Scaffold(
      body: Container(child: FutureBuilder(
          //  future: getPoasts(),
          builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            itemCount: foodNotifier.bookList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.70),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: (MediaQuery.of(context).size.width / 2),
                width: (MediaQuery.of(context).size.width / 2) ,
                child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    borderOnForeground: true,
                    child: Material(
                        child: InkWell(
                      onTap: () {
                        foodNotifier.currentBook = foodNotifier.bookList[index];
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ThingForEdit();
                        }));
                      },
                      child: Column(  
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Stack(children: <Widget>[
                              Container(
                                height: 200.0,
                                child: InkResponse(
                                  child: Image.network(
                                    foodNotifier.bookList[index].image != null
                                        ? foodNotifier.bookList[index].image
                                        : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0)),
                                ),
                              )
                            ]),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              foodNotifier.bookList[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              foodNotifier.bookList[index].price,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ],
                      ),
                    ))),
              );
            },
            physics: ClampingScrollPhysics(),
          );
        }
      })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () {
          foodNotifier.currentBook = null;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Upload(
                        isUpdating: false,
                      )));
        },
      ),
    );
  }
}
