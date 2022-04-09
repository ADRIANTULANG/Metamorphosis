import 'dart:convert';

List<WeekProgressModel> weekProgressModelFromJson(String str) =>
    List<WeekProgressModel>.from(
        json.decode(str).map((x) => WeekProgressModel.fromJson(x)));

String weekProgressModelToJson(List<WeekProgressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeekProgressModel {
  WeekProgressModel({
    required this.progressId,
    required this.week,
    required this.progressPercent,
    required this.userid,
    required this.dateStarted,
  });

  String progressId;
  String week;
  String progressPercent;
  String userid;
  DateTime dateStarted;

  factory WeekProgressModel.fromJson(Map<String, dynamic> json) =>
      WeekProgressModel(
        progressId: json["progress_id"],
        week: json["week"],
        progressPercent: json["progress_percent"],
        userid: json["userid"],
        dateStarted: DateTime.parse(json["dateStarted"]),
      );

  Map<String, dynamic> toJson() => {
        "progress_id": progressId,
        "week": week,
        "progress_percent": progressPercent,
        "userid": userid,
        "dateStarted": dateStarted,
      };
}
