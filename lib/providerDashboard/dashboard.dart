import 'dart:async';

import 'package:carte_app/bottomNavigationBarModel/home.dart';
import 'package:carte_app/connectivity/connectionStatusSingleton.dart';
import 'package:carte_app/providerLogin/model/user_repository.dart';
import 'package:carte_app/providerPasserCommande/passer_commande.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> with AutomaticKeepAliveClientMixin {

  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  initState() {
    super.initState();
    ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {

    final UserRepository user = new UserRepository.instance();
    final passComm = PasserCommandeState();
    String cValue = passComm.countValue.toString();

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
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ],
        title: Text(
          "Tableau de bord",
          style: TextStyle(
             fontFamily: 'Poppins'
          ),
        ),
        backgroundColor: Color(0xFFE65100),
      ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          children: <Widget>[
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Color(0xFFE65100),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.person, color: Colors.white, size: 30.0),
                              )
                          )
                      ),
                      Padding(padding: const EdgeInsets.all(20.0)),
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text("ABOUADANE El Mehdi",
                              style: TextStyle(
                                color: Color(0xFFE65100),
                                fontFamily: 'Poppins',
                                fontSize: 20.0
                              )),
                          (isOffline)? new Container(
                            child: new Container(
                              child: Row(
                                children: <Widget>[
                                  Text("Déconnecté",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                      color: Color(0xFFE65100),
                                    ),
                                  ),
                                  Icon(
                                    Icons.brightness_1,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                          ) : new Container(
                            child: Row(
                              children: <Widget>[
                                Text("Connecté",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                    color: Color(0xFFE65100),
                                  ),
                                ),
                                Icon(
                                  Icons.brightness_1,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Color(0xFFE65100),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.shopping_cart, color: Colors.white, size: 30.0),
                              )
                          )
                      ),
                      Padding(padding: const EdgeInsets.all(20.0)),
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text(cValue+' commandes',
                              style: TextStyle(
                                  color: Color(0xFFE65100),
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0
                              )),
                          Text('60 DHs',
                              style: TextStyle(
                                  color: Color(0xFFE65100),
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0
                              ))
                        ],
                      ),
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Color(0xFFE65100),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.cloud_upload, color: Colors.white, size: 30.0),
                              )
                          )
                      ),
                      Padding(padding: const EdgeInsets.all(3.2)),
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Envoyer',
                              style: TextStyle(
                                  color: Color(0xFFE65100),
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0
                              )),
                        ],
                      ),
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Color(0xFFE65100),
                          borderRadius: BorderRadius.circular(25.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.add, color: Colors.white, size: 30.0),
                              )
                          )
                      ),
                      Padding(padding: const EdgeInsets.all(3.2)),
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Ajouter',
                              style: TextStyle(
                                  color: Color(0xFFE65100),
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0
                              )),
                        ],
                      ),
                    ]
                ),
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PasserCommande())),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 110.0),
            StaggeredTile.extent(1, 110.0),
            //StaggeredTile.extent(2, 110.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      color: Color(0xFFFFD180),
        elevation: 10.0,
        borderRadius: BorderRadius.circular(25.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}