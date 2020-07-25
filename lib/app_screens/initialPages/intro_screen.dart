import 'package:bookmybook/app_screens/initialPages/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle: PageDecoration().titleTextStyle.copyWith(
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 22),
    bodyTextStyle: PageDecoration().titleTextStyle.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 17,
        fontFamily: 'Montserrat'),
    contentPadding: const EdgeInsets.all(30.0),
    imagePadding: EdgeInsets.only(top: 130.0),
    footerPadding: EdgeInsets.only(bottom: 60.0),
    titlePadding: EdgeInsets.only(top: 60, bottom: 10),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("onboard/uploadbook.png"),
        title: "Upload Books",
        body:
            "Upload images of your old books which you don't need anymore and sell with classmates and friends.",
        footer: Center(
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("onboard/buy.png"),
        title: "Buy Books",
        body: "Buy secondhand books with lower price, or buy a new one.",
        footer: Center(
            child: Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 16),
        )),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("onboard/earn.png"),
        title: "Earn Money",
        body:
            "Sell your old books which you don't need at all and earn some MONEY out of them.",
        footer: Center(
            child: Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        )),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("onboard/sharebook.png"),
        title: "Share Books",
        body:
            "Share books with your juniors and with your friends or classmates.",
        footer: Center(
            child: Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        )),
        decoration: pageDecoration,
      ),
      PageViewModel(
        image: Image.asset("onboard/communication.png"),
        title: "Improve Communication",
        body:
            "Share books with your juniors and your mates and stay connected with each other and make some new friends.",
        footer: Center(
            child: Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        )),
        decoration: pageDecoration,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        showSkipButton: true,
        dotsDecorator: DotsDecorator(activeColor: Colors.deepPurple),
        done: Container(
            height: 40.0,
            width: 80.0,
            child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.deepPurpleAccent,
                color: Colors.deepPurple,
                elevation: 7.0,
                child: Center(
                    child: Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                )))),
        onDone: () {
          heroTag:
          "btn1";
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        skip: Container(
            height: 40.0,
            width: 80.0,
            child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.deepPurpleAccent,
                color: Colors.deepPurple,
                elevation: 7.0,
                child: Center(
                    child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                )))),
        onSkip: () {
          heroTag:
          "btn2";
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
      ),
    );
  }
}
