import 'package:fcsilmi_app/resources/const.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  static const iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: fourthColor,
      child: TabBar(
        tabs: [
          Tab(
              icon: new Icon(Icons.contact_page_outlined, size: iconSize),
            ),
          Tab(
              icon: new Icon(Icons.analytics_outlined, size: iconSize),
            ),
          Tab(
              icon: new Icon(Icons.sports_soccer_outlined, size: iconSize),
            ),
        ],
        labelColor: primaryColor,
        unselectedLabelColor: fifthColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(8.0),
        indicatorColor: primaryColor,
      ),
    );
  }
}