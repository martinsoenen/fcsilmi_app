// To parse this JSON data, do
//
//     final infos = infosFromJson(jsonString);

import 'dart:convert';

Infos infosFromJson(String str) => Infos.fromJson(json.decode(str));

String infosToJson(Infos data) => json.encode(data.toJson());

class Infos {
  Infos({
    this.totalGames,
    this.wins,
    this.losses,
    this.ties,
    this.overallRankingPoints,
    this.seasons,
    this.bestDivision,
    this.titlesWon,
    this.leaguesWon,
    this.totalCupsWon,
    this.promotions,
    this.relegations,
    this.currentDivision,
    this.points,
    this.seasonWins,
    this.seasonLosses,
    this.seasonTies,
    this.recentResults,
    this.alltimeGoals,
    this.alltimeGoalsAgainst,
    this.sessions,
  });

  int totalGames;
  int wins;
  int losses;
  int ties;
  int overallRankingPoints;
  int seasons;
  int bestDivision;
  int titlesWon;
  int leaguesWon;
  int totalCupsWon;
  int promotions;
  int relegations;
  int currentDivision;
  int points;
  int seasonWins;
  int seasonLosses;
  int seasonTies;
  List<String> recentResults;
  int alltimeGoals;
  int alltimeGoalsAgainst;
  Map<String, Map<String, int>> sessions;

  factory Infos.fromJson(Map<String, dynamic> json) => Infos(
    totalGames: json["totalGames"],
    wins: int.parse(json["wins"]),
    losses: int.parse(json["losses"]),
    ties: int.parse(json["ties"]),
    overallRankingPoints: int.parse(json["overallRankingPoints"]),
    seasons: json["seasons"],
    bestDivision: json["bestDivision"],
    titlesWon: int.parse(json["titlesWon"]),
    leaguesWon: int.parse(json["leaguesWon"]),
    totalCupsWon: json["totalCupsWon"],
    promotions: int.parse(json["promotions"]),
    relegations: int.parse(json["relegations"]),
    currentDivision: json["currentDivision"],
    points: int.parse(json["points"]),
    seasonWins: int.parse(json["seasonWins"]),
    seasonLosses: int.parse(json["seasonLosses"]),
    seasonTies: int.parse(json["seasonTies"]),
    recentResults: List<String>.from(json["recentResults"].map((x) => x)),
    alltimeGoals: int.parse(json["alltimeGoals"]),
    alltimeGoalsAgainst: int.parse(json["alltimeGoalsAgainst"]),
    sessions: Map.from(json["sessions"]).map((k, v) => MapEntry<String, Map<String, int>>(k, Map.from(v).map((k, v) => MapEntry<String, int>(k, v)))),
  );

  Map<String, dynamic> toJson() => {
    "totalGames": totalGames,
    "wins": wins,
    "losses": losses,
    "ties": ties,
    "overallRankingPoints": overallRankingPoints,
    "seasons": seasons,
    "bestDivision": bestDivision,
    "titlesWon": titlesWon,
    "leaguesWon": leaguesWon,
    "totalCupsWon": totalCupsWon,
    "promotions": promotions,
    "relegations": relegations,
    "currentDivision": currentDivision,
    "points": points,
    "seasonWins": seasonWins,
    "seasonLosses": seasonLosses,
    "seasonTies": seasonTies,
    "recentResults": List<dynamic>.from(recentResults.map((x) => x)),
    "alltimeGoals": alltimeGoals,
    "alltimeGoalsAgainst": alltimeGoalsAgainst,
    "sessions": Map.from(sessions).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
  };
}