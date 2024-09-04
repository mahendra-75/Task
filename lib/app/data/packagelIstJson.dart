// To parse this JSON data, do
//
//     final packageLIst = packageLIstFromJson(jsonString);

import 'dart:convert';

List<PackageLIst> packageLIstFromJson(String str) => List<PackageLIst>.from(json.decode(str)["response"].map((x) => PackageLIst.fromJson(x)));

String packageLIstToJson(List<PackageLIst> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackageLIst {
  String? title;
  String? price;
  String? desc;

  PackageLIst({
    this.title,
    this.price,
    this.desc,
  });

  factory PackageLIst.fromJson(Map<String, dynamic> json) => PackageLIst(
    title: json["title"],
    price: json["price"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "desc": desc,
  };
}
