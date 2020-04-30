import 'package:bookmybook/app_screens/NavPages/home_screen.dart';
import 'package:bookmybook/app_screens/initialPages/login.dart';
import 'package:bookmybook/notifier/auth_notifier.dart';
import 'package:bookmybook/notifier/book_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => AuthNotifier(),
          create: (BuildContext context) {
            return AuthNotifier();
          },
        ),
        ChangeNotifierProvider(
          builder: (context) => BookNotifier(),
          create : (BuildContext context){
            return BookNotifier();
          },
        )
      ],
      child: BookApp(),
    ));
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              elevation: 5,
              color: ThemeData.light().canvasColor,
            )
        ),
      home: Consumer<AuthNotifier>(
        builder: (context, notifier, child) {
          return notifier.user != null ? MyApp() : Login();
        },
      ),
    );
  }
}