/*import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_page.dart';

class AddBlogPage extends StatefulWidget {
  @override
  _AddBlogPageState createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  String selectRating = "";

  var star = Icons.star;

  final _starController = TextEditingController();

  List<String> classificacao = ["Excelente", "Bom", "Médio", "Ruim", "Péssimo"];

  bool _isLoading = false;
  String _blogId = '';

  Future _uploadPost(String title, String description, String rating) async {
    setState(() {
      _isLoading = true;
    });
    DatabaseReference reference = FirebaseDatabase.instance.reference();

    _blogId = reference.child("Blogs").push().key;
    Map data = {'title': title, 'desc': description, 'rating': rating};
    reference.child("Blogs").child(_blogId).set(data).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        'Depoimentos',
                        style: GoogleFonts.bubblegumSans(
                            color: Colors.blue[300],
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                style: TextStyle(color: Colors.yellow),
                controller: _titleController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelText: 'Escreva seu nome...',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _descController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelText: 'Deixe um comentário...',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(13)),
                child: DropDownField(
                  labelText: 'Classificação:',
                  controller: _starController,
                  hintText: "Selecione a Classificação",
                  enabled: true,
                  itemsVisibleInDropdown: 5,
                  items: classificacao,
                  onValueChanged: (value) {
                    setState(() {
                      selectRating = value;
                    });
                  },
                ),
              ),
            )),
            SizedBox(height: 20.0),
            Container(
              height: 50.0,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_titleController.text.isEmpty &&
                      _descController.text.isEmpty &&
                      _starController.text.isEmpty) {
                    debugPrint('Provide Title and Description');
                  } else {
                    _uploadPost(_titleController.text, _descController.text,
                        _starController.text);
                  }
                },
                color: Colors.blue[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text('Enviar Depoimento',
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontSize: 20.0)),
              ),
            ),
            SizedBox(height: 20.0),
            _isLoading
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Center(
                      child: LinearProgressIndicator(minHeight: 5.0),
                    ),
                  )
                : Container(width: 0.0, height: 0.0)
          ],
        ),
      ),
    );
  }
}
*/
