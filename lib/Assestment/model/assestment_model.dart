// To parse this JSON data, do
//
//     final diagnosisModel = diagnosisModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

List<DiagnosisModel> diagnosisModelFromJson(String str) =>
    List<DiagnosisModel>.from(
        json.decode(str).map((x) => DiagnosisModel.fromJson(x)));

String diagnosisModelToJson(List<DiagnosisModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiagnosisModel {
  DiagnosisModel({
    required this.score,
    required this.diagnosis,
    required this.assestmentType,
    required this.personalizedPlan,
  });

  double score;
  String diagnosis;
  String assestmentType;
  List<PersonalizedPlan> personalizedPlan;

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) => DiagnosisModel(
        score: json["score"].toDouble(),
        diagnosis: json["diagnosis"],
        assestmentType: json["assestment_type"],
        personalizedPlan: List<PersonalizedPlan>.from(
            json["Personalized_Plan"].map((x) => PersonalizedPlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "diagnosis": diagnosis,
        "assestment_type": assestmentType,
        "Personalized_Plan":
            List<dynamic>.from(personalizedPlan.map((x) => x.toJson())),
      };
}

class PersonalizedPlan {
  PersonalizedPlan({
    required this.diagnosis,
    required this.plan,
    required this.isScheduled,
    required this.isDone,
    required this.isTimer,
    required this.startDate,
    required this.endDate,
  });
  String diagnosis;
  String plan;
  bool isScheduled;
  RxBool isDone;
  bool isTimer;
  DateTime startDate;
  DateTime endDate;

  factory PersonalizedPlan.fromJson(Map<String, dynamic> json) =>
      PersonalizedPlan(
        diagnosis: json["diagnosis"],
        plan: json["plan"],
        isScheduled: json["isScheduled"],
        isDone: json["isDone"] == true ? true.obs : false.obs,
        isTimer: json["isTimer"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "diagnosis": diagnosis,
        "plan": plan,
        "isScheduled": isScheduled,
        "isDone": isDone,
        "isTimer": isTimer,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
