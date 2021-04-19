import 'package:flutter/material.dart';
import 'package:psicologocristianooliveira/pages/body.dart';

class CartaoVisitaDigital extends StatefulWidget {
  @override
  _CartaoVisitaDigitalState createState() => _CartaoVisitaDigitalState();
}

class _CartaoVisitaDigitalState extends State<CartaoVisitaDigital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal[400],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Body(),
          ],
        ),
      ),
    );
  }
}
