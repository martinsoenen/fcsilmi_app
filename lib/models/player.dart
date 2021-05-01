import 'dart:convert';

Player playerFromJson(String name, String str) => Player.fromJson(name, json.decode(str));

String playerToJson(Player data) => json.encode(data.toJson());

class Player {
  Player({
    this.pseudo,
    this.cover,
    this.image,
    this.name,
    this.twitch,
    this.gamesPlayed,
    this.goals,
    this.goalsAgainst,
    this.shots,
    this.saves,
    this.passesmade,
    this.passattempts,
    this.tacklesmade,
    this.tackleattempts,
    this.redcards,
    this.mom,
    this.rating,
    this.assists,
    this.cleansheets,
    this.sessions,
  });

  String pseudo;
  String cover;
  String image;
  String name;
  String twitch;
  int gamesPlayed;
  int goals;
  int goalsAgainst;
  int shots;
  int saves;
  int passesmade;
  int passattempts;
  int tacklesmade;
  int tackleattempts;
  int redcards;
  int mom;
  String rating;
  dynamic assists;
  int cleansheets;
  Map<String, Session> sessions;

  factory Player.fromJson(String name, Map<String, dynamic> json) => Player(
    pseudo: name,
    cover: json["cover"],
    image: json["image"],
    name: json["name"],
    twitch: json["twitch"],
    gamesPlayed: json["gamesPlayed"],
    goals: json["goals"],
    goalsAgainst: json["goalsAgainst"],
    shots: json["shots"],
    saves: json["saves"],
    passesmade: json["passesmade"],
    passattempts: json["passattempts"],
    tacklesmade: json["tacklesmade"],
    tackleattempts: json["tackleattempts"],
    redcards: json["redcards"],
    mom: json["mom"],
    rating: json["rating"],
    assists: json["assists"],
    cleansheets: json["cleansheets"],
    sessions: Map.from(json["sessions"]).map((k, v) => MapEntry<String, Session>(k, Session.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "cover": cover,
    "image": image,
    "name": name,
    "twitch": twitch,
    "gamesPlayed": gamesPlayed,
    "goals": goals,
    "goalsAgainst": goalsAgainst,
    "shots": shots,
    "saves": saves,
    "passesmade": passesmade,
    "passattempts": passattempts,
    "tacklesmade": tacklesmade,
    "tackleattempts": tackleattempts,
    "redcards": redcards,
    "mom": mom,
    "rating": rating,
    "assists": assists,
    "cleansheets": cleansheets,
    "sessions": Map.from(sessions).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Session {
  Session({
    this.gamesPlayed,
    this.goals,
    this.goalsAgainst,
    this.shots,
    this.saves,
    this.passesmade,
    this.passattempts,
    this.tacklesmade,
    this.tackleattempts,
    this.redcards,
    this.mom,
    this.rating,
    this.assists,
    this.cleansheets,
  });

  int gamesPlayed;
  int goals;
  int goalsAgainst;
  int shots;
  int saves;
  int passesmade;
  int passattempts;
  int tacklesmade;
  int tackleattempts;
  int redcards;
  int mom;
  String rating;
  int assists;
  int cleansheets;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    gamesPlayed: json["gamesPlayed"],
    goals: json["goals"],
    goalsAgainst: json["goalsAgainst"],
    shots: json["shots"],
    saves: json["saves"],
    passesmade: json["passesmade"],
    passattempts: json["passattempts"],
    tacklesmade: json["tacklesmade"],
    tackleattempts: json["tackleattempts"],
    redcards: json["redcards"],
    mom: json["mom"],
    rating: json["rating"],
    assists: json["assists"] == null ? null : json["assists"],
    cleansheets: json["cleansheets"],
  );

  Map<String, dynamic> toJson() => {
    "gamesPlayed": gamesPlayed,
    "goals": goals,
    "goalsAgainst": goalsAgainst,
    "shots": shots,
    "saves": saves,
    "passesmade": passesmade,
    "passattempts": passattempts,
    "tacklesmade": tacklesmade,
    "tackleattempts": tackleattempts,
    "redcards": redcards,
    "mom": mom,
    "rating": rating,
    "assists": assists == null ? null : assists,
    "cleansheets": cleansheets,
  };
}