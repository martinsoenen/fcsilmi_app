import 'package:fcsilmi_app/models/player.dart';

import 'package:flutter/material.dart';

class PlayerDetailPage extends StatefulWidget {
  final Player player;

  PlayerDetailPage({this.player});

  @override
  _PlayerDetailPageState createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.player.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                ),
                Text("Note moyenne : " + widget.player.rating),
                Text("Matchs joués : " + widget.player.gamesPlayed.toString()),
                Text("Buts marqués : " + widget.player.goals.toString()),
                Text("Passes décisives : NC"),
                Text("Tirs : " + widget.player.shots.toString()),
                Text("Tirs/match : " + (widget.player.shots / widget.player.gamesPlayed).toStringAsFixed(2)),
                Text("Taux de réussite tirs : " + (widget.player.goals / widget.player.shots * 100).toStringAsFixed(2) + '%'),
                Text("Passes réussies : " + widget.player.passesmade.toString()),
                Text("Passes tentées : " + widget.player.passattempts.toString()),
                Text("Passes réussies/match : " + (widget.player.passesmade / widget.player.gamesPlayed).toStringAsFixed(2)),
                Text("Passes tentées/match : " + (widget.player.passattempts / widget.player.gamesPlayed).toStringAsFixed(2)),
                Text("Taux de réussite passes : " + (widget.player.passesmade / widget.player.passattempts * 100).toStringAsFixed(2) + '%'),
                Text("Tacles réussis : " + widget.player.tacklesmade.toString()),
                Text("Tacles tentés : " + widget.player.tackleattempts.toString()),
                Text("Tacles réussis/match : " + (widget.player.tacklesmade / widget.player.gamesPlayed).toStringAsFixed(2)),
                Text("Tacles tentés/match : " + (widget.player.tackleattempts / widget.player.gamesPlayed).toStringAsFixed(2)),
                Text("Taux de réussite tacles : " + (widget.player.tacklesmade / widget.player.tackleattempts * 100).toStringAsFixed(2) + '%'),
                Text("Titre d'homme du match : " + widget.player.mom.toString()),
                Text("Cartons rouges pris : " + widget.player.redcards.toString()),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://fcsilmi.club${widget.player.cover}"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
      )
    );
  }
}
