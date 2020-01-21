import 'package:carte_app/bottomNavigationBarModel/bottomNavBar.dart';
import 'package:carte_app/providerAfficherCommande/afficher_commande.dart';
import 'package:carte_app/providerDashboard/dashboard.dart';
import 'package:carte_app/providerPasserCommande/passer_commande.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavyBar(
        items: itemsBottomBar,
        onItemSelected:(index){bottomTapped(index);},
        animationDuration: Duration(milliseconds: 200),
        selectedIndex: _index,
        iconSize: 20.0,
        showElevation: true,
      ),
    );
  }

  PageController pageController = PageController(
      initialPage: 0,
      keepPage: true
  );

  void initState() {
    super.initState();
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Dashboard(),
        AfficherCommande(),
        PasserCommande()
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      this._index = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      this._index = index;
      pageController.animateToPage(
          index,
          duration: Duration(
              milliseconds: 1
          ),
          curve: Curves.ease
      );
    });
  }

}