import 'dart:convert';

TehranCash tehranCashFromJson(String str) => TehranCash.fromJson(json.decode(str));

String tehranCashToJson(TehranCash data) => json.encode(data.toJson());

class TehranCash {
  TehranCash({
    this.data,
  });

  Data? data;

  factory TehranCash.fromJson(Map<String, dynamic> json) => TehranCash(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.type,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? type;
  var amount;
  dynamic createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    type: json["type"],
    amount: json["amount"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "amount": amount,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}
