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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("Note"),
                Text("Buts"),
                Text("Tirs"),
                Text("Arrêts"),
                Text("Tâcles réussis"),
                Text("Tâcles tentés"),
                Text("Passes réussies"),
                Text("Passes tentées"),
                Text("Passes décisives"),
                Text("Carton rouge"),
                Text("Joueur du match"),
              ],
            ),
            Column(
              children: [
                Text(widget.player['rating'].toString()),
                Text(widget.player['goals'].toString()),
                Text(widget.player['shots'].toString()),
                Text(widget.player['saves'].toString()),
                Text(widget.player['tacklesmade'].toString()),
                Text(widget.player['tackleattempts'].toString()),
                Text(widget.player['passesmade'].toString()),
                Text(widget.player['passattempts'].toString()),
                Text(widget.player['assists'].toString()),
                Text(widget.player['redcards'].toString() == "0" ? "Non" : "Oui"),
                Text(widget.player['mom'].toString() == "0" ? "Non" : "Oui"),
              ],
            )
          ],
        ),
      ],
    );
  }
}