import 'package:meta/meta.dart';
import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    required this.odataCount,
    required this.value,
  });

  int odataCount;
  List<Values> value;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    odataCount: json["odata.count"],
    value: List<Values>.from(json["value"].map((x) => Values.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "odata.count": odataCount,
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
  };
}

class Values {
  Values({
    required this.id,
    required this.name,
    required this.description,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  int id;
  String name;
  String description;
  String lang;
  String createdAt;
  String updatedAt;
  imges image;

  factory Values.fromJson(Map<String, dynamic> json) => Values(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    lang: json["lang"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    image: imges.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "lang": lang,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "image": image.toJson(),
  };
}

class imges {
  imges({
    required this.id,
    required this.basePath,
    required this.name,
    required this.thumbnailName,
    required this.type,
    required this.details,
    required this.md5Hash,
  });

  String id;
  String basePath;
  String name;
  String thumbnailName;
  String type;
  Details details;
  String md5Hash;

  factory imges.fromJson(Map<String, dynamic> json) => imges(
    id: json["id"],
    basePath: json["base_path"],
    name: json["name"],
    thumbnailName: json["thumbnail_name"]!,
    type: json["type"],
    details: Details.fromJson(json["details"]),
    md5Hash: json["md5hash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "base_path": basePath,
    "name": name,
    "thumbnail_name": thumbnailName,
    "type": type,
    "details": details.toJson(),
    "md5hash": md5Hash,
  };
}

class Details {
  Details({
    required this.extension,
    required this.size,
  });

  String extension;
  int size;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    extension: json["extension"]!,
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "extension": extension,
    "size": size,
  };
}
