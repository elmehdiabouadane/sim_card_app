import 'package:carte_app/bottomNavigationBarModel/bottomNavBar.dart';
import 'package:carte_app/providerAfficherCommande/afficher_commande.dart';
import 'package:carte_app/providerDashboard/dashboard.dart';
import 'package:carte_app/providerPasserCommande/passer_commande.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {

  final int numPage;
  Home({Key key, @required this.numPage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  int _index = 0;

  int nPage(){
    if(widget.numPage == 0) {
      return 0;
    }else if(widget.numPage == 1) {
      return 1;
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFFE65100),
        itemCornerRadius: 15.0,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        items: itemsBottomBar,
        onItemSelected:(index){bottomTapped(index);},
        animationDuration: Duration(milliseconds: 200),
        selectedIndex: _index,
        iconSize: 25.0,
        showElevation: true,
      ),
    );
  }

  PageController pageController = PageController(
      initialPage: 0,
      keepPage: true
  );

  Widget buildPageView() {
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: pageController,
      scrollDirection: Axis.horizontal,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Dashboard(),
        AfficherCommande(),
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