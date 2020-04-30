import 'package:bookmybook/app_screens/displayproduct/productlist.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuerySnapshot object;
String computer = 'computer';
String civil = 'civil';
String mechanical = 'mechanical';
String ec = 'ec';
// List<String> arr = [
//   'computer',
//   'civil',
//   'mechanical',
// ];
// Function computer1(int i){
//   return arr[i];
// }
String name = ' ';
String email= ' ', mobile = ' ', college =' ';
class ProductList extends StatefulWidget {
  const ProductList({Key key, this.ontap}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
  final VoidCallback ontap;
}

class _CategoriesState extends State<ProductList> {
  Icon searchIcon = new Icon(Icons.search);
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Firestore.instance.collection('computer').getDocuments().then((results) {
      
  //     setState(() {
  //       object = results;
  //     });
  //   });
  // }

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
            "Categories",
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
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => element()));
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body:

        ListView(children: <Widget>[

          Container(
          padding: EdgeInsets.only(left:10, right: 10, top: 20, bottom: 10),
            height: 200,
            width: 620,
           
            child: Card(
                elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            borderOnForeground: true,
              
             // color: Colors.white,
              // decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20.0),
              //               border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              // ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom(depname: computer,)));
                    //ListPage(dep: computer,);
                    //print(computer1(1));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/cedep.jpg'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      'Computer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Card(
               elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            borderOnForeground: true,
              // decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20.0),
              //               border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              // ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom(depname: civil,)));
                    //ListPage(dep: civil,);
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/civildep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      'Civil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Card(
               elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            borderOnForeground: true,
              //  decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20.0),
              //               border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              // ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom(depname: ec)));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/ecdep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      'EC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Card(
               elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            borderOnForeground: true,
              //  decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20.0),
              //               border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              // ),
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductsCom(depname: mechanical,)));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/mechdep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      'Mechanical',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Card(
               elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            borderOnForeground: true,
              //  decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20.0),
              //               border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              // ),
                child: InkWell(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ProductsCom()));
              // },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/itdep.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      'Information technology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),


            Container(
          padding: EdgeInsets.all(10),
            height: 200,
            width: 620,
           
            child: Card(
               elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            borderOnForeground: true,
              //  decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20.0),
              //               border: Border.all(color: Colors.grey.withOpacity(0.3)),
                            
              // ),
                child: InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ProductsCom()));
              },
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage('depimages/mechdept1.PNG'),
                              fit: BoxFit.fitHeight)),
                    )
                  ]),
                  Container(
                    padding: EdgeInsets.only(top: 7),
                    child: Text(
                      'Mechatonics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
            ))),

        ],) 
        
        
      ),
    );
  }
}
