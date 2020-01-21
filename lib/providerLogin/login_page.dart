import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController _email;
  TextEditingController _password;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserRepository>(context);

    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      validator: (value) =>
      (value.isEmpty) ? "Veuillez entrer l'email" : null,
      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      controller: _password,
      validator: (value) =>
      (value.isEmpty) ? "Veuillez entrer le mot de passe" : null,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mot de passe",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            if (!await user.signIn(
                _email.text, _password.text))
              _key.currentState.showSnackBar(SnackBar(
                content: Text("Quelque chose ne va pas"),
              ));
          }
        },
        child: Text("Se connecter",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      key: _key,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: 100,
                    child: Text("Connexion",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff01A0C7),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                /*Padding(
                padding: const EdgeInsets.all(0.0),
                //padding: const EdgeInsets.only(left: 180.0, bottom: 16.0),
                child: Image.asset(
                  "simStore.png",
                  //fit: BoxFit.contain,
                ),
              ),*/
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: emailField,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: passwordField,
                ),
                user.status == Status.Authenticating
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.red,
                    child: loginButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}