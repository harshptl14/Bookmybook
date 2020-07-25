import 'package:bookmybook/app_screens/NavPages/UploadinNavbar.dart';
import 'package:bookmybook/app_screens/NavPages/chat.dart';
import 'package:bookmybook/app_screens/NavPages/profile.dart';
import 'package:bookmybook/app_screens/displayproduct/categories.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:bookmybook/app_screens/NavPages/first_screen.dart';
import 'package:flutter/services.dart';

// Function hey;
class MyApp extends StatefulWidget {
  static String currentuser = uid;
  MyApp({Key key, String uid}) : super(key: key);

  @override
    State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
MyAppState({Key key, String uid});
static String currentuser = uid;
    void initState() {
     
    print('currentt users id Home');
    print(currentuser); 
    super.initState();
  }

  int _selectedPage = 0;
  final List<Widget> _pageOptions = [
    FirstScreen(key: PageStorageKey('Page1')),
    ProductList(key: PageStorageKey('Page2')),
    UploadinNav(isUpdating: false, key: PageStorageKey('Page3')),
    HomeScreen(currentUserId: currentuser),
    Profile(key: PageStorageKey('Page5')),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

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
        )) ??
        false;
  }

  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Material(
        child: Scaffold(
            body: PageStorage(
              child: _pageOptions[_selectedPage],
              bucket: bucket,
            ),
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
                  icon: Icon(Icons.chat),
                  title: Text('Messages'),
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
