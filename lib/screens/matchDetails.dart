import 'package:fcsilmi_app/models/match.dart';
import 'package:fcsilmi_app/resources/DetailRowByThree.dart';
import 'package:fcsilmi_app/resources/MatchPlayerStats.dart';
import 'package:fcsilmi_app/resources/ScoreText.dart';
import 'package:fcsilmi_app/resources/StatsDivider.dart';
import 'package:fcsilmi_app/resources/const.dart';

import 'package:flutter/material.dart';

class MatchDetailsPage extends StatefulWidget {
  final SilmiMatch match;
  final double imagesSize = 80;
  String selectedPlayer;

  MatchDetailsPage({
    this.match
  });

  @override
  _MatchDetailsPageState createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List<String> matchPlayers = List<String>();
    widget.match.players.forEach((key, value) {
      matchPlayers.add(key);
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 12),
                child: ScoreText(silmiResult: int.parse(widget.match.clubs.fcsilmi.result)),
              ),
              Row( // En-tête
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          "assets/images/fcsilmi-white.png",
                          height: widget.imagesSize,
                          width: widget.imagesSize,
                        ),
                        SizedBox(height: 7),
                        Text(
                          "FC Silmi",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${widget.match.clubs.fcsilmi.goals} - ${widget.match.clubs.contestant.goals}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          widget.match.clubs.contestant.image,
                          height: widget.imagesSize,
                          width: widget.imagesSize,
                        ),
                        SizedBox(height: 7),
                        Text(
                          widget.match.clubs.contestant.name,
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              DetailRowByThree(middleText: "Tirs",fcSilmiStat: widget.match.clubs.fcsilmi.shots.toString(), contestantStat: widget.match.clubs.contestant.shots.toString()),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Arrêts",fcSilmiStat: widget.match.clubs.fcsilmi.saves.toString(), contestantStat: widget.match.clubs.contestant.saves.toString()),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Tacles réussis",fcSilmiStat: widget.match.clubs.fcsilmi.tacklesmade.toString(), contestantStat: widget.match.clubs.contestant.tacklesmade.toString()),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Tacles tentés",fcSilmiStat: widget.match.clubs.fcsilmi.tackleattempts.toString(), contestantStat: widget.match.clubs.contestant.tackleattempts.toString()),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Taux de réussite tâcles",fcSilmiStat: (widget.match.clubs.fcsilmi.tacklesmade / widget.match.clubs.fcsilmi.tackleattempts * 100).toStringAsFixed(2) + '%', contestantStat: (widget.match.clubs.contestant.tacklesmade / widget.match.clubs.contestant.tackleattempts * 100).toStringAsFixed(2) + '%'),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Passes réussies",fcSilmiStat: widget.match.clubs.fcsilmi.passesmade.toString(), contestantStat: widget.match.clubs.contestant.passesmade.toString()),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Passes tentées",fcSilmiStat: widget.match.clubs.fcsilmi.passattempts.toString(), contestantStat: widget.match.clubs.contestant.passattempts.toString()),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Taux de réussite passes",fcSilmiStat: (widget.match.clubs.fcsilmi.passesmade / widget.match.clubs.fcsilmi.passattempts * 100).toStringAsFixed(2) + '%', contestantStat: (widget.match.clubs.contestant.passesmade / widget.match.clubs.contestant.passattempts * 100).toStringAsFixed(2) + '%'),
              StatsDivider(color: fourthColor, padding: 100),
              DetailRowByThree(middleText: "Cartons rouges",fcSilmiStat: widget.match.clubs.fcsilmi.redcards.toString(), contestantStat: widget.match.clubs.contestant.redcards.toString()),
              SizedBox(height: 40),
              DropdownButton(
                  items: matchPlayers.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text("Voir les statistiques d'un joueur"),
                  value: widget.selectedPlayer,
                  onChanged: (value) => {
                    setState(() => widget.selectedPlayer = value),
                  },
              ),
              if (widget.selectedPlayer != null) MatchPlayerStats(player: widget.match.players[widget.selectedPlayer])
            ],
          ),
        ),
      )
    );
  }
}