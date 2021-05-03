import 'package:fcsilmi_app/models/infos.dart';
import 'package:fcsilmi_app/resources/StatText.dart';
import 'package:fcsilmi_app/resources/const.dart';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Stats extends StatefulWidget {
  final Infos info;

  Stats({
    this.info,
  });

  _StatsState createState() => _StatsState();

}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(60),
          child: PieChart(
            dataMap: {
              "${widget.info.wins} victoires": widget.info.wins.toDouble(),
              "${widget.info.ties} nuls": widget.info.ties.toDouble(),
              "${widget.info.losses} défaites": widget.info.losses.toDouble(),
            },
            colorList: [
              winGreen,
              greyTie,
              redLoss,
            ],
            initialAngleInDegree: -120,
            legendOptions: LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValuesInPercentage: true,
            ),
            chartType: ChartType.ring,
          ),
        ),
        Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 260),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  StatText(text: "Buts marqués"),
                  StatText(text: "Buts encaissés"),
                  StatText(text: "Buts marqués/match"),
                  StatText(text: "Buts encaissés/match"),
                  StatText(text: "Saisons disputées"),
                  StatText(text: "Meilleur division"),
                  StatText(text: "Titres remportés"),
                  StatText(text: "Championnats remportés"),
                  StatText(text: "Coupes remportées"),
                  StatText(text: "Promotions"),
                  StatText(text: "Relégations"),
                ],
              ),
              Column(
                children: [
                  StatText(text: widget.info.alltimeGoals.toString()),
                  StatText(text: widget.info.alltimeGoalsAgainst.toString()),
                  StatText(text: (widget.info.alltimeGoals / widget.info.totalGames).toStringAsFixed(2)),
                  StatText(text: (widget.info.alltimeGoalsAgainst / widget.info.totalGames).toStringAsFixed(2)),
                  StatText(text: widget.info.seasons.toString()),
                  StatText(text: widget.info.bestDivision.toString()),
                  StatText(text: widget.info.titlesWon.toString()),
                  StatText(text: widget.info.leaguesWon.toString()),
                  StatText(text: widget.info.totalCupsWon.toString()),
                  StatText(text: widget.info.promotions.toString()),
                  StatText(text: widget.info.relegations.toString()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}