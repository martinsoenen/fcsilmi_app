import 'package:fcsilmi_app/models/match.dart';
import 'package:fcsilmi_app/resources/MatchDetailRow.dart';
import 'package:fcsilmi_app/resources/ScoreText.dart';

import 'package:flutter/material.dart';

class MatchDetailsPage extends StatefulWidget {
  final SilmiMatch match;
  final double imagesSize = 80;

  MatchDetailsPage({
    this.match
  });

  @override
  _MatchDetailsPageState createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          MatchDetailRow(middleText: "Tirs",fcSilmiStat: widget.match.clubs.fcsilmi.shots.toString(), contestantStat: widget.match.clubs.contestant.shots.toString()),
          MatchDetailRow(middleText: "Arrêts",fcSilmiStat: widget.match.clubs.fcsilmi.saves.toString(), contestantStat: widget.match.clubs.contestant.saves.toString()),
          MatchDetailRow(middleText: "Tacles réussis",fcSilmiStat: widget.match.clubs.fcsilmi.tacklesmade.toString(), contestantStat: widget.match.clubs.contestant.tacklesmade.toString()),
          MatchDetailRow(middleText: "Tacles tentés",fcSilmiStat: widget.match.clubs.fcsilmi.tackleattempts.toString(), contestantStat: widget.match.clubs.contestant.tackleattempts.toString()),
          MatchDetailRow(middleText: "Taux de réussite tâcles",fcSilmiStat: (widget.match.clubs.fcsilmi.tacklesmade / widget.match.clubs.fcsilmi.tackleattempts * 100).toStringAsFixed(2) + '%', contestantStat: (widget.match.clubs.contestant.tacklesmade / widget.match.clubs.contestant.tackleattempts * 100).toStringAsFixed(2) + '%'),
          MatchDetailRow(middleText: "Passes réussies",fcSilmiStat: widget.match.clubs.fcsilmi.passesmade.toString(), contestantStat: widget.match.clubs.contestant.passesmade.toString()),
          MatchDetailRow(middleText: "Passes tentées",fcSilmiStat: widget.match.clubs.fcsilmi.passattempts.toString(), contestantStat: widget.match.clubs.contestant.passattempts.toString()),
          MatchDetailRow(middleText: "Taux de réussite passes",fcSilmiStat: (widget.match.clubs.fcsilmi.passesmade / widget.match.clubs.fcsilmi.passattempts * 100).toStringAsFixed(2) + '%', contestantStat: (widget.match.clubs.contestant.passesmade / widget.match.clubs.contestant.passattempts * 100).toStringAsFixed(2) + '%'),
          MatchDetailRow(middleText: "Cartons rouges",fcSilmiStat: widget.match.clubs.fcsilmi.redcards.toString(), contestantStat: widget.match.clubs.contestant.redcards.toString()),
        ],
        // TODO backend : données pour chaque joueur
      )
    );
  }
}