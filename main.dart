import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Main",
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
