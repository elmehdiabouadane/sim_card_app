import 'package:carte_app/entities/CinCard.dart';

class Client {
  String Id;
  String Nom;
  String Prenom;
  String Address;
  String dateNaissance;
  CinCard cinCard;

  Client();
  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'nom': Nom,
      'prenom': Prenom,
      'datenaissance' : dateNaissance,
      'adress' : Address,
      'cin' : cinCard,
    };
  }
  Client.fromJson(Map<String, dynamic> json)
      : Id= json['id'],
        Nom = json['face1'],
        Prenom= json['face2'],
        dateNaissance=json['dateValidite'],
        Address = json['adress'],
        cinCard=json['cin'];
}