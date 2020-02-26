import 'package:flutter/material.dart';

class ModelPasserCommande with ChangeNotifier {

  String someValue = 'Hello';

  Widget myListBuilder;

  void doSomething() {
    myListBuilder = new Text("HI");
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }

  /*Widget _myListBuilder() {
    return new Scaffold(
      body: Text("HI"),
    );
  }*/
  


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