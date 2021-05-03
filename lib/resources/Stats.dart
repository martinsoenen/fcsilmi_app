import 'package:fcsilmi_app/models/infos.dart';
import 'package:fcsilmi_app/resources/DetailRowByTwo.dart';
import 'package:fcsilmi_app/resources/StatsDivider.dart';
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
          padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            children: [
              DetailRowByTwo(leftText: "Buts marqués", rightText: widget.info.alltimeGoals.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Buts encaissés", rightText: widget.info.alltimeGoalsAgainst.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Buts marqués/match", rightText: (widget.info.alltimeGoals / widget.info.totalGames).toStringAsFixed(2)),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Buts encaissés/match", rightText: (widget.info.alltimeGoalsAgainst / widget.info.totalGames).toStringAsFixed(2)),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Saisons disputées", rightText: widget.info.seasons.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Meilleur division", rightText: widget.info.bestDivision.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Titres remportés", rightText: widget.info.titlesWon.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Championnats remportés", rightText: widget.info.leaguesWon.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Coupes remportées", rightText: widget.info.totalCupsWon.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Promotions", rightText: widget.info.promotions.toString()),
              StatsDivider(color: fourthColor, padding: 10),
              DetailRowByTwo(leftText: "Relégations", rightText: widget.info.relegations.toString()),
            ],
          ),
        ),
      ],
    );
  }
}