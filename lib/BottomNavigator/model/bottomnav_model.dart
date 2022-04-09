import 'dart:convert';

import 'package:get/get.dart';

List<DataTemporaryModel> dataTemporaryModelFromJson(String str) =>
    List<DataTemporaryModel>.from(
        json.decode(str).map((x) => DataTemporaryModel.fromJson(x)));

String dataTemporaryModelToJson(List<DataTemporaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataTemporaryModel {
  DataTemporaryModel({
    required this.diagnosisId,
    required this.diagnosis,
    required this.userid,
    required this.score,
    required this.assestmentType,
    required this.planId,
    required this.plan,
    required this.isDone,
    required this.isTimer,
    required this.startDate,
    required this.endDate,
    required this.isScheduled,
    required this.isActive,
    required this.isActiveDiagnosis,
  });
  String isActiveDiagnosis;
  String isActive;
  String diagnosisId;
  String diagnosis;
  String userid;
  String score;
  String assestmentType;
  String planId;
  String plan;
  String isDone;
  String isTimer;
  DateTime startDate;
  DateTime endDate;
  String isScheduled;

  factory DataTemporaryModel.fromJson(Map<String, dynamic> json) =>
      DataTemporaryModel(
        isActiveDiagnosis: json["isActiveDiagnosis"],
        isActive: json["isActive"],
        diagnosisId: json["diagnosis_ID"],
        diagnosis: json["diagnosis"],
        userid: json["userid"],
        score: json["score"],
        assestmentType: json["assestment_type"],
        planId: json["plan_id"],
        plan: json["plan"],
        isDone: json["isDone"],
        isTimer: json["isTimer"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        isScheduled: json["isScheduled"],
      );

  Map<String, dynamic> toJson() => {
        "isActiveDiagnosis": isActiveDiagnosis,
        "isActive": isActive,
        "diagnosis_ID": diagnosisId,
        "diagnosis": diagnosis,
        "userid": userid,
        "score": score,
        "assestment_type": assestmentType,
        "plan_id": planId,
        "plan": plan,
        "isDone": isDone,
        "isTimer": isTimer,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "isScheduled": isScheduled,
      };
}

List<DiagnosisAndPlan> diagnosisAndPlanFromJson(String str) =>
    List<DiagnosisAndPlan>.from(
        json.decode(str).map((x) => DiagnosisAndPlan.fromJson(x)));

String diagnosisAndPlanToJson(List<DiagnosisAndPlan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiagnosisAndPlan {
  DiagnosisAndPlan({
    required this.diagnosisId,
    required this.score,
    required this.diagnosis,
    required this.assestmentType,
    required this.personalizedPlan,
    required this.isActiveDiagnosis,
  });

  String diagnosisId;
  String score;
  String diagnosis;
  String assestmentType;
  RxBool isActiveDiagnosis;
  List<PersonalizedPlan> personalizedPlan;

  factory DiagnosisAndPlan.fromJson(Map<String, dynamic> json) =>
      DiagnosisAndPlan(
        isActiveDiagnosis: json["isActiveDiagnosis"].toString().trim() == "true"
            ? true.obs
            : false.obs,
        diagnosisId: json["diagnosisId"],
        score: json["score"],
        diagnosis: json["diagnosis"],
        assestmentType: json["assestment_type"],
        personalizedPlan: List<PersonalizedPlan>.from(
            json["Personalized_Plan"].map((x) => PersonalizedPlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isActiveDiagnosis": isActiveDiagnosis,
        "diagnosisId": diagnosisId,
        "score": score,
        "diagnosis": diagnosis,
        "assestment_type": assestmentType,
        "Personalized_Plan":
            List<dynamic>.from(personalizedPlan.map((x) => x.toJson())),
      };
}

class PersonalizedPlan {
  PersonalizedPlan({
    required this.planId,
    required this.plan,
    required this.diagnosisId,
    required this.diagnosis,
    required this.isDone,
    required this.isTimer,
    required this.isScheduled,
    required this.startDate,
    required this.endDate,
    required this.userid,
    required this.isActive,
  });

  String planId;
  String plan;
  String diagnosisId;
  String diagnosis;
  RxBool isDone;
  bool isTimer;
  bool isScheduled;
  DateTime startDate;
  DateTime endDate;
  String userid;
  RxBool isActive;

  factory PersonalizedPlan.fromJson(Map<String, dynamic> json) =>
      PersonalizedPlan(
        planId: json["plan_id"],
        plan: json["plan"],
        diagnosisId: json["diagnosisId"],
        diagnosis: json["diagnosis"],
        isActive:
            json["isActive"].toString().trim() == "true" ? true.obs : false.obs,
        isDone: json["isDone"].toString() == "true" ? true.obs : false.obs,
        isTimer: json["isTimer"].toString() == "true" ? true : false,
        isScheduled: json["isScheduled"] == "true" ? true : false,
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "plan_id": planId,
        "plan": plan,
        "diagnosisId": diagnosisId,
        "diagnosis": diagnosis,
        "isDone": isDone,
        "isTimer": isTimer,
        "isScheduled": isScheduled,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "userid": userid,
      };
}

List<OverAllHealthProgress> overAllHealthProgressFromJson(String str) =>
    List<OverAllHealthProgress>.from(
        json.decode(str).map((x) => OverAllHealthProgress.fromJson(x)));

String overAllHealthProgressToJson(List<OverAllHealthProgress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OverAllHealthProgress {
  OverAllHealthProgress({
    required this.selfCareId,
    required this.selfCareType,
    required this.overallHealth,
    required this.userid,
  });

  String selfCareId;
  String selfCareType;
  String overallHealth;
  String userid;

  factory OverAllHealthProgress.fromJson(Map<String, dynamic> json) =>
      OverAllHealthProgress(
        selfCareId: json["self_care_ID"],
        selfCareType: json["self_care_type"],
        overallHealth: json["overall_health"],
        userid: json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "self_care_ID": selfCareId,
        "self_care_type": selfCareType,
        "overall_health": overallHealth,
        "userid": userid,
      };
}

List<DailyProgress> dailyProgressFromJson(String str) =>
    List<DailyProgress>.from(
        json.decode(str).map((x) => DailyProgress.fromJson(x)));

String dailyProgressToJson(List<DailyProgress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DailyProgress {
  DailyProgress({
    required this.dailyProgressId,
    required this.progressDaily,
    required this.fullProgress,
    required this.userid,
    required this.dateTaken,
  });

  String dailyProgressId;
  String progressDaily;
  String fullProgress;
  String userid;
  DateTime dateTaken;

  factory DailyProgress.fromJson(Map<String, dynamic> json) => DailyProgress(
        dailyProgressId: json["daily_progress_id"],
        progressDaily: json["progress_daily"],
        fullProgress: json["full_progress"],
        userid: json["userid"],
        dateTaken: DateTime.parse(json["date_taken"].toString().trim()),
      );

  Map<String, dynamic> toJson() => {
        "daily_progress_id": dailyProgressId,
        "progress_daily": progressDaily,
        "full_progress": fullProgress,
        "userid": userid,
        "date_taken": dateTaken,
      };
}
