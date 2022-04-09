import 'dart:convert';

import 'package:get/get.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:metamorphosis/Assestment/api/assestment_api.dart';
import 'package:metamorphosis/BottomNavigator/api/bottomnav_api.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';
import 'package:metamorphosis/BottomNavigator/model/bottomnav_model.dart';

import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';
import 'package:metamorphosis/Diagnosis/api/diagnosis_api.dart';
import 'package:metamorphosis/Homescreen/controller/homescreen_controller.dart';
import 'package:metamorphosis/Overallhealth/view/Overallhealth_view.dart';

class DiagnosisController extends GetxController {
  @override
  void onInit() async {
    await getDiagnosis_and_plan();
    getHours();
    getSeconds();
    getminutes();
    if (Get.arguments['assestment_type'] == "none") {
    } else {
      assestment_type.value = Get.arguments['assestment_type'].toString();
    }
    print(Get.arguments['assestment_type']);
    print(assestment_type.value);
    super.onInit();
  }

  RxString selected_diagnosis_ID = "".obs;

  RxString assestment_type = "".obs;
  RxBool isLoading = true.obs;
  RxList<DiagnosisAndPlan> diagnosisList = <DiagnosisAndPlan>[].obs;

  RxList<DataTemporaryModel> tempData = <DataTemporaryModel>[].obs;
  RxList<DataTemporaryModel> tempDataMaster = <DataTemporaryModel>[].obs;

  RxString partialselectedHour = "00".obs;
  RxString partialselectedMinutes = "00".obs;
  RxString partialselectedSeconds = "00".obs;

  List minutes = [];
  List hours = [];
  List seconds = [];

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

    diagnosisList.assignAll(
        await diagnosisAndPlanFromJson(jsonEncode(final_data_to_parse)));
    isLoading(false);
  }

  open_calendar(
      {required DateTime startDate,
      required DateTime endDate,
      required String plan,
      required String diagnosis}) {
    final Event event = Event(
      recurrence: Recurrence(
        frequency: Frequency.daily,
        endDate: startDate.add(Duration(days: 7)),
        // ocurrences: 1,
      ),
      // allDay: true,
      title: "Diagnosis: " + diagnosis + " - (${plan})",
      description: plan,
      startDate: startDate,
      endDate: endDate,
      // iosParams: IOSParams(
      //   reminder: Duration(/* Ex. hours:1 */), // on iOS, you can set alarm notification after your event.
      // ),
      androidParams: AndroidParams(
        emailInvites: [], // on Android, you can add invite emails to your event.
      ),
    );
    Add2Calendar.addEvent2Cal(event);
  }

  getminutes() {
    int starting = 0;
    for (var i = 0; i < 60; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      minutes.add(text);
      starting++;
    }
  }

  getHours() {
    int starting = 0;
    for (var i = 0; i < 13; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      hours.add(text);
      starting++;
    }
  }

  getSeconds() {
    int starting = 0;
    for (var i = 0; i < 60; i++) {
      String text = "";
      if (starting.toString().length == 1) {
        text = "0" + starting.toString();
      } else {
        text = starting.toString();
      }
      seconds.add(text);
      starting++;
    }
  }

  check_task(
      {required bool isChecked,
      required int mainIndex,
      required int subIndex}) async {
    if (isChecked == true) {
    } else {
      var new_progress_to_update_Daily = int.parse(
              Get.find<BottomNavController>()
                  .current_Daily_progress_value
                  .value) +
          1;

      var week_id = Get.find<HomeScreenController>().week_id;
      diagnosisList[mainIndex].personalizedPlan[subIndex].isDone.value = true;
      print(new_progress_to_update_Daily); // eh update para sa daily progress;
      print(week_id);
      var totalprogress = 0;
      var full_progress = 0;
      for (var i = 0; i < diagnosisList.length; i++) {
        for (var x = 0; x < diagnosisList[i].personalizedPlan.length; x++) {
          if (diagnosisList[i].personalizedPlan[x].isActive.value == true) {
            full_progress = full_progress + 1;
            if (diagnosisList[i].personalizedPlan[x].isDone.value == true) {
              totalprogress = totalprogress + 1;
            }
          }
        }
      }
      var progress_percent_in_decimal =
          totalprogress / full_progress; // eh update para sa weekly;
      await DiagnosisApi.update_weekly_progress(
          week_id: week_id.toString(),
          new_progress_value: progress_percent_in_decimal.toString());
      await DiagnosisApi.update_daily_progress(
          new_progress_value: new_progress_to_update_Daily.toString());
      await DiagnosisApi.update_personalized_plan(
          plan_id: diagnosisList[mainIndex].personalizedPlan[subIndex].planId);
      await Get.find<ChartScreenController>().get_Weekly_progress();
      await Get.find<BottomNavController>().get_daily_progress();
      await Get.find<BottomNavController>().getDiagnosis_and_plan();
      Future.delayed(Duration(seconds: 2), () async {
        await Get.find<HomeScreenController>().get_three__not_taken_task();
      });
    }
  }

  select_diagnosis({required String diagnosis_id_selected}) {
    for (var i = 0; i < diagnosisList.length; i++) {
      if (diagnosisList[i].diagnosisId == diagnosis_id_selected) {
        selected_diagnosis_ID.value = diagnosisList[i].diagnosisId.toString();
        diagnosisList[i].isActiveDiagnosis.value = true;
        print(diagnosisList[i].diagnosisId);
        print(diagnosisList[i].diagnosis);
      } else {
        diagnosisList[i].isActiveDiagnosis.value = false;
      }
    }
  }

  update_Selected_Diagnosis() async {
    var result = await DiagnosisApi.update_selected_Diagnosis_to_focus(
        diagnosis_id: selected_diagnosis_ID.value);
    if (result == "Success") {
      // Get.offAll(() => BottomNavScreenView());
      insert_daily_progress();
      Get.offAll(() => OverallHealthView());
    } else {}
  }

  insert_daily_progress() async {
    int fullprogress = 0;
    for (var i = 0; i < diagnosisList.length; i++) {
      for (var x = 0; x < diagnosisList[i].personalizedPlan.length; x++) {
        if (diagnosisList[i].isActiveDiagnosis.value == true) {
          fullprogress = fullprogress + 1;
        }
      }
    }
    await AssestmentApi.insert_Daily_progress(
        full_progress: fullprogress.toString());
  }
}
