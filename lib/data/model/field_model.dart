import 'dart:convert';

Field fieldFromJson(String str) => Field.fromJson(json.decode(str));

String fieldToJson(Field data) => json.encode(data.toJson());

class Field {
  Field({
    required this.images,
    required this.price,
    required this.ratings,
    required this.name,
    required this.timeClose,
    required this.detail,
    required this.place,
    required this.timeOpen,
    required this.open,
  });

  String images;
  int price;
  int ratings;
  String name;
  int timeClose;
  String detail;
  String place;
  int timeOpen;
  String open;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        images: json["images"],
        price: json["price"],
        ratings: json["ratings"],
        name: json["name"],
        timeClose: json["timeClose"],
        detail: json["detail"],
        place: json["place"],
        timeOpen: json["timeOpen"],
        open: json["open"],
      );

  Map<String, dynamic> toJson() => {
        "images": images,
        "price": price,
        "ratings": ratings,
        "name": name,
        "timeClose": timeClose,
        "detail": detail,
        "place": place,
        "timeOpen": timeOpen,
        "open": open,
      };
}
