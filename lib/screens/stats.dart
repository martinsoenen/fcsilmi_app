import 'package:fcsilmi_app/models/infos.dart';
import 'package:fcsilmi_app/resources/SessionStats.dart';
import 'package:fcsilmi_app/resources/Stats.dart';
import 'package:fcsilmi_app/resources/const.dart';
import 'package:fcsilmi_app/resources/Point.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatsPage extends StatefulWidget {
  String selectedSession = "Toutes sessions";

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
          List<String> datesSessions = List<String>();
          datesSessions.add("Toutes sessions");

          info.sessions.forEach((key, value) {
            datesSessions.add(key);
          });

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      'https://raw.githubusercontent.com/wbeuil/fcsilmi/b784ff28047fc10eef6ef29f8f89af4bce48464a/public/images/fcsilmi.png',
                      height: 160.0,
                      width: 160.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "FC Silmi",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 42),
                  ),
                  SizedBox(height: 40),
                  DropdownButton(
                      items: datesSessions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: widget.selectedSession,
                      onChanged: (value) {
                        setState(() => widget.selectedSession = value);
                      },
                  ),
                  widget.selectedSession != null && widget.selectedSession != "Toutes sessions" ? SessionStats(info: info.sessions[widget.selectedSession]) : Stats(info: info),
                  SizedBox(height: 46),
                  Text(
                    "Saison actuelle",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,14,20,30),
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
              )
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
