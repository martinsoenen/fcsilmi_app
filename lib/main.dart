import 'package:fcsilmi_app/screens/infos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FC Silmi',
      theme: ThemeData( // TODO : voir si ça vaut le coup de laisser ça
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InfosPage(),
    );
  }
}
