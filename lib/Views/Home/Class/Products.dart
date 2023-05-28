import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.odataCount,
    this.value,
  });

  int? odataCount;
  List<Value>? value;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    odataCount: json["odata.count"],
    value: json["value"] == null ? [] : List<Value>.from(json["value"]!.map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "odata.count": odataCount,
    "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    this.id,
    this.name,
    this.userId,
    this.categoryId,
    this.weight,
    this.details,
    this.wage,
    this.image,
    this.available,
    this.createdAt,
    this.updatedAt,
    this.returningFlag,
    this.approvedImageCount,
    this.comment,
    this.category,
  });

  String? id;
  String? name;
  String? userId;
  int? categoryId;
  double? weight;
  ValueDetails? details;
  var wage;
  List<ImageElement>? image;
  bool? available;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic returningFlag;
  int? approvedImageCount;
  List<Comment>? comment;
  Category? category;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    name: json["name"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    weight: json["weight"]?.toDouble(),
    details: json["details"] == null ? null : ValueDetails.fromJson(json["details"]),
    wage: json["wage"],
    image: json["image"] == null ? [] : List<ImageElement>.from(json["image"]!.map((x) => ImageElement.fromJson(x))),
    available: json["available"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    returningFlag: json["returning_flag"],
    approvedImageCount: json["approved_image_count"],
    comment: json["comment"] == null ? [] : List<Comment>.from(json["comment"]!.map((x) => Comment.fromJson(x))),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "user_id": userId,
    "category_id": categoryId,
    "weight": weight,
    "details": details?.toJson(),
    "wage": wage,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    "available": available,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "returning_flag": returningFlag,
    "approved_image_count": approvedImageCount,
    "comment": comment == null ? [] : List<dynamic>.from(comment!.map((x) => x.toJson())),
    "category": category?.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.description,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int? id;
  String? name;
  String? description;
  dynamic lang;
  DateTime? createdAt;
  DateTime? updatedAt;
  DataClass? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    lang: json["lang"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    image: json["image"] == null ? null : DataClass.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "lang": lang,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image?.toJson(),
  };
}

class DataClass {
  DataClass({
    this.id,
    this.basePath,
    this.name,
    this.thumbnailName,
    this.type,
    this.details,
    this.md5Hash,
  });

  String? id;
  String? basePath;
  String? name;
  String? thumbnailName;
  String? type;
  ImageDetails? details;
  String? md5Hash;

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
    id: json["id"],
    basePath: json["base_path"],
    name: json["name"],
    thumbnailName: json["thumbnail_name"]!,
    type: json["type"],
    details: json["details"] == null ? null : ImageDetails.fromJson(json["details"]),
    md5Hash: json["md5hash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "base_path": basePath,
    "name": name,
    "thumbnail_name": thumbnailName,
    "type": type,
    "details": details?.toJson(),
    "md5hash": md5Hash,
  };
}

class ImageDetails {
  ImageDetails({
    this.extension,
    this.size,
  });

  String? extension;
  int? size;

  factory ImageDetails.fromJson(Map<String, dynamic> json) => ImageDetails(
    extension: json["extension"]!,
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "extension": extension,
    "size": size,
  };
}

class Comment {
  Comment({
    this.id,
    this.data,
    this.productId,
    this.userId,
    this.approved,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? data;
  String? productId;
  String? userId;
  DateTime? approved;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    data: json["data"],
    productId: json["product_id"],
    userId: json["user_id"],
    approved: json["approved"] == null ? null : DateTime.parse(json["approved"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data,
    "product_id": productId,
    "user_id": userId,
    "approved": approved?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class ValueDetails {
  ValueDetails({
    this.des,
  });

  String? des;

  factory ValueDetails.fromJson(Map<String, dynamic> json) => ValueDetails(
    des: json["des"],
  );

  Map<String, dynamic> toJson() => {
    "des": des,
  };
}

class ImageElement {
  ImageElement({
    this.id,
    this.data,
    this.productId,
    this.approved,
    this.createdAt,
    this.updatedAt,
    this.state,
  });

  int? id;
  DataClass? data;
  String? productId;
  DateTime? approved;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? state;

  factory ImageElement.fromJson(Map<String, dynamic> json) => ImageElement(
    id: json["id"],
    data: json["data"] == null ? null : DataClass.fromJson(json["data"]),
    productId: json["product_id"],
    approved: json["approved"] == null ? null : DateTime.parse(json["approved"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    state: json["state"]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data?.toJson(),
    "product_id": productId,
    "approved": approved?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "state": state,
  };
}
