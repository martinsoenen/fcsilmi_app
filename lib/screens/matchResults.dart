import 'package:flutter/material.dart';

class MatchResultsPage extends StatefulWidget {
  @override
  _MatchResultsPageState createState() => _MatchResultsPageState();
}

class _MatchResultsPageState extends State<MatchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Page de résultats des matchs',
          ),
        ],
      ),
    );
  }
}