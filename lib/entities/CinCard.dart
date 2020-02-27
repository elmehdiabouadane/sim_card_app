class CinCard {
   String idCard;
  String face1;
   String face2;
   String datevalidite;

  CinCard({this.idCard,this.datevalidite,this.face1,this.face2});

  Map<String, dynamic> toJson() {
    return {
      'id': idCard,
      'face1': face1,
      'face2': face2,
      'dateValidite' : datevalidite
    };
  }
  CinCard.fromJson(Map<String, dynamic> json)
      : idCard = json['id'],
        face1 = json['face1'],
        face2= json['face2'],
        datevalidite=json['dateValidite'];

}
