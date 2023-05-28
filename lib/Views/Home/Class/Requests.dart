import 'dart:convert';

Requests requestsFromJson(String str) => Requests.fromJson(json.decode(str));

String requestsToJson(Requests data) => json.encode(data.toJson());

class Requests {
  Requests({
    this.odataCount,
    this.value,
  });

  int? odataCount;
  List<Value>? value;

  factory Requests.fromJson(Map<String, dynamic> json) => Requests(
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
    this.applicant,
    this.image,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.quantity,
    this.canceledAt,
    this.response,
    this.description,
  });

  int? id;
  String? applicant;
  List<DataElement>? image;
  List<Product>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? quantity;
  dynamic canceledAt;
  String? response;
  String? description;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    applicant: json["applicant"],
    image: json["image"] == null ? [] : List<DataElement>.from(json["image"]!.map((x) => DataElement.fromJson(x))),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    quantity: json["quantity"],
    canceledAt: json["canceled_at"],
    response: json["response"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "applicant": applicant,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "quantity": quantity,
    "canceled_at": canceledAt,
    "response": response,
    "description": description,
  };
}

class DataElement {
  DataElement({
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
  ThumbnailName? thumbnailName;
  String? type;
  Details? details;
  String? md5Hash;

  factory DataElement.fromJson(Map<String, dynamic> json) => DataElement(
    id: json["id"],
    basePath: json["base_path"],
    name: json["name"],
    thumbnailName: thumbnailNameValues.map[json["thumbnail_name"]]!,
    type: json["type"],
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
    md5Hash: json["md5hash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "base_path": basePath,
    "name": name,
    "thumbnail_name": thumbnailNameValues.reverse[thumbnailName],
    "type": type,
    "details": details?.toJson(),
    "md5hash": md5Hash,
  };
}

class Details {
  Details({
    this.extension,
    this.size,
  });

  Extension? extension;
  int? size;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    extension: extensionValues.map[json["extension"]]!,
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "extension": extensionValues.reverse[extension],
    "size": size,
  };
}

enum Extension { JPG, PNG }

final extensionValues = EnumValues({
  "jpg": Extension.JPG,
  "png": Extension.PNG
});

enum ThumbnailName { DEFAULT_PNG }

final thumbnailNameValues = EnumValues({
  "default.png": ThumbnailName.DEFAULT_PNG
});

class Product {
  Product({
    this.weight,
    this.wage,
    this.number,
    this.deliveryTime,
    this.price,
    this.createAt,
    this.bonak,
    this.ojrat,
    this.name,
    this.categoryId,
    this.image,
  });

  var weight;
  var wage;
  var number;
  var deliveryTime;
  var price;
  var createAt;
  var bonak;
  var ojrat;
  var name;
  var categoryId;
  List<ProductImage>? image;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    weight: json["weight"],
    wage: json["wage"],
    number: json["number"],
    deliveryTime: json["deliveryTime"],
    price: json["price"],
    createAt: json["create_at"] == null ? null : DateTime.parse(json["create_at"]),
    bonak: json["bonak"],
    ojrat: json["ojrat"],
    name: json["name"],
    categoryId: json["category_id"],
    image: json["image"] == null ? [] : List<ProductImage>.from(json["image"]!.map((x) => ProductImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "wage": wage,
    "number": number,
    "deliveryTime": deliveryTime,
    "price": price,
    "create_at": createAt?.toIso8601String(),
    "bonak": bonak,
    "ojrat": ojrat,
    "name": name,
    "category_id": categoryId,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
  };
}

class ProductImage {
  ProductImage({
    this.id,
    this.data,
  });

  int? id;
  DataElement? data;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    data: json["data"] == null ? null : DataElement.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data?.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
