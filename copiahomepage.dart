/*import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psicologocristianooliveira/blog/blogs.dart';

import 'add_blog_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Blogs> blogsData = [];

  //_getBlogData() async {
   // DatabaseReference reference = FirebaseDatabase.instance.reference();
    //reference.child("Blogs").once().then((DataSnapshot snapshot) {
     // var keys = snapshot.value.keys;
     // var data = snapshot.value;

     // blogsData.clear();

      for (var singleKey in keys) {
        Blogs blogModel = Blogs(
          title: data[singleKey]["title"],
          desc: data[singleKey]["desc"],
          rating: data[singleKey]["rating"],
        );
        setState(() {
          blogsData.add(blogModel);
          blogsData.reversed;
        });
        reference.keepSynced(true);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getBlogData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
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
                          color: Colors.blue[300],
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold)),
                  PopupMenuButton(
                    color: Colors.yellow,
                    icon: Icon(Icons.more_vert, color: Colors.blue[300]),
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                          child: Text('Log Out'), value: 'Log Out'),
                    ],
                    onSelected: (_) {
                    
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: blogsData == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: blogsData.length,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      itemBuilder: (context, index) {
                        return SingleItem(
                            title: blogsData[index].title,
                            description: blogsData[index].desc,
                            rating: blogsData[index].rating);
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

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  String title, description, rating;

  SingleItem({Key key, this.title, this.description, this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome: " + title,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.0),
                    Text("Depoimento: " + description,
                        style: GoogleFonts.openSans(
                            color: Colors.white, fontSize: 18.0)),
                    SizedBox(height: 10.0),
                    Text("Classificou como: " + rating,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 15.0,
                        )),
                    SizedBox(height: 5.0)
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.0),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}*/
