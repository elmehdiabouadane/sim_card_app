import 'dart:io';

import 'package:carte_app/bottomNavigationBarModel/home.dart';
import 'package:carte_app/entities/CinCard.dart';
import 'package:carte_app/entities/Client.dart';
import 'package:carte_app/materials/dot_type.dart';
import 'package:carte_app/materials/loader.dart';
import 'package:carte_app/materials/simple_round_icon_button.dart';
import 'package:carte_app/providerDashboard/dashboard.dart';
import 'package:carte_app/providerLogin/model/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:csv/csv.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PasserCommande extends StatefulWidget {

  String type;
  PasserCommande({Key key, @required this.type}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PasserCommandeState();
  }
}

class PasserCommandeState extends State<PasserCommande> {

  int countValue = 1;
  CinCard newCin;
  Client newClient;
  File  pickedImage;


  bool isImageLoaded = false;
  String text = "";
  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
    this.extractData();
  }

/*  readText() async {

    //num : 14 , Prenom : 5 , Nom : 6, naissence : 8 , valide  : 10
   /* print(textList[14].toString());
   String csv = const ListToCsvConverter().convert(textList);
    print(csv);
    setState(() {
      text=text+csv;
    });*/



  }*/
  alertShowCin(cin){
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Le CIN est ",
      desc: cin + " ",
      buttons: [
        DialogButton(
          child: Text(
            "OUI",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
             setState(() {
               pickedImage = null;
                isImageLoaded = false;
               widget.type = "CIN Face 2";
               text = "";
             }),
            Navigator.pop(context),
            },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "NON",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => { Navigator.pop(context),
            pickImage()},
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
  alertShowAdd(Adress){
    Alert(
      context: context,
      type: AlertType.warning,
      title: " Vérfiez l'adress ",
      desc: Adress + " ",
      buttons: [
        DialogButton(
          child: Text(
            "OUI",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            setState(() {
              pickedImage = null;
              isImageLoaded = false;
              widget.type = "Carte SIM";
              text = "";
            }),
            Navigator.pop(context),
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "NON",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => { Navigator.pop(context),
            pickImage()},
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
  extractData() async{
    switch (widget.type){
      case "CIN Face 1" :{
        List<List<String>> textList=[];
        List<String> lineList=[];
        FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
        TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
        VisionText readText = await recognizeText.processImage(ourImage);
        for (TextBlock block in readText.blocks) {
          for (TextLine line in block.lines) {
            for (TextElement word in line.elements) {
              lineList.add(word.text);
            }
            textList.add(lineList);
            lineList = [];
          }
        }
        if(textList.length > 14) {
         var cinNumber = textList[textList.length-1].toString();
          String csv1 = const ListToCsvConverter().convert(textList);
          print(csv1);
          alertShowCin(cinNumber);
        }
        else {
          pickImage();
        }
      }
      break;
      case "CIN Face 2":{
        List<List<String>> textList=[];
        List<String> lineList=[];
        FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
        TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
        VisionText readText = await recognizeText.processImage(ourImage);
        for (TextBlock block in readText.blocks) {
          for (TextLine line in block.lines) {
            for (TextElement word in line.elements) {
              lineList.add(word.text);
            }
            textList.add(lineList);
            lineList = [];
          }
        }
        if(textList.length > 5) {
        print(textList[5]);
         // var cinNumber = textList[14].toString();
          String csv1 = const ListToCsvConverter().convert(textList);
          print(csv1);
          alertShowAdd(textList[5].toString());
        }
        else {
          pickImage();
        }
      }
      break;
      case "Carte SIM":{
        decode();

      }
      break;

    }
  }
  Future decode() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    List barCodes = await barcodeDetector.detectInImage(ourImage);

      for (Barcode readableCode in barCodes) {
        print(readableCode.displayValue);
        Alert(
          context: context,
          type: AlertType.success,
          title: " Commande enregistrée",
          desc: readableCode.displayValue + " ",
          buttons: [
            DialogButton(
              child: Text(
                "OK !",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home())),
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
          ],
        ).show();
      }



  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    final UserRepository user = new UserRepository.instance();

    final iconLogOut = IconButton(
        icon: Image.asset("exit.png"),
        onPressed: () {
          user.signOut();
        }
    );

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            iconLogOut,
          ],
          title: Text(
           widget.type,
            style: TextStyle(
                fontFamily: 'Poppins'
            ),
          ),
          backgroundColor: Color(0xFFE65100),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            isImageLoaded
                ? Center(
              child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(pickedImage), fit: BoxFit.cover))),
            )
                : Container(),
            SizedBox(height: 10.0),
            SimpleRoundIconButton(
              backgroundColor: Colors.deepOrangeAccent,
              buttonText: Text("TAKE AN IMAGE",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              onPressed: () {
                    pickImage();
                    setState(() => countValue += 1);
               },
              textColor: Colors.orangeAccent,
              icon: Icon(Icons.camera_alt),
            ),
            SizedBox(height: 25.0),
            /*RaisedButton(
              child: Text('Read Text'),
              onPressed: readText,
            ),

            Text(text)*/
            text == ""
                ? ColorLoader5(
                  dotOneColor: Colors.deepOrange,
                  dotTwoColor: Colors.deepOrangeAccent,
              dotThreeColor: Colors.orangeAccent,
              dotType: DotType.circle,
              dotIcon: Icon(Icons.adjust),
              duration: Duration(seconds: 1),
                )
                : RaisedButton(
                  child: Text('Next'),
                ),
          ],
        )
    );
  }

}