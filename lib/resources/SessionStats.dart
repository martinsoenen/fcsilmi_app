import 'package:fcsilmi_app/resources/DetailRowByTwo.dart';
import 'package:fcsilmi_app/resources/StatsDivider.dart';
import 'package:fcsilmi_app/resources/const.dart';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SessionStats extends StatelessWidget {
  final Map<dynamic, dynamic> info;

  SessionStats({
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
          child: PieChart(
            dataMap: {
              "${info["wins"]} victoires": info["wins"].toDouble(),
              "${info["ties"]} nuls": info["ties"].toDouble(),
              "${info["losses"]} défaites": info["losses"].toDouble(),
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
          child: Container(
            child: Column(
              children: [
                DetailRowByTwo(leftText: "Nombre de matchs joués", rightText: info['games'].toString()), // TODO voir si on ne peut pas mettre ça mieux
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Buts marqués", rightText: info['goals'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Buts encaissés", rightText: info['goalsAgainst'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Buts marqués/match", rightText: (info['goals'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Buts encaissés/match", rightText: (info['goalsAgainst'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Tirs", rightText: info['shots'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Arrêts", rightText: info['saves'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Tirs/match", rightText: (info['shots'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Arrêts/match", rightText: (info['saves'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Tacles réussis", rightText: info['tacklesmade'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Tacles tentés", rightText: info['tackleattempts'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Tacles réussis/match", rightText: (info['tacklesmade'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Tacles tentés/match", rightText: (info['tackleattempts'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Passes réussies", rightText: info['passesmade'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Passes tentées", rightText: info['passattempts'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Passes réussies/match", rightText: (info['passesmade'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Passes tentées/match", rightText: (info['passattempts'] / (info['games'])).toStringAsFixed(2)),
                StatsDivider(color: fourthColor, padding: 10),
                DetailRowByTwo(leftText: "Cartons rouges", rightText: info['redcards'].toString()),
                StatsDivider(color: fourthColor, padding: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}