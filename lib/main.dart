import 'package:fcsilmi_app/resources/NavBar.dart';
import 'package:fcsilmi_app/screens/infos.dart';
import 'package:fcsilmi_app/screens/matchResults.dart';
import 'package:fcsilmi_app/screens/stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                child: InfosPage(),
              ),
              new Container(
                child: StatsPage(),
              ),
              new Container(
                child: MatchResultsPage(),
              ),
            ],
          ),
          bottomNavigationBar: NavBar(),
        ),
      ),
    );
  }
}
