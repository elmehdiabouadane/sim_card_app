import 'package:carte_app/providerLogin/model/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasserCommande extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PasserCommandeState();
  }
}

class PasserCommandeState extends State<PasserCommande> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final UserRepository user = new UserRepository.instance();

    final iconLogOut = IconButton(
        icon: Image.asset("exit.png"),
        onPressed: () {
          user.signOut();
        }
    );

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            iconLogOut,
          ],
          title: Text(
            "Passer une commande",
            style: TextStyle(
                fontFamily: 'Poppins'
            ),
          ),
          backgroundColor: Color(0xFFE65100),
        ),
        body: Text('Passer commande')
    );
  }

}