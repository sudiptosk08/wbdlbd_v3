// To parse this JSON data, do
//
//     final rechargeHistoryModel = rechargeHistoryModelFromJson(jsonString);

import 'dart:convert';

RechargeHistoryModel rechargeHistoryModelFromJson(String str) =>
    RechargeHistoryModel.fromJson(json.decode(str));

String rechargeHistoryModelToJson(RechargeHistoryModel data) =>
    json.encode(data.toJson());

class RechargeHistoryModel {
  final List<RechargeHistoryData> data;
  final Links links;
  final Meta meta;
  final bool status;

  RechargeHistoryModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
  });

  factory RechargeHistoryModel.fromJson(Map<String, dynamic> json) =>
      RechargeHistoryModel(
        data: List<RechargeHistoryData>.from(
            json["data"].map((x) => RechargeHistoryData.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
        "status": status,
      };
}

class RechargeHistoryData {
  final int id;
  final int amount;
  final String image;
  final String createdAt;
  final String status;

  RechargeHistoryData({
    required this.id,
    required this.amount,
    required this.image,
    required this.createdAt,
    required this.status,
  });

  factory RechargeHistoryData.fromJson(Map<String, dynamic> json) =>
      RechargeHistoryData(
        id: json["id"],
        amount: json["amount"],
        image: json["image"],
        createdAt: json["created_at"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "image": image,
        "created_at": createdAt,
        "status": status,
      };
}

class Links {
  final String? first;
  final String? last;
  final String? prev;
  final String? next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  final dynamic currentPage;
  final dynamic from;
  final dynamic path;
  final dynamic perPage;
  final dynamic to;

  Meta({
    required this.currentPage,
    required this.from,
    required this.path,
    required this.perPage,
    required this.to,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "path": path,
        "per_page": perPage,
        "to": to,
      };
}
