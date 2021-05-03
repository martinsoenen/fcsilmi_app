import 'package:fcsilmi_app/resources/StatText.dart';
import 'package:flutter/material.dart';

class DetailRowByTwo extends StatelessWidget {
  final String leftText;
  final String rightText;

  DetailRowByTwo({
    this.leftText,
    this.rightText,
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
              StatText(text: leftText),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              StatText(text: rightText),
            ],
          ),
        ),
      ],
    );
  }
}