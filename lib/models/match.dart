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
  MatchPlayers players;

  factory SilmiMatch.fromJson(Map<String, dynamic> json) => SilmiMatch(
    id: json["id"],
    timestamp: json["timestamp"],
    clubs: MatchClubs.fromJson(json["clubs"]),
    players: MatchPlayers.fromJson(json["players"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "timestamp": timestamp,
    "clubs": clubs.toJson(),
    "players": players.toJson(),
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

class MatchPlayers {
  MatchPlayers({
    this.misterMv,
    this.ponce,
    this.etoiles,
    this.rivenzi,
    this.domingo,
    this.jiraya,
    this.dfg,
    this.xari,
  });

  MatchPlayer misterMv;
  MatchPlayer ponce;
  MatchPlayer etoiles;
  MatchPlayer rivenzi;
  MatchPlayer domingo;
  MatchPlayer jiraya;
  MatchPlayer dfg;
  MatchPlayer xari;

  factory MatchPlayers.fromJson(Map<String, dynamic> json) => MatchPlayers(
    misterMv: json["MisterMV"] != null ? MatchPlayer.fromJson(json["MisterMV"]) : null,
    ponce: json["Ponce"] != null ? MatchPlayer.fromJson(json["Ponce"]) : null,
    etoiles: json["Etoiles"] != null ? MatchPlayer.fromJson(json["Etoiles"]) : null,
    rivenzi: json["Rivenzi"] != null ? MatchPlayer.fromJson(json["Rivenzi"]) : null,
    domingo: json["Domingo"] != null ? MatchPlayer.fromJson(json["Domingo"]) : null,
    jiraya: json["Jiraya"] != null ? MatchPlayer.fromJson(json["Jiraya"]) : null,
    dfg: json["DFG"] != null ? MatchPlayer.fromJson(json["DFG"]) : null,
    xari: json["Xari"] != null ? MatchPlayer.fromJson(json["Xari"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "MisterMV": misterMv.toJson(),
    "Ponce": ponce.toJson(),
    "Etoiles": etoiles.toJson(),
    "Rivenzi": rivenzi.toJson(),
    "Domingo": domingo.toJson(),
    "Jiraya": jiraya.toJson(),
    "DFG": dfg.toJson(),
    "Xari": xari.toJson(),
  };
}

class MatchPlayer {
  MatchPlayer({
    this.rating,
    this.goals,
    this.shots,
    this.saves,
    this.tacklesmade,
    this.tackleattempts,
    this.passesmade,
    this.passattempts,
    this.redcards,
    this.mom,
    this.assists,
    this.cleansheets,
  });

  String rating;
  String goals;
  String shots;
  String saves;
  String tacklesmade;
  String tackleattempts;
  String passesmade;
  String passattempts;
  String redcards;
  String mom;
  String assists;
  String cleansheets;

  factory MatchPlayer.fromJson(Map<String, dynamic> json) => MatchPlayer(
    rating: json["rating"],
    goals: json["goals"],
    shots: json["shots"],
    saves: json["saves"],
    tacklesmade: json["tacklesmade"],
    tackleattempts: json["tackleattempts"],
    passesmade: json["passesmade"],
    passattempts: json["passattempts"],
    redcards: json["redcards"],
    mom: json["mom"],
    assists: json["assists"],
    cleansheets: json["cleansheets"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "goals": goals,
    "shots": shots,
    "saves": saves,
    "tacklesmade": tacklesmade,
    "tackleattempts": tackleattempts,
    "passesmade": passesmade,
    "passattempts": passattempts,
    "redcards": redcards,
    "mom": mom,
    "assists": assists,
    "cleansheets": cleansheets,
  };
}