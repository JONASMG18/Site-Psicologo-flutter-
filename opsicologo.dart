import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:psicologocristianooliveira/LandingPage/sobreopsicologo.dart';
import 'package:psicologocristianooliveira/Navbar/Navbar.dart';
import 'package:psicologocristianooliveira/pages/cartao_visita_digital.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contato.dart';

// ignore: must_be_immutable
class Opsicologo extends StatelessWidget {
  String _launchUrl =
      'https://www.google.com.br/maps/place/Pra%C3%A7a+Conde+de+Porto+Alegre,+77+-+Centro+Hist%C3%B3rico,+Porto+Alegre+-+RS,+90020-130/@-30.0323633,-51.2271972,17z/data=!3m1!4b1!4m8!1m2!2m1!1sconde+deporto+alegre,+77!3m4!1s0x951979065e78454f:0x17b9b55e7969bf7a!8m2!3d-30.0323633!4d-51.2250085?hl=pt-BR';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(195, 20, 50, 1.0),
                Color.fromRGBO(36, 11, 54, 1.0)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: SobreoPsicologo(),
              ),
              Container(
                alignment: Alignment.center,
                child: MaterialButton(
                  color: Colors.teal[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contato()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 40.0),
                    child: Text(
                      "Enviar Mensagem",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80.0,
              ),
              Wrap(
                children: [
                  Container(
                    color: Colors.amber[100],
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0, bottom: 20.0),
                                    alignment: Alignment.topLeft,
                                    height: 165.0,
                                    width: 155.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/logo_cristiano.png"),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.only(left: 5.0),
                                        child: new RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    'Psicólogo CRISTIANO OLIVEIRA ',
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: 'CRP: 07/29149',
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Redes Sociais:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await launch(
                                              'https://www.facebook.com/psicologocristianooliveira/');
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/iconefacebook.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await launch(
                                              'https://www.instagram.com/psicologocristianooliveira/');
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/iconeinstagram.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 50.0,
                                      height: 50.0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await launch(
                                              'https://psicologocristianooliveira.blogspot.com/');
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/iconeblogger.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceInOut,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.teal[400],
        foregroundColor: Colors.white70,
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.assignment_ind_rounded),
            backgroundColor: Colors.teal[300],
            label: "Perfil Profissional",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartaoVisitaDigital()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.face),
            backgroundColor: Colors.teal[300],
            label: "Entrar em contato",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contato()));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.chat),
            backgroundColor: Colors.teal[300],
            label: "Enviar mensagem",
            onTap: sendMessage,
          ),
          SpeedDialChild(
              child: Icon(Icons.call),
              backgroundColor: Colors.teal[300],
              label: "Mensagem via Whatssapp",
              onTap: () {
                launchWhatssap(number: "+5551989602868", message: "Olá!");
              }),
          SpeedDialChild(
            child: Icon(Icons.location_on),
            backgroundColor: Colors.teal[300],
            label: "Localização",
            onTap: () {
              _launchInBrowser(_launchUrl);
            },
          ),
        ],
        elevation: 10,
      ),
    );
  }

  void sendMessage() async {
    String message = "sms:+5551989602868?body-Olá!";
    if (await canLaunch(message)) {
      launch(message);
    } else {
      throw 'não pode enviar!';
    }
  }

  void launchWhatssap({@required number, @required message}) async {
    String url = "whatsapp://send?phone=5551989602868&text=Olá!";
    _launchInWhatsap(_launchUrl2);

    await canLaunch(url) ? launch(url) : print("Não pode abrir o Whatssapp");
  }

  String _launchUrl2 =
      'https://api.whatsapp.com/send/?phone=5551989602868&text=Olá!!';

  Future<void> _launchInWhatsap(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: false,
          forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Não conseguiu abrir o $url';
    }
  }
}
