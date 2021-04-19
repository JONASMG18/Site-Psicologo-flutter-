import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_blog_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Depoimentos');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25.0, top: 10.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Depoimentos',
                      style: GoogleFonts.bubblegumSans(
                          color: Colors.teal[400],
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold)),
                  PopupMenuButton(
                    color: Colors.teal[400],
                    icon: Icon(Icons.more_vert, color: Colors.blue[300]),
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                          child: Text('Log Out'), value: 'Log Out'),
                    ],
                    onSelected: (_) {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(documentId).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data.data();
                    return Text(
                        "Full Name: ${data['nome']} ${data['description']}");
                  }

                  return Text("loading");
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBlogPage()));
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue[300],
      ),
    );
  }
}
