import 'package:flutter/material.dart';

class StatsDivider extends StatelessWidget {
  final double padding;
  final Color color;

  StatsDivider({
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
      child: Divider(
        color: color,
        thickness: 1,
      ),
    );
  }
}