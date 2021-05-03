import 'package:fcsilmi_app/resources/StatText.dart';
import 'package:flutter/material.dart';

class DetailRowByThree extends StatelessWidget {
  final String fcSilmiStat;
  final String contestantStat;
  final String middleText;

  DetailRowByThree({
    this.fcSilmiStat,
    this.contestantStat,
    this.middleText
  });

  @override
  Widget build(BuildContext context) {
    return Row( // Détails
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              StatText(text: fcSilmiStat),
            ],
          ),
        ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                StatText(text: middleText),
              ],
            )
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              StatText(text: contestantStat),
            ],
          ),
        ),
      ],
    );
  }
}