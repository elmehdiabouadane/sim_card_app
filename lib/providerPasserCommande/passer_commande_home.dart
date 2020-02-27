
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carte_app/providerPasserCommande/passer_commande.dart';
import 'package:image_picker/image_picker.dart';

class PasserCommandeHomme extends StatefulWidget {
  @override
  _PasserCommandeHommeState createState() => _PasserCommandeHommeState();
}

class _PasserCommandeHommeState extends State<PasserCommandeHomme> {
  @override
  String Face1;
  String Face2;
  String Sim;
  Widget build(BuildContext context) {

    return   Scaffold(
    appBar: AppBar(
    actions: <Widget>[
    Container(
    margin: EdgeInsets.only(right: 8.0),
    child: Row
    (
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    ),
    ),
    ],
    title: Text(
    "Nouvelle Commande",
    style: TextStyle(
    fontFamily: 'Poppins'
    ),
    ),
    backgroundColor: Color(0xFFE65100),
    ),
    body: ListView(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        FlatButton(
          onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PasserCommande(type : "CIN Face 1"))),
          child: Text("CIN Face 1",
              style: TextStyle(color: Colors.deepOrangeAccent) ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)
          ),
    ),
        FlatButton(
          onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PasserCommande(type : "CIN Face 2"))),
          child: Text("CIN Face 2",
              style: TextStyle(color: Colors.deepOrangeAccent)),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)
          ),
        ),
        FlatButton(
          onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PasserCommande(type : "Carte SIM"))),
          child: Text("Carte SIM",
          style: TextStyle(color: Colors.deepOrangeAccent)),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)
          ),
        ),
      ]
    )
    );
  }
}
