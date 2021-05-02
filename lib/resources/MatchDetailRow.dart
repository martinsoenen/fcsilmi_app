import 'package:flutter/material.dart';

class MatchDetailRow extends StatelessWidget {
  final String fcSilmiStat;
  final String contestantStat;
  final String middleText;

  MatchDetailRow({
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
              Text(fcSilmiStat),
            ],
          ),
        ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  middleText,
                  textAlign: TextAlign.center,
                )
              ],
            )
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(contestantStat),
            ],
          ),
        ),
      ],
    );
  }
}