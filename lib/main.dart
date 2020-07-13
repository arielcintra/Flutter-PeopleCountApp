import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Não passará!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people <= 0) {
        _infoText = "Não passará!";
      } else if (_people <= 10) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "LOTADO!!!";
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
            "https://png.pngtree.com/thumb_back/fw800/back_our/20190628/ourmid/pngtree-band-concert-background-image_264964.jpg",
            fit: BoxFit.cover),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+",
                        style: TextStyle(fontSize: 35.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-",
                        style: TextStyle(fontSize: 35.0, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
