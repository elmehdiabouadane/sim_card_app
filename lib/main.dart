import 'package:carte_app/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'providerlogin/login_page.dart';
import 'providerlogin/model/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomePage();
      /*MaterialApp(
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
    );*/
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new LoginPage()
    );/*ChangeNotifierProvider(
      builder: (_) => UserRepository.instance(),
      /*child: Consumer(
        builder: (context, UserRepository user, _) {
          switch (user.status) {
            case Status.Uninitialized:
              return Splash();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LoginPage();
            case Status.Authenticated:
              return UserInfoPage();
          }
        },
      ),*/
    );*/
  }
}

class UserInfoPage extends StatelessWidget {
  final FirebaseUser user;

  const UserInfoPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user.email),
            RaisedButton(
              child: Text("SIGN OUT"),
              //onPressed: () => Provider.of<UserRepository>(context).signOut(),
            )
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
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