import 'package:fcsilmi_app/models/player.dart';
import 'package:fcsilmi_app/resources/StatsDivider.dart';
import 'package:fcsilmi_app/resources/const.dart';

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
    // TODO plus tard : fond foncé -> couleur claire, fond clair -> couleur foncée

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 0),
                  Text(
                    widget.player.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text("Note moyenne : " + widget.player.rating),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Matchs joués : " + widget.player.gamesPlayed.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Buts marqués : " + widget.player.goals.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Passes décisives : NC"),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Tirs : " + widget.player.shots.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Tirs/match : " + (widget.player.shots / widget.player.gamesPlayed).toStringAsFixed(2)),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Taux de réussite tirs : " + (widget.player.goals / widget.player.shots * 100).toStringAsFixed(2) + '%'),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Passes réussies : " + widget.player.passesmade.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Passes tentées : " + widget.player.passattempts.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Passes réussies/match : " + (widget.player.passesmade / widget.player.gamesPlayed).toStringAsFixed(2)),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Passes tentées/match : " + (widget.player.passattempts / widget.player.gamesPlayed).toStringAsFixed(2)),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Taux de réussite passes : " + (widget.player.passesmade / widget.player.passattempts * 100).toStringAsFixed(2) + '%'),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Tacles réussis : " + widget.player.tacklesmade.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Tacles tentés : " + widget.player.tackleattempts.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Tacles réussis/match : " + (widget.player.tacklesmade / widget.player.gamesPlayed).toStringAsFixed(2)),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Tacles tentés/match : " + (widget.player.tackleattempts / widget.player.gamesPlayed).toStringAsFixed(2)),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Taux de réussite tacles : " + (widget.player.tacklesmade / widget.player.tackleattempts * 100).toStringAsFixed(2) + '%'),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Titre d'homme du match : " + widget.player.mom.toString()),
                        StatsDivider(padding: 120, color: Color.fromRGBO(235, 236, 237, 0.4)),
                        Text("Cartons rouges pris : " + widget.player.redcards.toString()),
                      ],
                    ),
                  ),
                  SizedBox(height: 0),
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://fcsilmi.club${widget.player.cover}"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
            colorFilter: new ColorFilter.mode(Colors.transparent.withOpacity(0.75), BlendMode.dstIn),
          ),
        ),
      )
    );
  }
}
