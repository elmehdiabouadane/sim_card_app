import 'package:carte_app/entities/CinCard.dart';

class Client {
  String _Id;
  String _Nom;
  String _Prenom;
  String _Address;
  DateTime _dateNaissance;
  CinCard _cinCard;

  Client( String id , String nom , String prenom, String add,DateTime dateN, CinCard cin){
    this._Id = id ;
    this._Nom = nom;
    this._Prenom = prenom;
    this._Address = add;
    this._dateNaissance = dateN;
    this._cinCard = cin;
  }
}