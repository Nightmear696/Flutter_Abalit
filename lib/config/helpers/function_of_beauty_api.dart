// To parse this JSON data, do
//
//     final functionOfBeautyApi = functionOfBeautyApiFromJson(jsonString);

import 'dart:convert';

FunctionOfBeautyApi functionOfBeautyApiFromJson(String str) => FunctionOfBeautyApi.fromJson(json.decode(str));

String functionOfBeautyApiToJson(FunctionOfBeautyApi data) => json.encode(data.toJson());

class FunctionOfBeautyApi {
    final int rc;
    final List<Datum> data;

    FunctionOfBeautyApi({
        required this.rc,
        required this.data,
    });

    factory FunctionOfBeautyApi.fromJson(Map<String, dynamic> json) => FunctionOfBeautyApi(
        rc: json["rc"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "rc": rc,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final List<String> images;
    final String title;
    final String description;
    final double price;
    final Category category;

    Datum({
        required this.id,
        required this.images,
        required this.title,
        required this.description,
        required this.price,
        required this.category,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        images: List<String>.from(json["images"].map((x) => x)),
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "title": title,
        "description": description,
        "price": price,
        "category": category.toJson(),
    };
}

class Category {
    final int id;
    final Name name;

    Category({
        required this.id,
        required this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
    };
}
enum Name {
    // ignore: constant_identifier_names
    BODYCARE,
    // ignore: constant_identifier_names
    HAIR_CARE,
    // ignore: constant_identifier_names
    SKINCARE
}

final nameValues = EnumValues({
    "Bodycare": Name.BODYCARE,
    "Hair care": Name.HAIR_CARE,
    "Skincare": Name.SKINCARE
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
