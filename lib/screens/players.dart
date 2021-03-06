import 'dart:convert';
import 'package:fcsilmi_app/resources/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:fcsilmi_app/models/player.dart';
import 'package:fcsilmi_app/resources/const.dart';
import 'package:fcsilmi_app/screens/playerDetail.dart';

class PlayersPage extends StatefulWidget {
  @override
  _PlayersPageState createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joueurs"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: getPlayers(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData){
                    Map<String, dynamic> body = jsonDecode(snapshot.data);

                    List<Player> players = [];
                    body.forEach((key, value) {
                      players.add(Player.fromJson(key, value));
                    });
                    players.sort((a, b) => a.pseudo.compareTo(b.pseudo));

                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey,
                        ),
                        itemCount: players.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(backgroundImage: NetworkImage(players[index].image)), // TODO later : cache image
                            title: Text(players[index].pseudo),
                            subtitle: Text(players[index].name),
                            trailing: new Icon(Icons.arrow_forward_ios),
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => PlayerDetailPage(
                                  player: players[index],
                                ),
                              )
                            ),
                          );
                        }
                      ),
                    );
                  }
                  else if (snapshot.hasError) {
                    showErrorToast("Erreur pour joindre l'API : ${snapshot.error}");
                    return null;
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
              },
            )
          ],
        ),
      ),
    );
  }
}

getPlayers() async {
  var response = await http.get(apiUrl + "/players");

  if (response.statusCode == 200) {
    return response.body;
  } else {
    showErrorToast("Erreur ${response.statusCode} : ${response.body}");
    return null;
  }
}