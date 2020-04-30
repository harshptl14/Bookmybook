import 'package:bookmybook/api/book_api.dart';
import 'package:bookmybook/app_screens/displayproduct/product.dart';
import 'package:bookmybook/app_screens/test.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsCom extends StatefulWidget {
   //final VoidCallback depname;
   final String depname;
   //final String dep;
   const ProductsCom({Key key, this.depname,});
   
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<ProductsCom> {
  Icon searchIcon = new Icon(Icons.search);

  //var queryResultSet = [];
    void initState() {
    print(widget.depname);
    BookNotifier foodNotifier =
    Provider.of<BookNotifier>(context, listen: false);
    getBooks(foodNotifier, widget.depname);
    super.initState();
  }
  // var tempSearchStore = [];

  // initiateSearch(value){
  //   if(value.length == 0){
  //     setState(() {
  //       queryResultSet = [];
  //       tempSearchStore = [];
  //     });
  //   }
  

  // var capitalizedValue = value.substring(0, 1).toUpperCase() + value.substring(1);

  // if(queryResultSet.length == 0 && value.length == 1){
  //   searchService().searchByName(value).then( (QuerySnapshot docs){
  //     for(int i = 0; i<docs.documents.length; i++){
  //       queryResultSet.add(docs.documents[i].data); 
  //     }
  //   });
   
  // }else{
  //     tempSearchStore = [];
  //     queryResultSet.forEach((element){
  //       if(element['title'].startsWith(capitalizedValue)){
  //         setState(() {
  //           tempSearchStore.add(element);
  //         });
  //       }
  //     });   
  //   }

  // }

  @override
  Widget build(BuildContext context) {
        BookNotifier foodNotifier = Provider.of<BookNotifier>(context);

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
            "Products",
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
                  //showSearch(context: context, delegate: DataSearch());
                  //initiateSearch(value);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Search()));
                }
                ),
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
        


        body: Container(child: FutureBuilder(
          //future: getBooks(foodNotifier),
        builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          itemCount: foodNotifier.bookList.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.80),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: (MediaQuery.of(context).size.width / 2),
                width: (MediaQuery.of(context).size.width / 2) - 20.0,
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
                          return Thing();
                        }));
                      },
                      // navigateToDetail(snapshot.data[index]),

                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Stack(children: <Widget>[
                              Container(
                                height: 160.0,
                                child: InkResponse(
                                  child: Image.network(
                                    // ('${foodNotifier.bookList[index].image}' +
                                    //             '?alt=media') !=
                                    //         null
                                    //     ? ('${foodNotifier.bookList[index].image}' +
                                    //         '?alt=media')
                                    //     : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                      foodNotifier.bookList[index].image !=null
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
                    ))));
          },
          physics: ClampingScrollPhysics(),
        );
      }
    }))
        //ListPage(arr : widget.arr), //Container(
      ),
    );
    //     floatingActionButton: FloatingActionButton(
    //     backgroundColor: Colors.deepPurple,
    //     onPressed: () {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => Search(
    //                     initiateSearch(),
    //                   )));
    //     },
    // );
  }

  
}

// class ListPage extends StatefulWidget {
//   final List<String> arr;
//   const ListPage({Key key, this.arr,});
//   @override
//   _ListPageState createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//   void initState() {
//     print(widget.arr);
//     BookNotifier foodNotifier =
//         Provider.of<BookNotifier>(context, listen: false);
//     getBooks(foodNotifier, widget.arr);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     BookNotifier foodNotifier = Provider.of<BookNotifier>(context);
    
//     return Container(child: FutureBuilder(
//           //future: getBooks(foodNotifier),
//         builder: (BuildContext context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       } else {
//         return GridView.builder(
//           itemCount: foodNotifier.bookList.length,
//           gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, childAspectRatio: 0.80),
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//                 height: (MediaQuery.of(context).size.width / 2),
//                 width: (MediaQuery.of(context).size.width / 2) - 20.0,
//                 child: Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     borderOnForeground: true,
//                     child: Material(
//                         child: InkWell(
//                       onTap: () {
//                         foodNotifier.currentBook = foodNotifier.bookList[index];
//                         Navigator.of(context).push(
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return Thing();
//                         }));
//                       },
//                       // navigateToDetail(snapshot.data[index]),

//                       child: Column(
//                         children: <Widget>[
//                           Container(
//                             padding: EdgeInsets.only(top: 15),
//                             child: Stack(children: <Widget>[
//                               Container(
//                                 height: 160.0,
//                                 child: InkResponse(
//                                   child: Image.network(
//                                     // ('${foodNotifier.bookList[index].image}' +
//                                     //             '?alt=media') !=
//                                     //         null
//                                     //     ? ('${foodNotifier.bookList[index].image}' +
//                                     //         '?alt=media')
//                                     //     : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                                       foodNotifier.bookList[index].image !=null
//                                         ? foodNotifier.bookList[index].image
//                                         : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(10.0),
//                                       topRight: Radius.circular(10.0)),
//                                 ),
//                               )
//                             ]),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 15),
//                             child: Text(
//                               foodNotifier.bookList[index].title,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14.0,
//                                   fontFamily: 'Montserrat'),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(top: 5),
//                             child: Text(
//                               foodNotifier.bookList[index].price,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 14.0,
//                                   fontFamily: 'Montserrat'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ))));
//           },
//           physics: ClampingScrollPhysics(),
//         );
//       }
//     }));
//   }
// }

// class DataSearch extends SearchDelegate<String>{
//   @override
//   // List<Widget> buildActions(BuildContext context) {
//   //   // TODO: implement buildActions

//   //       void initState() {
//   //   BookNotifier foodNotifier =
//   //       Provider.of<BookNotifier>(context, listen: false);

//   //   getBooks(foodNotifier);
//   //   // AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
//   //   // getUser();
//   // }
//    @override
//     List<Widget> buildActions(BuildContext context){
//       return [IconButton(icon: Icon(Icons.clear), onPressed: (){
//         query = ''; 
//       },)];
//     }
  
//   @override
//   Widget buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(icon: AnimatedIcon(
//       icon: AnimatedIcons.menu_arrow,
//       progress: transitionAnimation, 
//     ),
//     onPressed: (){
//       close(context, null);
//     },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return null;
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//      BookNotifier foodNotifier =
//         Provider.of<BookNotifier>(context, listen: false);

//     List list = foodNotifier.bookList.toList();
//         List recentlist = ['c Language', 'harsh'];

//     final suggestionList = query.isEmpty ? recentlist : list.where((p) => p.startsWith(query).toList());

//     return ListView.builder(itemBuilder: (context, index) => ListTile(
//       leading: Icon(Icons.replay),
//       title: Text(list[index].title),
//     ),
//     itemCount: list.length,
    
//     );
//   }
  


// }