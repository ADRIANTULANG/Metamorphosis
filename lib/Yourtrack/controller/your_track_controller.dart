import 'package:get/get.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';

class YourtrackController extends GetxController {
  @override
  void onInit() {
    getHours();
    getminutes();
    getSeconds();
    super.onInit();
  }

  RxString physical_over_all_health =
      Get.find<BottomNavController>().physical_care_overall_health.value.obs;
  RxString psychological_over_all_health = Get.find<BottomNavController>()
      .psychological_care_overall_health
      .value
      .obs;
  RxString spiritual_over_all_health =
      Get.find<BottomNavController>().spiritual_care_overall_health.value.obs;

  RxString partialselectedHour = "00".obs;
  RxString partialselectedMinutes = "00".obs;
  RxString partialselectedSeconds = "00".obs;

  List minutes = [];
  List hours = [];
  List seconds = [];

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
