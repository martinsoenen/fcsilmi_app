import 'dart:convert';

SilmiMatch matchFromJson(String str) => SilmiMatch.fromJson(json.decode(str));

String matchToJson(SilmiMatch data) => json.encode(data.toJson());

class SilmiMatch {
  SilmiMatch({
    this.id,
    this.timestamp,
    this.clubs,
    this.players,
  });

  String id;
  int timestamp;
  MatchClubs clubs;
  Map<String, dynamic> players;

  factory SilmiMatch.fromJson(Map<String, dynamic> json) => SilmiMatch(
    id: json["id"],
    timestamp: json["timestamp"],
    clubs: MatchClubs.fromJson(json["clubs"]),
    players: json["players"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "timestamp": timestamp,
    "clubs": clubs.toJson(),
    "players": players,
  };
}

class MatchClubs {
  MatchClubs({
    this.fcsilmi,
    this.contestant,
  });

  MatchClub fcsilmi;
  MatchClub contestant;

  factory MatchClubs.fromJson(Map<String, dynamic> json) => MatchClubs(
    fcsilmi: MatchClub.fromJson(json["fcsilmi"]),
    contestant: MatchClub.fromJson(json["contestant"]),
  );

  Map<String, dynamic> toJson() => {
    "fcsilmi": fcsilmi.toJson(),
    "contestant": contestant.toJson(),
  };
}

class MatchClub {
  MatchClub({
    this.name,
    this.image,
    this.goals,
    this.shots,
    this.saves,
    this.tacklesmade,
    this.tackleattempts,
    this.passesmade,
    this.passattempts,
    this.redcards,
    this.result,
  });

  String name;
  String image;
  String goals;
  int shots;
  int saves;
  int tacklesmade;
  int tackleattempts;
  int passesmade;
  int passattempts;
  int redcards;
  String result;

  factory MatchClub.fromJson(Map<String, dynamic> json) => MatchClub(
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    goals: json["goals"],
    shots: json["shots"],
    saves: json["saves"],
    tacklesmade: json["tacklesmade"],
    tackleattempts: json["tackleattempts"],
    passesmade: json["passesmade"],
    passattempts: json["passattempts"],
    redcards: json["redcards"],
    result: json["result"] == null ? null : json["result"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "goals": goals,
    "shots": shots,
    "saves": saves,
    "tacklesmade": tacklesmade,
    "tackleattempts": tackleattempts,
    "passesmade": passesmade,
    "passattempts": passattempts,
    "redcards": redcards,
    "result": result == null ? null : result,
  };
}