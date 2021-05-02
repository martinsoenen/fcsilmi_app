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
    print(info);

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
                  Text("Nombre de matchs joués"), // TODO voir si on ne peut pas mettre ça mieux
                  Text("Buts marqués"),
                  Text("Buts encaissés"),
                  Text("Buts marqués/match"),
                  Text("Buts encaissés/match"),
                  Text("Tirs"),
                  Text("Arrêts"),
                  Text("Tirs/match"),
                  Text("Arrêts/match"),
                  Text("Tacles réussis"),
                  Text("Tacles tentés"),
                  Text("Tacles réussis/match"),
                  Text("Tacles tentés/match"),
                  Text("Passes réussies"),
                  Text("Passes tentées"),
                  Text("Passes réussies/match"),
                  Text("Passes tentées/match"),
                  Text("Cartons rouges"),
                ],
              ),
              Column(
                children: [
                  Text(info['games'].toString()),
                  Text(info['goals'].toString()),
                  Text(info['goalsAgainst'].toString()),
                  Text((info['goals'] / (info['games'])).toStringAsFixed(2)),
                  Text((info['goalsAgainst'] / (info['games'])).toStringAsFixed(2)),
                  Text(info['shots'].toString()),
                  Text(info['saves'].toString()),
                  Text((info['shots'] / (info['games'])).toStringAsFixed(2)),
                  Text((info['saves'] / (info['games'])).toStringAsFixed(2)),
                  Text(info['tacklesmade'].toString()),
                  Text(info['tackleattempts'].toString()),
                  Text((info['tacklesmade'] / (info['games'])).toStringAsFixed(2)),
                  Text((info['tackleattempts'] / (info['games'])).toStringAsFixed(2)),
                  Text(info['passesmade'].toString()),
                  Text(info['passattempts'].toString()),
                  Text((info['passesmade'] / (info['games'])).toStringAsFixed(2)),
                  Text((info['passattempts'] / (info['games'])).toStringAsFixed(2)),
                  Text(info['redcards'].toString()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}