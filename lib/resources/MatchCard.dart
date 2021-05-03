import 'package:fcsilmi_app/models/match.dart';
import 'package:fcsilmi_app/resources/ScoreText.dart';
import 'package:fcsilmi_app/resources/const.dart';
import 'package:fcsilmi_app/screens/matchDetails.dart';

import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final SilmiMatch silmiMatch;
  final double imagesSize = 80;

  MatchCard({
    this.silmiMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 12),
            child: ScoreText(silmiResult: int.parse(this.silmiMatch.clubs.fcsilmi.result)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (this.silmiMatch.timestamp < 1619486263) Image.asset(
                      "assets/images/fcsilmi_old-white.png",
                      height: imagesSize,
                      width: imagesSize,
                    ),
                    if (this.silmiMatch.timestamp >= 1619486263) Image.asset(
                      "assets/images/fcsilmi_logo.png",
                      height: imagesSize,
                      width: imagesSize,
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
                "${this.silmiMatch.clubs.fcsilmi.goals} - ${this.silmiMatch.clubs.contestant.goals}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      this.silmiMatch.clubs.contestant.image,
                      height: imagesSize,
                      width: imagesSize,
                    ),
                    SizedBox(height: 7),
                    Text(
                      this.silmiMatch.clubs.contestant.name,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: IconButton(
              icon: Icon(
                Icons.article,
                color: greyTie,
                size: 32,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MatchDetailsPage(match: silmiMatch),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}