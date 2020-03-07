import 'package:carte_app/providerDashboard/dashboard.dart';
import 'package:carte_app/providerPasserCommande/passer_commande.dart';
import 'package:flutter/material.dart';

class ModelPasserCommande with ChangeNotifier {

  String currentNavigation = "Home";

  /*String someValue = 'Hello';

  Widget myListBuilder;

  void doSomething() {
    myListBuilder = new Text("HI");
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }*/

  Widget get getNavigation {
    if (currentNavigation == "Passer") {
      return PasserCommande();
    }else {
      return Dashboard();
    }
  }

  /*Widget _myListBuilder() {
    return new Scaffold(
      body: Text("HI"),
    );
  }*/

  updateNavigation(String navigation) {
    currentNavigation = navigation;
    notifyListeners();
  }

  /*Widget _myListBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text("Commande N°"),
            title: Text("Date de la commande"),
            subtitle: Text("Prix"),
          ),
        );
      },
    );
  }*/

}