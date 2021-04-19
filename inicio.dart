import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psicologocristianooliveira/LandingPage/LandingPage.dart';
import 'package:psicologocristianooliveira/Navbar/Navbar.dart';
import 'package:psicologocristianooliveira/blog/add_blog_page.dart';
import 'package:psicologocristianooliveira/blog/home_page.dart';
import 'package:psicologocristianooliveira/pages/cartao_visita_digital.dart';
import 'package:psicologocristianooliveira/pages/contato.dart';
import 'package:psicologocristianooliveira/pages/envio.dart';
import 'package:psicologocristianooliveira/pages/opsicologo.dart';
import 'package:url_launcher/url_launcher.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  void initState() {
    super.initState();
    changeStatusBar();
  }

  changeStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Psicólogo Cristiano Oliveira',
      theme:
          ThemeData(primarySwatch: Colors.deepOrange, fontFamily: "Montserrat"),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  // ignore: unused_field
  String _launchUrl =
      'https://api.whatsapp.com/send/?phone=5551989602868&text=Olá!!';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'psicologocristianooliveira@gmail.com',
  );

  final _subjectController =
      TextEditingController(text: 'Cadastro Newsletter!');

  final _bodyController = TextEditingController(
    text: 'Preencha os campos para cadastro\n\n\n Nome:\n Celular:\n Email:',
  );

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Sucesso';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  String nome, email, celular;

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

  String _launchUrlBlog = 'https://psicologocristianooliveira.blogspot.com/';

  Future<void> _launchInBrowserBlog(String url) async {
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
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              color: Colors.teal[600],
            ),
            Column(
              children: [
                ListTile(
                    title: Text(
                      'Home',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.home,
                      color: Colors.teal[300],
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Inicio()));
                    }),
                ListTile(
                    title: Text(
                      'Sobre o Psicólogo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.done,
                      color: Colors.teal[300],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Opsicologo()));
                    }),
                ListTile(
                    title: Text(
                      'Blog',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.arrow_right,
                      color: Colors.teal[300],
                    ),
                    onTap: () {
                      _launchInBrowserBlog(_launchUrlBlog);
                    }),
                ListTile(
                    title: Text(
                      'Entrar em Contato',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal[300],
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contato()));
                    }),
                Divider(
                  height: 5,
                  color: Colors.black,
                ),
                ListTile(
                    title: Text(
                      'Fechar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.close,
                      color: Colors.teal[300],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(195, 20, 50, 1.0),
                  Color.fromRGBO(36, 11, 54, 1.0)
                ]),
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Navbar(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 40.0),
                    child: LandingPage(),
                  ),
                  Stack(alignment: Alignment.center, children: [
                    Container(
                      color: Colors.red,
                      margin:
                          EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
                      child: Image.asset(
                        'assets/images/imagem.gif',
                        scale: 0.1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      child: Column(
                        children: [
                          Text(
                            "Mudando Caminhos, Ampliando",
                            style: GoogleFonts.bubblegumSans(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Horizontes, Redescobrindo ideais...",
                            style: GoogleFonts.bubblegumSans(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
                    child: Image.asset(
                      'assets/images/bannercris.jpg',
                      scale: 0.1,
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 380.0,
                      child: new ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Card(
                            color: Colors.grey[200],
                            child: Container(
                              width: 350.0,
                              child: Column(children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Crises de ansiedade diante a epdemia",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/crisesdeansiedade.jpeg"),
                                            width: 250.0,
                                            height: 200.0,
                                          ),
                                        ),
                                        Container(
                                          width: 300.0,
                                          height: 120.0,
                                          child: Text(
                                              "Falar a respeito dessa realidade na qual estamos vivendo não é fácil, justo porque estamos todos enfrentando a mesma realidade..."),
                                        ),
                                      ],
                                    ),
                                    onTap: () async {
                                      await launch(
                                          'https://psicologocristianooliveira.blogspot.com/2020/08/crises-de-ansiedade-diante-epdemia.html');
                                    }),
                              ]),
                            ),
                            elevation: 5.0,
                          ),
                          Card(
                            color: Colors.grey[200],
                            child: Container(
                              width: 350.0,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Irritabilidade",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Center(
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/images/irritabilidade.jpg"),
                                              width: 200.0,
                                              height: 180.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: 300.0,
                                            height: 120.0,
                                            child: Text(
                                                "Irritabilidades. Geralmente vem acompanhado de situações frustracionais. Nao é fácil lidar com as emoções, dificilmente com o controle pulsional...."),
                                          ),
                                        ],
                                      ),
                                      onTap: () async {
                                        await launch(
                                            'https://psicologocristianooliveira.blogspot.com/2020/08/irritabilidade.html');
                                      }),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                            ),
                            elevation: 5.0,
                          ),
                        ],
                      )),
                  new Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.pink[700],
                    child: Text(
                      'UM POUCO SOBRE MIM...',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                  Card(
                    child: new Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 400.0,
                      color: Colors.orange[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40.0, right: 40.0),
                            child: Text(
                              'Psicólogo Cristiano Oliveira pode ajudar a fazer uma mudança positiva em sua vida. A partir de uma consulta prévia na clínica em Canoas e Porto Alegre, os pacientes recebem tratamento e terapia baseado na abordagem psicanalítica, sendo o atendimento voltado para todas as faixas etárias, desde crianças a idosos. Para agendar uma consulta, acesse nossas redes...',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          new MaterialButton(
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 40.0),
                              child: Text(
                                "Saiba Mais",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Colors.pink[700],
                    child: Center(
                        child: Text(
                      "Locais de Atendimento",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Card(
                    child: Container(
                      color: Colors.orange[100],
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                color: Colors.grey[200],
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/espacoreconhecer.jpg"),
                                          fit: BoxFit.fill,
                                          width: 150.0,
                                          height: 120.0,
                                        ),
                                        onTap: () async {
                                          await launch(
                                              'https://www.facebook.com/espacoReConhecerCanoas/');
                                        }),
                                    new MaterialButton(
                                      color: Colors.teal[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      onPressed: () {
                                        _launchInBrowser(_launchUrl);
                                      },
                                      child: Text(
                                        "CLIQUE AQUI",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                color: Colors.grey[200],
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/rmaissaude.jpg"),
                                          fit: BoxFit.fill,
                                          width: 150.0,
                                          height: 120.0,
                                        ),
                                        onTap: () async {
                                          await launch(
                                              'https://www.facebook.com/rmaissaudepoa/');
                                        }),
                                    new MaterialButton(
                                      color: Colors.teal[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      onPressed: () {
                                        _launchInBrowser(_launchUrl);
                                      },
                                      child: Text(
                                        "CLIQUE AQUI",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Colors.pink[700],
                    child: Center(
                        child: Text(
                      "Depoimentos",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Column(
                    children: [
                      Row(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new MaterialButton(
                            color: Colors.teal[400],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Text(
                              "Ver Depoimentos",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                          new MaterialButton(
                            color: Colors.teal[400],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddBlogPage()));
                            },
                            child: Text(
                              "Dar um Depoimento",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    color: Colors.pink[700],
                    child: Center(
                        child: Text(
                      "Inscrever-se para newsletter",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  new SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20.0, left: 5.0, right: 5.0, top: 5.0),
                          child: Column(
                            children: [
                              new SizedBox(height: 15.0),
                              new MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EmailSender()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50.0,
                                  color: Colors.teal[400],
                                  child: Text(
                                    'Cadastrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
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
        ),
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceInOut,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.teal[400],
        foregroundColor: Colors.white70,
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        overlayColor: Colors.grey,
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
            child: Icon(Icons.chat, color: Colors.white),
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
        elevation: 15,
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
