import 'dart:convert';

import 'package:get/get.dart';
import 'package:metamorphosis/BottomNavigator/api/bottomnav_api.dart';
import 'package:metamorphosis/BottomNavigator/model/bottomnav_model.dart';

class BottomNavController extends GetxController {
  @override
  void onInit() {
    getDiagnosis_and_plan();
    get_over_all_health_of_Assestments();
    get_daily_progress();
    super.onInit();
  }

  RxList<DailyProgress> dailyprogressList = <DailyProgress>[].obs;
  RxList<OverAllHealthProgress> over_all_health_list =
      <OverAllHealthProgress>[].obs;

  RxList<DiagnosisAndPlan> diagnosis_and_plan_list = <DiagnosisAndPlan>[].obs;

  RxList<DataTemporaryModel> tempData = <DataTemporaryModel>[].obs;
  RxList<DataTemporaryModel> tempDataMaster = <DataTemporaryModel>[].obs;
  RxString selectedView = "home".obs;

  RxString physical_care_overall_health = ''.obs;
  RxString psychological_care_overall_health = ''.obs;
  RxString spiritual_care_overall_health = ''.obs;

  RxString dailyProgress = "0".obs;
  RxString current_Daily_progress_value = "0".obs;

  void changeView({required String view}) {
    selectedView.value = view;
  }

  getDiagnosis_and_plan() async {
    var result = await BottomNavApi.get_diagnosisi_and_personalized_plan();

    tempDataMaster.assignAll(result);
    tempData.assignAll(result);

    final stores = tempData.map((e) => e.diagnosisId).toSet();
    tempData.retainWhere((x) => stores.remove(x.diagnosisId));

    List final_data_to_parse = [];

    for (var i = 0; i < tempData.length; i++) {
      Map diagnosis_element = {
        "diagnosisId": tempData[i].diagnosisId,
        "score": tempData[i].score,
        "diagnosis": tempData[i].diagnosis,
        "assestment_type": tempData[i].assestmentType,
        "Personalized_Plan": [],
        "isActiveDiagnosis": tempData[i].isActiveDiagnosis,
      };
      final_data_to_parse.add(diagnosis_element);
    }

    for (var i = 0; i < final_data_to_parse.length; i++) {
      for (var x = 0; x < tempDataMaster.length; x++) {
        if (final_data_to_parse[i]['diagnosisId'] ==
            tempDataMaster[x].diagnosisId) {
          Map plan_element = {
            "isActive": tempDataMaster[x].isActive,
            "plan_id": tempDataMaster[x].planId,
            "plan": tempDataMaster[x].plan,
            "diagnosisId": tempDataMaster[x].diagnosisId,
            "diagnosis": tempDataMaster[x].diagnosis,
            "isDone": tempDataMaster[x].isDone,
            "isTimer": tempDataMaster[x].isTimer,
            "isScheduled": tempDataMaster[x].isScheduled,
            "startDate": tempDataMaster[x].startDate.toString(),
            "endDate": tempDataMaster[x].endDate.toString(),
            "userid": tempDataMaster[x].userid,
          };
          final_data_to_parse[i]['Personalized_Plan'].add(plan_element);
        }
      }
    }

    diagnosis_and_plan_list.assignAll(
        await diagnosisAndPlanFromJson(jsonEncode(final_data_to_parse)));
  }

  get_over_all_health_of_Assestments() async {
    var result = await BottomNavApi.get_overall_health_of_assestments();

    over_all_health_list.assignAll(result);
    for (var i = 0; i < over_all_health_list.length; i++) {
      if (over_all_health_list[i].selfCareType == "Physical Assestment") {
        physical_care_overall_health.value =
            over_all_health_list[i].overallHealth;
      } else if (over_all_health_list[i].selfCareType ==
          "Psychological Assestment") {
        psychological_care_overall_health.value =
            over_all_health_list[i].overallHealth;
      } else if (over_all_health_list[i].selfCareType ==
          "Spiritual Assestment") {
        spiritual_care_overall_health.value =
            over_all_health_list[i].overallHealth;
      }
    }
  }

  get_daily_progress() async {
    var result = await BottomNavApi.get_daily_progress();
    dailyprogressList.assignAll(result);
    if (dailyprogressList.isEmpty) {
    } else {
      DateTime oldDate = dailyprogressList[0].dateTaken;

      var difference = DateTime.now().difference(oldDate);
      print(difference.inDays);
      if (difference.inDays >= 1) {
        await BottomNavApi.update_daily_progress();
      } else {
        var fullProgress = double.parse(dailyprogressList[0].fullProgress);
        var progressDaily = double.parse(dailyprogressList[0].progressDaily);
        current_Daily_progress_value.value = dailyprogressList[0].progressDaily;

        dailyProgress.value = ((progressDaily / fullProgress) * 100).toString();
        print(dailyProgress.value);
      }
    }
  }
}
