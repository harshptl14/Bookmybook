import 'package:bookmybook/api/book_api.dart';
import 'package:bookmybook/app_screens/FadepageRoute.dart';
import 'package:bookmybook/app_screens/displayproduct/Search.dart';
import 'package:bookmybook/app_screens/displayproduct/product.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String id;
Icon filter = new Icon(Icons.sort);
bool chipSelected = false;

class ProductsCom extends StatefulWidget {
  final String depname;
  const ProductsCom({
    Key key,
    this.depname,
  });

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<ProductsCom> {
  Icon searchIcon = new Icon(Icons.search);
  List<String> chipList = [
    "Maths",
    "Computer",
    "Physics",
    "Elective"
  ];
  // Animation animation, transformationAnim;
  // AnimationController animationController;

  //var queryResultSet = [];
  void initState() {
    print(widget.depname);
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    getBooks(foodNotifier, widget.depname);
    super.initState();
    //   animationController =
    //       AnimationController(duration: Duration(seconds: 8), vsync: this);

    //   animation = Tween(begin: 10.0, end: 200.0).animate(
    //       CurvedAnimation(parent: animationController, curve: Curves.ease));

    //   transformationAnim = BorderRadiusTween(
    //           begin: BorderRadius.circular(150.0),
    //           end: BorderRadius.circular(0.0))
    //       .animate(
    //           CurvedAnimation(parent: animationController, curve: Curves.ease));
    //   animationController.forward();
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

    return Scaffold(
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
              }),
          // FilterIcon(),
          IconButton(
            icon: filter,
            onPressed: () => _onButtonPressed(widget.depname),
          )
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
      body:   foodNotifier.bookList.isEmpty ? Container(alignment: Alignment.center,
      child: Text('No Data Found!'),) : Container(
          child: FutureBuilder(builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            itemCount: foodNotifier.bookList.length,
            padding: EdgeInsets.all(10),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.center,
                  height: (MediaQuery.of(context).size.width / 2),
                  width: (MediaQuery.of(context).size.width / 2) - 20.0,
                  child: Column(
                    children: [
                      Container(
                          // elevation: 5,
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10)),
                          // borderOnForeground: true,

                          child: InkWell(
                        onTap: () {
                          foodNotifier.currentBook =
                              foodNotifier.bookList[index];
                          id = foodNotifier.bookList[index].userId;
                          Navigator.of(context).push(FadePageRoute(
                            widget: Thing(),
                          ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 250,
                              width: 155,
                              padding: EdgeInsets.only(top: 15),
                              //padding: EdgeInsets.only(left: 10),
                              child: InkResponse(
                                  // child: Hero(
                                  //   tag: foodNotifier.bookList[index].image,
                                  //   // child: Image.network(
                                  //   //   foodNotifier.bookList[index].image !=
                                  //   //           null
                                  //   //       ? foodNotifier
                                  //   //           .bookList[index].image
                                  //   //       : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                  //   //   fit: BoxFit.fill,
                                  //   // ),
                                  // ),
                                  ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      foodNotifier.bookList[index].image != null
                                          ? foodNotifier.bookList[index].image
                                          : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                      //fit: BoxFit.fill,
                                    ),
                                    fit: BoxFit.fill),
                                //shape: BoxShape.circle,
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                    // topLeft: Radius.circular(20.0),
                                    // topRight: Radius.circular(20.0)
                                    Radius.circular(8.0)),
                              ),
                            ),
                            Container(
                              width: 155,
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                foodNotifier.bookList[index].title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.8,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '₹',
                                    textAlign: TextAlign.start,
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
                                    textAlign: TextAlign.start,
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
                      )),
                    ],
                  ));
            },
            physics: ClampingScrollPhysics(),
          );
        }
      })),
    );
  }

  void _onButtonPressed(String dpname) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: ChoiceChipWidget(chipList, dpname),
          );
        });
  }
}

String selectedChoice = "";

class ChoiceChipWidget extends StatefulWidget {
  final List<String> reportList;
  final String dpname;

  ChoiceChipWidget(this.reportList, this.dpname);

  @override
  _ChoiceChipWidgetState createState() => new _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  _buildChoiceList(BookNotifier foodnotifier) {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.only(top: 30, left:10, right: 10),
        child: ChoiceChip(
          elevation: 5,
          selectedShadowColor: Colors.deepPurple,
          labelPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          label: Text(item),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.grey,
          selectedColor: Colors.deepPurple,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              getBooksForFilter(foodnotifier, widget.dpname, selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier foodNotifier =
        Provider.of<BookNotifier>(context, listen: false);
    return Column(
      children: [
        Wrap(
          children: _buildChoiceList(foodNotifier),
        ),

        SizedBox(height: 25,),
        Container(
        width: 60,
        height: 60,
        decoration: new BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.deepPurple,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 30.0,
                  spreadRadius: -5,
                )],
        ),
        
          
          child: IconButton(icon: Icon(Icons.arrow_forward, color: Colors.white,), onPressed: () => Navigator.of(context).pop()),
        )
      ],
    );
  }
}
