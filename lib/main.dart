import 'package:carte_app/bottomNavigationBarModel/home.dart';
import 'package:carte_app/providerLogin/login_page.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'connectivity/connectionStatusSingleton.dart';
import 'providerlogin/login_page.dart';
import 'providerlogin/model/user_repository.dart';

void main() {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

  runApp(HomePage());

  //connectionStatus.dispose();
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: ChangeNotifierProvider(
          builder: (_) => UserRepository.instance(),
          child: Consumer(
            builder: (context, UserRepository user, _) {
              switch (user.status) {
                case Status.Uninitialized:
                  return Splash();
                case Status.Unauthenticated:
                  //return LoginPage();
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
    );
  }

}