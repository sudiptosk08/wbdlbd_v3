// To parse this JSON data, do
//
//     final withdrawHistoryModel = withdrawHistoryModelFromJson(jsonString);

import 'dart:convert';

WithdrawHistoryModel withdrawHistoryModelFromJson(String str) =>
    WithdrawHistoryModel.fromJson(json.decode(str));

String withdrawHistoryModelToJson(WithdrawHistoryModel data) =>
    json.encode(data.toJson());

class WithdrawHistoryModel {
  final List<Datum> data;
  final Links links;
  final Meta meta;
  final bool status;

  WithdrawHistoryModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
  });

  factory WithdrawHistoryModel.fromJson(Map<String, dynamic> json) =>
      WithdrawHistoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  final int id;
  final int amount;
  final String status;
  final String createdAt;

  Datum({
    required this.id,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        amount: json["amount"],
        status: json["status"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "status": status,
        "created_at": createdAt,
      };
}

class Links {
  final String first;
  final dynamic last;
  final dynamic prev;
  final dynamic next;

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
