import 'package:fcsilmi_app/resources/const.dart';
import 'package:flutter/material.dart';

class ScoreText extends StatelessWidget {
  final int silmiResult;

  ScoreText({
    this.silmiResult,
  });

  @override
  Widget build(BuildContext context) {
    switch (silmiResult) {
      case 1:
        return Container(
          decoration: BoxDecoration(
            color: winGreen,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text("Victoire", style: TextStyle(color: Colors.white)),
          ),
        );

      case 16385:
        return Container(
          decoration: BoxDecoration(
            color: winGreen,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text("Victoire par abandon",
                style: TextStyle(color: Colors.white)),
          ),
        );

      case 4:
        return Container(
          decoration: BoxDecoration(
            color: greyTie,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text("Match nul", style: TextStyle(color: Colors.white)),
          ),
        );

      case 2:
        return Container(
          decoration: BoxDecoration(
            color: redLoss,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text("Défaite", style: TextStyle(color: Colors.white)),
          ),
        );

      case 10:
        return Container(
          decoration: BoxDecoration(
            color: redLoss,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text("Défaite par abandon",
                style: TextStyle(color: Colors.white)),
          ),
        );

      default:
        return Container(
          decoration: BoxDecoration(
            color: greyTie,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text("NC", style: TextStyle(color: Colors.white)),
          ),
        );
    }
  }
}
