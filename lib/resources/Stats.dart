import 'package:fcsilmi_app/models/infos.dart';
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
                  Text("Buts marqués"),
                  Text("Buts encaissés"),
                  Text("Buts marqués/match"),
                  Text("Buts encaissés/match"),
                  Text("Saisons disputées"),
                  Text("Meilleur division"),
                  Text("Titres remportés"),
                  Text("Championnats remportés"),
                  Text("Coupes remportées"),
                  Text("Promotions"),
                  Text("Relégations"),
                ],
              ),
              Column(
                children: [
                  Text(widget.info.alltimeGoals.toString()),
                  Text(widget.info.alltimeGoalsAgainst.toString()),
                  Text((widget.info.alltimeGoals / widget.info.totalGames).toStringAsFixed(2)),
                  Text((widget.info.alltimeGoalsAgainst / widget.info.totalGames).toStringAsFixed(2)),
                  Text(widget.info.seasons.toString()),
                  Text(widget.info.bestDivision.toString()),
                  Text(widget.info.titlesWon.toString()),
                  Text(widget.info.leaguesWon.toString()),
                  Text(widget.info.totalCupsWon.toString()),
                  Text(widget.info.promotions.toString()),
                  Text(widget.info.relegations.toString()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}