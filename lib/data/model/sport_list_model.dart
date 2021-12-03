// To parse this JSON data, do
//
//     final listSport = listSportFromJson(jsonString);

import 'dart:convert';

ListSport listSportFromJson(String str) => ListSport.fromJson(json.decode(str));

String listSportToJson(ListSport data) => json.encode(data.toJson());

class ListSport {
  ListSport({
    required this.sport,
  });

  List<Sport> sport;

  factory ListSport.fromJson(Map<String, dynamic> json) => ListSport(
        sport: List<Sport>.from(json["sport"].map((x) => Sport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sport": List<dynamic>.from(sport.map((x) => x.toJson())),
      };
}

class Sport {
  Sport({
    required this.id,
    required this.name,
    required this.pictureId,
  });

  int id;
  String name;
  String pictureId;

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
        id: json["id"],
        name: json["name"],
        pictureId: json["pictureId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pictureId": pictureId,
      };
}
