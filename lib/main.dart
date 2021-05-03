import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fcsilmi_app/resources/const.dart';
import 'package:fcsilmi_app/screens/matchResults.dart';
import 'package:fcsilmi_app/screens/players.dart';
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
      home: Page()
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: sixthColor,
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: primaryColor
            )
        ),
        textSelectionColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      color: primaryColor,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
            children: [
              StatsPage(),
              PlayersPage(),
              MatchResultsPage(),
            ],
            onPageChanged: (int index) {
              _pageController.jumpToPage(index);
            }
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: sixthColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: primaryColor,
          height: 55,
          items: <Widget>[
            Icon(Icons.analytics_outlined, size: 30, color: oldPrimaryColor),
            Icon(Icons.contact_page_outlined, size: 30, color: oldPrimaryColor),
            Icon(Icons.sports_soccer_outlined, size: 30, color: oldPrimaryColor),
          ],
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
