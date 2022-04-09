import 'dart:convert';

List<HealthProgress> HealthProgressFromJson(String str) =>
    List<HealthProgress>.from(
        json.decode(str).map((x) => HealthProgress.fromJson(x)));

String HealthProgressToJson(List<HealthProgress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HealthProgress {
  HealthProgress({
    required this.selfCareId,
    required this.selfCareType,
    required this.overallHealth,
    required this.userid,
  });

  String selfCareId;
  String selfCareType;
  String overallHealth;
  String userid;

  factory HealthProgress.fromJson(Map<String, dynamic> json) => HealthProgress(
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
