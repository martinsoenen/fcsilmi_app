import 'package:fcsilmi_app/resources/const.dart';
import 'package:flutter/material.dart';

class Point extends StatelessWidget {
  final String text;
  Color color;

  Point({
    this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (this.text == "wins") {this.color = winGreen;}
    else if (this.text == "losses") {this.color = redLoss;}
    else {this.color = greyTie;}

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        height: 20,
        width: 20,
      ),
    );
  }
}