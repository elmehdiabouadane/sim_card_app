
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
       Row(
         children: <Widget>[
           Checkbox(
             value: false,
            ),
           Text("CIN Face 1")
         ],
       ),
        Row(
          children: <Widget>[
            Checkbox(value: false,),
            Text("CIN Face 2")
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(value: false,),
            Text("Carte Sim")
          ],
        )
      ],
    )
    );
  }
}
