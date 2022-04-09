import 'dart:async';

import 'package:get/get.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';
import 'package:metamorphosis/BottomNavigator/model/bottomnav_model.dart';
import 'package:metamorphosis/Diagnosis/view/diagnosis_view.dart';
import 'package:metamorphosis/Homescreen/api/homescreen_api.dart';
import 'package:metamorphosis/Homescreen/model/homescreen_model.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    setClock();
    get_week_progress();
    Future.delayed(Duration(seconds: 2), () {
      get_three__not_taken_task();
    });

    super.onInit();
  }

  RxString currentTime = "".obs;
  RxString currentDate = "".obs;
  RxString ampmIdentifier = "".obs;
  RxString morning_afternoon_evening = "".obs;

  RxString days_remaining = "".obs;
  RxDouble days_remaining_in_percent = 0.0.obs;

  Timer? clock;

  RxString current_Week_progress = "0".obs;
  RxString week_id = "0".obs;
  DateTime date_Started = new DateTime.now();

  RxList<WeekProgressModel> weekdetails = <WeekProgressModel>[].obs;

  setClock() {
    clock = Timer.periodic(Duration(seconds: 1), (timer) {
      String minute = "";
      if (DateTime.now().minute.toString().length == 1) {
        minute = "0" + DateTime.now().minute.toString();
      } else {
        minute = DateTime.now().minute.toString();
      }
      if (DateTime.now().hour > 11) {
        if ((DateTime.now().hour - 12) == 0) {
          currentTime.value =
              (DateTime.now().hour).toString() + ":" + minute.toString();
          ampmIdentifier.value = "PM";
        } else {
          currentTime.value =
              (DateTime.now().hour - 12).toString() + ":" + minute.toString();
          ampmIdentifier.value = "PM";
        }
      } else {
        currentTime.value =
            DateTime.now().hour.toString() + ":" + minute.toString();
        ampmIdentifier.value = "AM";
      }
    });
    monthSetter(date: DateTime.now());
    morningAfternoonEvening(hour: DateTime.now().hour);
  }

  RxList<PersonalizedPlan> plans_for_task_over_view = <PersonalizedPlan>[].obs;

  @override
  void onClose() {
    clock!.cancel();
    super.onClose();
  }

  get_week_progress() async {
    var result = await HomeScreenApi.get_week_progress();
    weekdetails.assignAll(result);
    if (weekdetails.isEmpty) {
      current_Week_progress.value = "0";
    } else {
      current_Week_progress.value = weekdetails[0].progressPercent;
      week_id.value = weekdetails[0].progressId;
      date_Started = weekdetails[0].dateStarted;

      var difference = DateTime.now().difference(date_Started);
      var daysremaining = 7 - difference.inDays;

      var dayspercent = difference.inDays / 7;
      print("days remaining: ${daysremaining}");
      print("days remaining in percent: ${dayspercent}");
      days_remaining.value = daysremaining.toString();
      days_remaining_in_percent.value = dayspercent;
    }
  }

  morningAfternoonEvening({required int hour}) {
    if (hour < 12) {
      morning_afternoon_evening.value = "Good morning!";
    } else if (hour >= 12 && hour < 18) {
      morning_afternoon_evening.value = "Good Afternoon!";
    } else if (hour >= 18) {
      morning_afternoon_evening.value = "Good Evening!";
    }
  }

  go_to_task({required String task}) {
    if (task == "Eating Disorder" ||
        task == "Inability to Seek Help" ||
        task == "Low Physical Activity" ||
        task == "Sleeping Disorder" ||
        task == "Inability to take time off") {
      Get.to(() => DiagnosisView(),
          arguments: {"assestment_type": "Physical Assestment"});
    } else if (task == "Inability to make time for oneself" ||
        task == "Unhealthy Work-Life Boundaries" ||
        task == "Lack of Emotional Fulfillment") {
      Get.to(() => DiagnosisView(),
          arguments: {"assestment_type": "Psychological Assestment"});
    } else if (task == "Need to unwind" || task == "In-need of Faith") {
      Get.to(() => DiagnosisView(),
          arguments: {"assestment_type": "Spiritual Assestment"});
    }
  }

  monthSetter({required DateTime date}) {
    if (date.month == 1) {
      currentDate.value =
          "January" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 2) {
      currentDate.value =
          "February" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 3) {
      currentDate.value =
          "March" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 4) {
      currentDate.value =
          "April" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 5) {
      currentDate.value =
          "May" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 6) {
      currentDate.value =
          "June" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 7) {
      currentDate.value =
          "July" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 8) {
      currentDate.value =
          "August" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 9) {
      currentDate.value =
          "September" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 10) {
      currentDate.value =
          "October" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 11) {
      currentDate.value =
          "November" + " " + date.day.toString() + ", " + date.year.toString();
    } else if (date.month == 12) {
      currentDate.value =
          "December" + " " + date.day.toString() + ", " + date.year.toString();
    }
  }

  get_three__not_taken_task() {
    plans_for_task_over_view.clear();
    for (var i = 0;
        i < Get.find<BottomNavController>().diagnosis_and_plan_list.length;
        i++) {
      for (var x = 0;
          x <
              Get.find<BottomNavController>()
                  .diagnosis_and_plan_list[i]
                  .personalizedPlan
                  .length;
          x++) {
        if (Get.find<BottomNavController>()
                .diagnosis_and_plan_list[i]
                .personalizedPlan[x]
                .isDone
                .value ==
            false) {
          if (Get.find<BottomNavController>()
                  .diagnosis_and_plan_list[i]
                  .personalizedPlan[x]
                  .isActive
                  .value ==
              true) {
            plans_for_task_over_view.add(Get.find<BottomNavController>()
                .diagnosis_and_plan_list[i]
                .personalizedPlan[x]);
          }
        }
      }
    }
    print("length " + plans_for_task_over_view.length.toString());
  }
}
