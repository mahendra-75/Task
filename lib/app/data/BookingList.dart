// To parse this JSON data, do
//
//     final bookingList = bookingListFromJson(jsonString);

import 'dart:convert';

List<BookingList> bookingListFromJson(String str) => List<BookingList>.from(json.decode(str)["response"].map((x) => BookingList.fromJson(x)));

String bookingListToJson(List<BookingList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingList {
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  BookingList({
    this.title,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  factory BookingList.fromJson(Map<String, dynamic> json) => BookingList(
    title: json["title"],
    fromDate: json["from_date"],
    fromTime: json["from_time"],
    toDate: json["to_date"],
    toTime: json["to_time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "from_date": fromDate,
    "from_time": fromTime,
    "to_date": toDate,
    "to_time": toTime,
  };
}
