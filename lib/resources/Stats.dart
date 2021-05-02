import 'package:fcsilmi_app/models/infos.dart';
import 'package:fcsilmi_app/resources/const.dart';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Stats extends StatelessWidget {
  final Infos info;

  Stats({
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(60),
          child: PieChart(
            dataMap: {
              "${info.wins} victoires": info.wins.toDouble(),
              "${info.ties} nuls": info.ties.toDouble(),
              "${info.losses} défaites": info.losses.toDouble(),
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
                  Text(info.alltimeGoals.toString()),
                  Text(info.alltimeGoalsAgainst.toString()),
                  Text((info.alltimeGoals / info.totalGames).toStringAsFixed(2)),
                  Text((info.alltimeGoalsAgainst / info.totalGames).toStringAsFixed(2)),
                  Text(info.seasons.toString()),
                  Text(info.bestDivision.toString()),
                  Text(info.titlesWon.toString()),
                  Text(info.leaguesWon.toString()),
                  Text(info.totalCupsWon.toString()),
                  Text(info.promotions.toString()),
                  Text(info.relegations.toString()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}