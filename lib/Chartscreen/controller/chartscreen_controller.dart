import 'package:get/get.dart';
import 'package:metamorphosis/Chartscreen/api/chartscreen_api.dart';
import 'package:metamorphosis/Chartscreen/dialog/chartscreen_dialog.dart';
import 'package:metamorphosis/Chartscreen/model/chartscreen_model.dart';

class ChartScreenController extends GetxController {
  @override
  void onInit() {
    get_Weekly_progress();
    get_stress_level();
    getHours();
    getminutes();
    getSeconds();

    super.onInit();
  }

  RxString partialselectedHour = "00".obs;
  RxString partialselectedMinutes = "00".obs;
  RxString partialselectedSeconds = "00".obs;

  List minutes = [];
  List hours = [];
  List seconds = [];

  RxString perceived_stress = "Undefine".obs;
  RxDouble perceived_Stress_percent_Value = 0.0.obs;
  RxBool isAvailable_to_take = true.obs;
  RxList<StressLevel> stressLevel = <StressLevel>[].obs;
  RxList<WeeklyProgress> weeklyProgressList = <WeeklyProgress>[].obs;

  RxString remaining_time_to_Stress_management = "".obs;

  get_stress_level() async {
    var result = await ChartScreenApi.get_stress_level();
    stressLevel.assignAll(result);
    if (stressLevel.isEmpty) {
      perceived_stress.value = "Undefine";
      isAvailable_to_take.value = true;
      ChartScreenDialog.showDialog_Message_available_to_take_st();
    } else {
      perceived_stress.value = stressLevel[0].stressLevel;
      perceived_Stress_percent_Value.value =
          double.parse(stressLevel[0].stressPercent);
      var difference = DateTime.now().difference(stressLevel[0].dateTaken);
      // var difference = DateTime.parse("2022-04-02 00:20:00.655542")
      //     .difference(DateTime.parse("2022-04-01 00:25:00.655542"));

      var hours_Remaining = 24 - difference.inHours;

      if (hours_Remaining == 1) {
        remaining_time_to_Stress_management.value =
            (1440 - difference.inMinutes).toString() + " Minutes/s Remaining";
      } else {
        remaining_time_to_Stress_management.value =
            hours_Remaining.toString() + " Hour/s Remaining";
      }
      // }
      print(remaining_time_to_Stress_management.value);

      if (difference.inDays >= 1) {
        isAvailable_to_take.value = true;
        ChartScreenDialog.showDialog_Message_available_to_take_st();
      } else {
        isAvailable_to_take.value = false;
      }
    }
  }

  get_Weekly_progress() async {
    var result = await ChartScreenApi.get_Weekly_progress();
    weeklyProgressList.assignAll(result.reversed);
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
}
