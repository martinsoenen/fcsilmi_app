import 'package:fcsilmi_app/resources/StatText.dart';
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
          padding: const EdgeInsets.all(60),
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
        Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 260),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  StatText(text: "Nombre de matchs joués"), // TODO voir si on ne peut pas mettre ça mieux
                  StatText(text: "Buts marqués"),
                  StatText(text: "Buts encaissés"),
                  StatText(text: "Buts marqués/match"),
                  StatText(text: "Buts encaissés/match"),
                  StatText(text: "Tirs"),
                  StatText(text: "Arrêts"),
                  StatText(text: "Tirs/match"),
                  StatText(text: "Arrêts/match"),
                  StatText(text: "Tacles réussis"),
                  StatText(text: "Tacles tentés"),
                  StatText(text: "Tacles réussis/match"),
                  StatText(text: "Tacles tentés/match"),
                  StatText(text: "Passes réussies"),
                  StatText(text: "Passes tentées"),
                  StatText(text: "Passes réussies/match"),
                  StatText(text: "Passes tentées/match"),
                  StatText(text: "Cartons rouges"),
                ],
              ),
              Column(
                children: [
                  StatText(text: info['games'].toString()),
                  StatText(text: info['goals'].toString()),
                  StatText(text: info['goalsAgainst'].toString()),
                  StatText(text: (info['goals'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: (info['goalsAgainst'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: info['shots'].toString()),
                  StatText(text: info['saves'].toString()),
                  StatText(text: (info['shots'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: (info['saves'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: info['tacklesmade'].toString()),
                  StatText(text: info['tackleattempts'].toString()),
                  StatText(text: (info['tacklesmade'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: (info['tackleattempts'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: info['passesmade'].toString()),
                  StatText(text: info['passattempts'].toString()),
                  StatText(text: (info['passesmade'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: (info['passattempts'] / (info['games'])).toStringAsFixed(2)),
                  StatText(text: info['redcards'].toString()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}