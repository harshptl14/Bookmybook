import 'package:bookmybook/api/search_service.dart';
import 'package:bookmybook/app_screens/displayproduct/SearchProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

bool displayImage = true;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
        displayImage = true;
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      searchService().searchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element['title'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
            displayImage = false;
            print(displayImage);
          });
        } else {
          // hasnoData(element);
          setState(() {
            displayImage = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 60,
            width: 430,
            //color: Colors.deepPurple,
            child: Card(
              elevation: 5,
              child: TextField(
                autocorrect: true,
                //maxLines: maxLines,
                textAlign: TextAlign.start,
                cursorColor: Colors.deepPurple,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    height: 1.2),
                autofocus: true,
                onChanged: (value) {
                  initiateSearch(value);
                },
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  contentPadding: EdgeInsets.only(top: 15),
                  hintText: 'Search by title',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 18),
                  //border: OutlineInputBorder(
                  // borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  border: InputBorder.none,
                  // ),
                ),
              ),
            ),
          ),
          displayImage == true
              ? Container(
                padding: EdgeInsets.only(top: 150),
                margin: EdgeInsets.all(70),
                  child: Center(
                    child: Image.asset('images/search.PNG'),
                  ),
                )
              : Container(),
          GridView.count(
            padding: EdgeInsets.only(left: 10, right: 10),
            crossAxisCount: 2,
            childAspectRatio: 6.5 / 9.0,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            primary: false,
            shrinkWrap: true,
            children: tempSearchStore.map((element) {
              return buildResultCard(element);
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Widget hasnoData(element) {
  //   if (element == null) {
  //     return Center(
  //       child: Image.asset('images/search.PNG'),
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  // void nextPage(){
  //    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchThing(element)));
  // }

  navigateToDetail(dynamic data) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchThing(data)));
  }

  Widget buildResultCard(data) {
    return Container(
        height:
            //animation.value,
            (MediaQuery.of(context).size.width / 2),
        width:
            //animation.value,
            (MediaQuery.of(context).size.width / 2) - 20.0,
        // Card(
        //   elevation: 2.0,
        //   child: Column(
        //     children: [
        //       GestureDetector(
        //                 onTap: () =>  navigateToDetail(data[index]),
        //                 child: Container(
        //           child: Text(data['title'],
        //           style: TextStyle(

        //             color: Colors.black,
        //             fontSize: 20.0,
        //           ),),
        //         ),
        //       ),
        //       Container(
        //         child: Text(data['author'],
        //         style: TextStyle(

        //           color: Colors.black,
        //           fontSize: 20.0,
        //         ),),
        //       ),
        //     ],
        //   ),
        // );

        // GridView.builder(
        //                 itemCount: data.length,
        //                 gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2, childAspectRatio: 0.80),
        //                 itemBuilder: (_, index) {
        //                   return Container(
        //                       height: (MediaQuery.of(context).size.width / 2),
        //                       width: (MediaQuery.of(context).size.width / 2) - 20.0,
        //                       decoration: BoxDecoration(
        //                           color: Colors.white10,
        //                           borderRadius: BorderRadius.circular(5.0),
        //                           boxShadow: [
        //                             BoxShadow(
        //                                 color: Colors.grey.withOpacity(0.3),
        //                                 spreadRadius: 1.0,
        //                                 //blurRadius: 2.0
        //                                 )
        //                           ]),
        //                       child: Material(
        //                           child: InkWell(
        //                         onTap: () => navigateToDetail(data),
        //                         child: Column(
        //                           children: <Widget>[

        //                             Container(
        //                               padding: EdgeInsets.only(top:30),
        //                               child: Stack(children: <Widget>[
        //                               // Container(
        //                               //     height: 400.0,
        //                               //     child: prefix0.Carousel(
        //                               //       boxFit: BoxFit.scaleDown,
        //                               //       images: [
        //                               //         Image.network(
        //                               //           snapshot.data[index].data["image"],
        //                               //           fit: BoxFit.fitHeight,
        //                               //         ),
        //                               //       ],
        //                               //     )),

        //                               Container(
        //                                 height: 150.0,
        //                                 child: InkResponse(
        //                                   //child: Image.network('${data["image"]}' + '?alt=media'),
        //                                 ),
        //                                 decoration: BoxDecoration(
        //                                     borderRadius: BorderRadius.only(
        //                                         topLeft: Radius.circular(10.0),
        //                                         topRight: Radius.circular(10.0)),
        //                                    ),

        //                               )
        //                             ]),
        //                             ),

        //                             Container(
        //                               padding: EdgeInsets.only(top: 40),
        //                               child: Text(
        //                                // snapshot.data[index],
        //                                //snapshot.data,
        //                                 data["title"],
        //                                 //snapshot.data[index].data["title"],
        //                                 textAlign: TextAlign.center,
        //                                 style: TextStyle(
        //                                     color: Colors.black,
        //                                     fontSize: 14.0,
        //                                     fontFamily: 'Montserrat'),
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       )));
        //                   //  return ListTile(
        //                   //    title: Text(snapshot.data[index].data["title"]),
        //                   //    onTap: () => navigateToDetail(snapshot.data[index]),
        //                   //  );
        //                 },
        //                 physics: ClampingScrollPhysics(),
        //               );

        // GridView.builder(
        // itemCount: data.length,
        // gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2, childAspectRatio: 0.80),
        // itemBuilder: (BuildContext context, int index) {
        //   return Container(
        //       height:
        //           //animation.value,
        //           (MediaQuery.of(context).size.width / 2),
        //       width:
        //           //animation.value,
        //           (MediaQuery.of(context).size.width / 2) - 20.0,
        //       child:
        child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            borderOnForeground: true,
            child: Material(
                child: InkWell(
              onTap: () => navigateToDetail(data),
              // navigateToDetail(snapshot.data[index]),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Stack(children: <Widget>[
                          Container(
                            height: 150.0,
                            child: InkResponse(
                              child: Image.network(
                                data['image'] != null
                                    ? data['image']
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
                          data['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          data['price'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))));
  }
}
