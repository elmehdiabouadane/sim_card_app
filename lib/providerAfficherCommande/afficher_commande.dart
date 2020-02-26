import 'package:carte_app/providerLogin/model/user_repository.dart';
import 'package:carte_app/providerPasserCommande/model_passer_commande.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AfficherCommande extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AfficherCommandeState();
  }
}

class AfficherCommandeState extends State<AfficherCommande> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final UserRepository user = new UserRepository.instance();
    //final myModel = Provider.of<ModelPasserCommande>(context, listen: false);

    final iconLogOut = IconButton(
        icon: Image.asset("exit.png"),
        onPressed: () {
          user.signOut();
        }
    );

    return ChangeNotifierProvider<ModelPasserCommande>(
      builder: (context) => ModelPasserCommande(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              iconLogOut,
            ],
          title: Text(
            "Afficher commande",
            style: TextStyle(
            fontFamily: 'Poppins'
            ),
          ),
          backgroundColor: Color(0xFFE65100),
          ),
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<ModelPasserCommande>(
                  builder: (context, ModelPasserCommande, child) {
                    return RaisedButton(
                      child: Text('Do something'),
                      onPressed: (){
                        ModelPasserCommande.doSomething();
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Consumer<ModelPasserCommande>(
                  builder: (context, ModelPasserCommande, child) {
                    return new Text("Salaaaaam");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            iconLogOut,
          ],
          title: Text(
            "Afficher commande",
            style: TextStyle(
                fontFamily: 'Poppins'
            ),
          ),
          backgroundColor: Color(0xFFE65100),
        ),
        /*body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
          children: <Widget>[
            _buildTile(
              Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
            _buildTile(
                Container()
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 110.0),
          ],
        )*/
    );*/
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  /*Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        color: Color(0xFFFFD180),
        elevation: 10.0,
        borderRadius: BorderRadius.circular(25.0),
        shadowColor: Color(0x802196F3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Padding(padding: const EdgeInsets.all(10.0)),
            //Padding(padding: const EdgeInsets.only(right: 0.0, top: 25.0, left: 10.0, bottom: 0.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Padding(padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0)),
                Text("Commande N° 123456789ABCDEF",
                    style: TextStyle(
                        color: Color(0xFFE65100),
                        fontFamily: 'Poppins',
                        fontSize: 20.0
                    )
                ),
              ],
            ),
            //Padding(padding: const EdgeInsets.all(20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("19-02-2020",
                    style: TextStyle(
                        color: Color(0xFFE65100),
                        fontFamily: 'Poppins',
                        fontSize: 20.0
                    )
                ),
                Text("30 DHs",
                    style: TextStyle(
                        color: Color(0xFFE65100),
                        fontFamily: 'Poppins',
                        fontSize: 20.0
                    )
                )
              ],
            )
          ],
        )
      /*InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )*/
    );
  }*/

}