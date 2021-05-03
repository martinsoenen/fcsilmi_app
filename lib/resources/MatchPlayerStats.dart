import 'package:fcsilmi_app/resources/DetailRowByTwo.dart';
import 'package:fcsilmi_app/resources/StatsDivider.dart';
import 'package:flutter/material.dart';
import 'const.dart';

class MatchPlayerStats extends StatefulWidget {
  final Map<dynamic, dynamic> player;

  MatchPlayerStats({
    this.player,
  });

  _MatchPlayerStatsState createState() => _MatchPlayerStatsState();
}

class _MatchPlayerStatsState extends State<MatchPlayerStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            SizedBox(height: 30),
            DetailRowByTwo(leftText: "Note", rightText: widget.player['rating'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Buts", rightText: widget.player['goals'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Tirs", rightText: widget.player['shots'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Arrêts", rightText: widget.player['saves'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Tâcles réussis", rightText: widget.player['tacklesmade'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Tâcles tentés", rightText: widget.player['tackleattempts'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Passes réussies", rightText: widget.player['passesmade'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Passes tentées", rightText: widget.player['passattempts'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Passes décisives", rightText: widget.player['assists'].toString()),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Carton rouge", rightText: widget.player['redcards'].toString() == "0" ? "Non" : "Oui"),
            StatsDivider(padding: 60, color: fourthColor),
            DetailRowByTwo(leftText: "Joueur du match", rightText: widget.player['mom'].toString() == "0" ? "Non" : "Oui"),
            SizedBox(height: 40),
          ],
        ),
      ],
    );
  }
}