import 'package:carte_app/bottomNavigationBarModel/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'providerlogin/login_page.dart';
import 'providerlogin/model/user_repository.dart';

void main() => runApp(Splash());

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new SplashScreen(
            seconds: 5,
            navigateAfterSeconds: ChangeNotifierProvider(
              builder: (_) => UserRepository.instance(),
              child: Consumer(
                builder: (context, UserRepository user, _) {
                  switch (user.status) {
                    case Status.Uninitialized:
                      return Splash();
                    case Status.Unauthenticated:
                    case Status.Authenticating:
                      return LoginPage();
                    case Status.Authenticated:
                      return Home();
                  }
                },
              ),
            ),
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