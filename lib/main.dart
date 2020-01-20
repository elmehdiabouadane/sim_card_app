import 'package:carte_app/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new SplashScreen(
          seconds: 5,
          navigateAfterSeconds: new Login(),
          title: new Text(
            'SIMStore',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Poppins',
              color: Color(0xFFE65100)
            ),
          ),
          image: new Image.asset('simCover.gif'),
          //imageBackground:
          backgroundColor: Color(0xFFFAFAFA),
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 200.0,
          loaderColor: Color(0xFFE65100)
      )
    );
  }
}