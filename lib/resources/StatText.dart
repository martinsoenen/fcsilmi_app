import 'package:flutter/material.dart';

class StatText extends StatelessWidget {
  final String text;

  StatText({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Text(
          this.text,
          textAlign: TextAlign.center,
      ),
    );
  }
}
