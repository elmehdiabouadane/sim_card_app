import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

TextStyle style1 = TextStyle(fontFamily: 'Poppins', fontSize: 15.0);
TextStyle style2 = TextStyle(fontFamily: 'Poppins', fontSize: 13.0);

List<BottomNavyBarItem> itemsBottomBar = [
  BottomNavyBarItem(
      icon: Icon(Icons.home),
      inactiveColor: Color(0xFFFFD180),
      title: Text(
        "Accueil",
        style: style1
      ),
      activeColor: Colors.white
    //inactiveColor: inputBgColor,
  ),
  BottomNavyBarItem(
      icon: Icon(Icons.shopping_cart),
      inactiveColor: Color(0xFFFFD180),
      title: Text(
        "Commandes",
        style: style2
      ),
      activeColor: Colors.white
    //inactiveColor: inputBgColor,
  ),
];