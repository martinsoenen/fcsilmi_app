import 'package:fcsilmi_app/resources/DetailRowByTwo.dart';
import 'package:fcsilmi_app/resources/StatsDivider.dart';
import 'package:flutter/material.dart';

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
    print(widget.player);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            DetailRowByTwo(leftText: "Note", rightText: widget.player['rating'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Buts", rightText: widget.player['goals'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Tirs", rightText: widget.player['shots'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Arrêts", rightText: widget.player['saves'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Tâcles réussis", rightText: widget.player['tacklesmade'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Tâcles tentés", rightText: widget.player['tackleattempts'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Passes réussies", rightText: widget.player['passesmade'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Passes tentées", rightText: widget.player['passattempts'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Passes décisives", rightText: widget.player['assists'].toString()),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Carton rouge", rightText: widget.player['redcards'].toString() == "0" ? "Non" : "Oui"),
            StatsDivider(restricted: true),
            DetailRowByTwo(leftText: "Joueur du match", rightText: widget.player['mom'].toString() == "0" ? "Non" : "Oui"),
          ],
        ),
      ],
    );
  }
}