import 'dart:convert';

List<StressLevel> stressLevelFromJson(String str) => List<StressLevel>.from(
    json.decode(str).map((x) => StressLevel.fromJson(x)));

String stressLevelToJson(List<StressLevel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StressLevel {
  StressLevel({
    required this.stressLvlId,
    required this.stressLevel,
    required this.stressPercent,
    required this.userid,
    required this.dateTaken,
  });

  String stressLvlId;
  String stressLevel;
  String stressPercent;
  String userid;
  DateTime dateTaken;

  factory StressLevel.fromJson(Map<String, dynamic> json) => StressLevel(
        stressLvlId: json["stress_lvl_id"],
        stressLevel: json["stress_level"],
        stressPercent: json["stress_percent"],
        userid: json["userid"],
        dateTaken: DateTime.parse(json["date_taken"]),
      );

  Map<String, dynamic> toJson() => {
        "stress_lvl_id": stressLvlId,
        "stress_level": stressLevel,
        "stress_percent": stressPercent,
        "userid": userid,
        "date_taken": dateTaken.toIso8601String(),
      };
}

List<WeeklyProgress> weeklyProgressFromJson(String str) =>
    List<WeeklyProgress>.from(
        json.decode(str).map((x) => WeeklyProgress.fromJson(x)));

String weeklyProgressToJson(List<WeeklyProgress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeeklyProgress {
  WeeklyProgress({
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

  factory WeeklyProgress.fromJson(Map<String, dynamic> json) => WeeklyProgress(
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
        "dateStarted": dateStarted.toIso8601String(),
      };
}
