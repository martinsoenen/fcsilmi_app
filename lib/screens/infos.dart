import 'package:fcsilmi_app/resources/NavBar.dart';
import 'package:flutter/material.dart';

class InfosPage extends StatefulWidget {
  @override
  _InfosPageState createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Page d\'informations',
          ),
        ],
      ),
    );
  }
}