import 'package:flutter/material.dart';

class SobreoPsicologo extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.topCenter,
                height: 190.0,
                width: 190.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/fotocris.jpg"),
                  ),
                ),
              ),
            ),
            new RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "\r\n Seja bem-vindo ao meu site.\r\n\r\n\r\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white)),
                  TextSpan(
                      text:
                          "Psicólogo Cristiano Oliveira pode ajudar a fazer uma mudança positiva em sua vida. A partir de uma consulta prévia na clínica em Canoas e Porto Alegre, os pacientes recebem tratamento e terapia baseado na abordagem psicanalítica, sendo o atendimento voltado para todas as faixas etárias, desde crianças a idosos. Para agendar uma consulta, acesse nossas redes.\r\n\r\n",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  TextSpan(
                      text:
                          "Abordagem Profissional Cada um reage de uma forma aos mais diferentes traumas. Com embasamento na psicanálise, estou determinado a oferecer o melhor serviço possível a meus pacientes. A prioridade é recuperar sua saúde mental e energia para conseguir dar os passos seguintes. Psicanálise A Psicanálise permite a compreensão do mundo inconsciente, resolvendo as causas das patologias, encontrando soluções para os problemas emocionais e promovendo o desenvolvimento da personalidade da pessoa, modificando a qualidade das relações intrapsíquicas e interpsíquicas.\r\n\r\n",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  TextSpan(
                      text:
                          "Serviços e produtos Atendimentos Psicoterapêuticos Psicoterapia Psicanalítica Infantil Psicoterapia Psicanalítica com Adolescentes Psicoterapia Psicanalítica com Adultos.\r\n\r\n",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
