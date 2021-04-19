import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {
  final String _launchUrl =
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 1080,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 185.0,
                  width: 175.0,
                  child: Image(
                      image: AssetImage('assets/images/logo_cristiano.png'))),
            ],
          ),
          SizedBox(
            height: size.height,
            child: Wrap(children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.10),
                    height: 480,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 165.0,
                              width: 155.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 5),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/fotocris.jpg"),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text('Psicólogo Cristiano Oliveira',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      Text('Psicólogo Clínico CRP: 07/29149',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0)),
                      Text('Porto Alegre - RS',
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: GestureDetector(
                                  onTap: () {
                                    launchWhatssap(
                                        number: "+5551989602868",
                                        message: "Olá!");
                                  },
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/iconewhatsapp.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: GestureDetector(
                                  onTap: () {
                                    abrirGmail();
                                  },
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/iconegmail.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              width: 70.0,
                              height: 70.0,
                              child: Image(
                                  image: AssetImage('assets/images/mao.png')),
                            ),
                            Container(
                                child: Text(
                              'CLIQUE NOS ICONES PARA INTERAGIR!',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void launchWhatssap({@required number, @required message}) async {
    String url = "whatsapp://send?phone=number&text=$message";
    _launchInWhatsap(_launchUrl);

    await canLaunch(url)
        ? launch(url)
        : print("Não pode abrir o Whatssapp app");
  }

  void abrirGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'psicologocristianooliveira@gmail.com',
      query: 'subject=Agendar&body=Olá gostaria de conversar com você! ',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
