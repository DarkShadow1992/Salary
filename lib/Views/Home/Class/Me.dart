import 'dart:convert';

Me meFromJson(String str) => Me.fromJson(json.decode(str));

String meToJson(Me data) => json.encode(data.toJson());

class Me {
  Me({
    this.data,
  });

  MeData? data;

  factory Me.fromJson(Map<String, dynamic> json) => Me(
    data: json["data"] == null ? null : MeData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class MeData {
  MeData({
    this.name,
    this.alias,
    this.address,
    this.haveBusinessLicense,
    this.haveCheque,
    this.nationalIdentity,
    this.birthday,
    this.email,
    this.mobile,
    this.shopPhone,
    this.homePhone,
    this.claimedRole,
    this.role,
    this.otp,
    this.mobileVerifiedAt,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.identifierCode,
    this.returnedDays,
    this.needAuth,
    this.image,
    this.whatsappPhone,
    this.website,
    this.instagramId,
    this.telegramId,
    this.province,
    this.county,
    this.businessLicenseNumber,
    this.galleryName,
    this.follow,
    this.followCount,
    this.subsetDiscountUsed,
    this.subsetDiscountRemained,
    this.productStat,
    this.from,
    this.orderStat,
  });

  String? name;
  String? alias;
  String? address;
  bool? haveBusinessLicense;
  bool? haveCheque;
  String? nationalIdentity;
  DateTime? birthday;
  String? email;
  String? mobile;
  String? shopPhone;
  String? homePhone;
  dynamic claimedRole;
  String? role;
  String? otp;
  DateTime? mobileVerifiedAt;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? identifierCode;
  int? returnedDays;
  bool? needAuth;
  Image? image;
  String? whatsappPhone;
  String? website;
  String? instagramId;
  String? telegramId;
  dynamic province;
  dynamic county;
  dynamic businessLicenseNumber;
  dynamic galleryName;
  List<Follow>? follow;
  int? followCount;
  int? subsetDiscountUsed;
  int? subsetDiscountRemained;
  int? productStat;
  dynamic from;
  OrderStat? orderStat;

  factory MeData.fromJson(Map<String, dynamic> json) => MeData(
    name: json["name"],
    alias: json["alias"],
    address: json["address"],
    haveBusinessLicense: json["have_business_license"],
    haveCheque: json["have_cheque"],
    nationalIdentity: json["national_identity"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    email: json["email"],
    mobile: json["mobile"],
    shopPhone: json["shop_phone"],
    homePhone: json["home_phone"],
    claimedRole: json["claimed_role"],
    role: json["role"],
    otp: json["otp"],
    mobileVerifiedAt: json["mobile_verified_at"] == null ? null : DateTime.parse(json["mobile_verified_at"]),
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    id: json["id"],
    identifierCode: json["identifier_code"],
    returnedDays: json["returned_days"],
    needAuth: json["need_auth"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    whatsappPhone: json["whatsapp_phone"],
    website: json["website"],
    instagramId: json["instagram_id"],
    telegramId: json["telegram_id"],
    province: json["province"],
    county: json["county"],
    businessLicenseNumber: json["business_license_number"],
    galleryName: json["gallery_name"],
    follow: json["follow"] == null ? [] : List<Follow>.from(json["follow"]!.map((x) => Follow.fromJson(x))),
    followCount: json["follow_count"],
    subsetDiscountUsed: json["subset_discount_used"],
    subsetDiscountRemained: json["subset_discount_remained"],
    productStat: json["product_stat"],
    from: json["from"],
    orderStat: json["order_stat"] == null ? null : OrderStat.fromJson(json["order_stat"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "alias": alias,
    "address": address,
    "have_business_license": haveBusinessLicense,
    "have_cheque": haveCheque,
    "national_identity": nationalIdentity,
    "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "email": email,
    "mobile": mobile,
    "shop_phone": shopPhone,
    "home_phone": homePhone,
    "claimed_role": claimedRole,
    "role": role,
    "otp": otp,
    "mobile_verified_at": mobileVerifiedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "id": id,
    "identifier_code": identifierCode,
    "returned_days": returnedDays,
    "need_auth": needAuth,
    "image": image?.toJson(),
    "whatsapp_phone": whatsappPhone,
    "website": website,
    "instagram_id": instagramId,
    "telegram_id": telegramId,
    "province": province,
    "county": county,
    "business_license_number": businessLicenseNumber,
    "gallery_name": galleryName,
    "follow": follow == null ? [] : List<dynamic>.from(follow!.map((x) => x.toJson())),
    "follow_count": followCount,
    "subset_discount_used": subsetDiscountUsed,
    "subset_discount_remained": subsetDiscountRemained,
    "product_stat": productStat,
    "from": from,
    "order_stat": orderStat?.toJson(),
  };
}

class Follow {
  Follow({
    this.id,
    this.user,
    this.userToFollow,
    this.direct,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? user;
  String? userToFollow;
  bool? direct;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
    id: json["id"],
    user: json["user"],
    userToFollow: json["user_to_follow"],
    direct: json["direct"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "user_to_follow": userToFollow,
    "direct": direct,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Image {
  Image({
    this.data,
  });

  ImageData? data;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    data: json["data"] == null ? null : ImageData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class ImageData {
  ImageData({
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
  Details? details;
  String? md5Hash;

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
    id: json["id"],
    basePath: json["base_path"],
    name: json["name"],
    thumbnailName: json["thumbnail_name"],
    type: json["type"],
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
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

class Details {
  Details({
    this.extension,
    this.size,
  });

  String? extension;
  int? size;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    extension: json["extension"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "extension": extension,
    "size": size,
  };
}

class OrderStat {
  OrderStat({
    this.finalized,
    this.gatheringFromBankers,
    this.verified,
    this.sendingToShopkeepers,
    this.delivered,
    this.canceled,
    this.returnBack,
    this.productRequest,
  });

  int? finalized;
  int? gatheringFromBankers;
  int? verified;
  int? sendingToShopkeepers;
  int? delivered;
  int? canceled;
  int? returnBack;
  int? productRequest;

  factory OrderStat.fromJson(Map<String, dynamic> json) => OrderStat(
    finalized: json["Finalized"],
    gatheringFromBankers: json["Gathering_From_Bankers"],
    verified: json["Verified"],
    sendingToShopkeepers: json["Sending_To_Shopkeepers"],
    delivered: json["Delivered"],
    canceled: json["Canceled"],
    returnBack: json["return_back"],
    productRequest: json["product_request"],
  );

  Map<String, dynamic> toJson() => {
    "Finalized": finalized,
    "Gathering_From_Bankers": gatheringFromBankers,
    "Verified": verified,
    "Sending_To_Shopkeepers": sendingToShopkeepers,
    "Delivered": delivered,
    "Canceled": canceled,
    "return_back": returnBack,
    "product_request": productRequest,
  };
}