import 'package:fcsilmi_app/resources/const.dart';
import 'package:flutter/material.dart';

class StatsDivider extends StatelessWidget {
  final bool restricted;

  StatsDivider({
    this.restricted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: restricted == true ? EdgeInsets.fromLTRB(60, 0, 60, 0) : EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Divider(
        color: fourthColor,
        thickness: 1,
      ),
    );
  }
}