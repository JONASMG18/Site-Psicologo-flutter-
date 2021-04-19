import 'package:flutter/material.dart';
import 'package:psicologocristianooliveira/pages/contato.dart';
import 'package:psicologocristianooliveira/pages/inicio.dart';
import 'package:psicologocristianooliveira/pages/opsicologo.dart';

import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

// ignore: must_be_immutable
class DesktopNavbar extends StatelessWidget {
  String _launchUrl = 'https://psicologocristianooliveira.blogspot.com/';
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Não conseguiu abrir o $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0, right: 5.0, top: 10),
                  alignment: Alignment.center,
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/logo_cristianobranco.png"),
                    ),
                  ),
                ),
                new Container(
                  child: Text(
                    "Psicólogo Cristiano Oliveira",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                MaterialButton(
                  color: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Inicio()));
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  color: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Opsicologo()));
                  },
                  child: Text(
                    "O psicólogo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  color: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    _launchInBrowser(_launchUrl);
                  },
                  child: Text(
                    "Blog",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  color: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contato()));
                  },
                  child: Text(
                    "Contato",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MobileNavbar extends StatelessWidget {
  String _launchUrl = 'https://psicologocristianooliveira.blogspot.com/';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Não conseguiu abrir o $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Container(
        margin: EdgeInsets.only(top: 0),
        width: MediaQuery.of(context).size.width,
        child: Column(children: <Widget>[
          SizedBox(
            height: 0.0,
          ),
          Text(
            "Psicólogo Cristiano Oliveira",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              margin: EdgeInsets.only(top: 2),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 0.0,
                    children: [
                      new MaterialButton(
                        minWidth: 10,
                        color: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Inicio()));
                        },
                        child: Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      MaterialButton(
                        color: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Opsicologo()));
                        },
                        child: Text(
                          "O pisicólogo",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      MaterialButton(
                        minWidth: 10,
                        color: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          _launchInBrowser(_launchUrl);
                        },
                        child: Text(
                          "Blog",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      MaterialButton(
                        color: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contato()));
                        },
                        child: Text(
                          "Contato",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
