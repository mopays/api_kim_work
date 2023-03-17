// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.data,
    });

    List<Datum> data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.price,
        required this.detail,
        required this.cal,
        required this.img,
    });

    String id;
    Name name;
    String price;
    dynamic detail;
    Cal cal;
    String img;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        price: json["price"],
        detail: json["detail"],
        cal: calValues.map[json["cal"]]!,
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "price": price,
        "detail": detail,
        "cal": calValues.reverse[cal],
        "img": img,
    };
}

enum Cal { THE_580_CAL, THE_590_CAL, EMPTY }

final calValues = EnumValues({
    "": Cal.EMPTY,
    "580 cal": Cal.THE_580_CAL,
    "590 cal": Cal.THE_590_CAL
});

enum Name { EMPTY, NAME, PURPLE }

final nameValues = EnumValues({
    "ข้าวผัดปลากระป๋อง": Name.EMPTY,
    "ข้าวคลุกกะปิ ": Name.NAME,
    "": Name.PURPLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
