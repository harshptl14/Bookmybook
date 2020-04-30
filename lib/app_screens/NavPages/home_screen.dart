import 'package:bookmybook/app_screens/NavPages/Upload.dart';
import 'package:bookmybook/app_screens/NavPages/addtocart.dart';
import 'package:bookmybook/app_screens/NavPages/profile.dart';
import 'package:bookmybook/app_screens/displayproduct/categories.dart';
import 'package:flutter/material.dart';
import 'package:bookmybook/app_screens/NavPages/first_screen.dart';
// Function hey;
class MyApp extends StatefulWidget {
  //MyApp({this.auth, this.onSignedOut});
  // final Function onSignedOut;
  // const MyApp({Key key, this.onSignedOut, this.auth});
  // final BaseAuth auth;
// Function hey = onSignedOut;

  // void _signOut() async {
  //   try {
  //     await auth.signOut();
  //     onSignedOut();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    element(),
    ProductList(),
    Upload(isUpdating: false,),
    Cart(),
    Profile(),
  ];

   Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
          child: Material(
            child: Scaffold(
            body: _pageOptions[_selectedPage],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 30,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  title: Text('Categories'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_a_photo),
                  title: Text('Add'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ],
            )),
      ),
    );
  }
}
