import 'dart:io';

import 'package:carte_app/providerLogin/model/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:csv/csv.dart';
import 'package:provider/provider.dart';

class PasserCommande extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PasserCommandeState();
  }
}

class PasserCommandeState extends State<PasserCommande> {

  int countValue = 1;

  File  pickedImage;
  List<List<String>> textList=[];
  List<String> lineList=[];

  bool isImageLoaded = false;
  String text = "";
  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
    });
    this.readText();
  }

  Future readText() async {

    textList = [];
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);print('2');
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

    String csv = const ListToCsvConverter().convert(textList);
    print(csv);
    setState(() {
      text=text+csv;
    });
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
            "Passer une commande",
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
            RaisedButton(
              child: Text('Pick an image'),
              onPressed: () {
                pickImage;
                setState(() => countValue += 1);
              },
            ),
            SizedBox(height: 10.0),
            /*RaisedButton(
              child: Text('Read Text'),
              onPressed: readText,
            ),

            Text(text)*/
            text == ""
                ? Center(child: CircularProgressIndicator())
                : RaisedButton(
                  child: Text('Retour'),
                ),
          ],
        )
    );
  }

}