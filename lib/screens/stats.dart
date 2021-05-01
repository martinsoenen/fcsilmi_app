import 'dart:convert';

import 'package:fcsilmi_app/models/infos.dart';
import 'package:fcsilmi_app/resources/Point.dart';
import 'package:fcsilmi_app/resources/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInfos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var info = snapshot.data as Infos;

          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 90),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      'https://raw.githubusercontent.com/wbeuil/fcsilmi/main/public/images/fcsilmi.jpg',
                      height: 120.0,
                      width: 120.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "FC Silmi",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 42),
                  ),
                  SizedBox(height: 40),
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
                            Text("Total de points"),
                            Text("Buts marqués"),
                            Text("Buts encaissés"),
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
                            Text(info.points.toString()),
                            Text(info.alltimeGoals.toString()),
                            Text(info.alltimeGoalsAgainst.toString()),
                            Text(info.seasons.toString()),
                            Text(info.bestDivision.toString()),
                            Text(info.titlesWon.toString()),
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
                  SizedBox(height: 40),
                  Text(
                    "Saison actuelle",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,20,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,20,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Image.network(
                            'https://media.contentapi.ea.com/content/dam/eacom/fifa/pro-clubs/divisioncrest${info.currentDivision.toString()}.png',
                            height: 120.0,
                            width: 120.0,
                          ),
                        ),
                        Column(
                          children: [
                            Text("Points : ${info.points}"),
                            Text("Résultats actuels : ${info.seasonWins}-${info.seasonTies}-${info.seasonLosses}"),
                            Row(
                              children: [
                                for (var item in info.recentResults) Point(text: item)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}

getInfos() async {
  var response = await http.get(apiUrl + "/info");

  if (response.statusCode == 200) {
    return Infos.fromJson(json.decode(response.body));
  } else {
    // TODO errorToast
    print(response.statusCode);
  }
}