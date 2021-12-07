import 'dart:convert';

Futsal futsalFromJson(String str) => Futsal.fromJson(json.decode(str));

String futsalToJson(Futsal data) => json.encode(data.toJson());

class Futsal {
  Futsal({
    required this.futsal,
  });

  List<FutsalElement> futsal;

  factory Futsal.fromJson(Map<String, dynamic> json) => Futsal(
        futsal: List<FutsalElement>.from(
            json["futsal"].map((x) => FutsalElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "futsal": List<dynamic>.from(futsal.map((x) => x.toJson())),
      };
}

class FutsalElement {
  FutsalElement({
    required this.id,
    required this.name,
    required this.address,
    required this.ratings,
    required this.openTime,
    required this.openDay,
    required this.detail,
    required this.price,
    required this.pictureId,
    required this.opentime,
    required this.openday,
  });

  String id;
  String name;
  String address;
  double ratings;
  String openTime;
  String openDay;
  String detail;
  String price;
  String pictureId;
  String opentime;
  String openday;

  factory FutsalElement.fromJson(Map<String, dynamic> json) => FutsalElement(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        ratings: json["ratings"].toDouble(),
        openTime: json["openTime"],
        openDay: json["openDay"],
        detail: json["detail"],
        price: json["price"],
        pictureId: json["pictureId"],
        opentime: json["opentime"],
        openday: json["openday"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "ratings": ratings,
        "openTime": openTime,
        "openDay": openDay,
        "detail": detail,
        "price": price,
        "pictureId": pictureId,
        "opentime": opentime,
        "openday": openday,
      };
}
