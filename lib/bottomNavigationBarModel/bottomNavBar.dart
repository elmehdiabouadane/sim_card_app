import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

List<BottomNavyBarItem> itemsBottomBar = [
  BottomNavyBarItem(
      icon: Icon(Icons.home),
      title: Text(
        "Accueil",
        style: TextStyle(fontSize: 13.0),
      ),
      activeColor: Color.fromRGBO(137, 83, 137, 1)
    //inactiveColor: inputBgColor,
  ),
  BottomNavyBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text(
        "Commandes",
        style: TextStyle(fontSize: 13.0),
      ),
      activeColor: Color.fromRGBO(137, 83, 137, 1)
    //inactiveColor: inputBgColor,
  ),
  BottomNavyBarItem(
      icon: Icon(Icons.add),
      title: Text(
        "Ajouter un client",
        style: TextStyle(fontSize: 13.0),
      ),
      activeColor: Color.fromRGBO(137, 83, 137, 1)
    //inactiveColor: inputBgColor,
  ),
];