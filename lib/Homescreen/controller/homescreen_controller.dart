import 'dart:async';

import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    setClock();
    super.onInit();
  }

  RxString currentTime = "".obs;
  RxString currentDate = "".obs;
  RxString ampmIdentifier = "".obs;
  RxString morning_afternoon_evening = "".obs;

  Timer? clock;

  setClock() {
    clock = Timer.periodic(Duration(seconds: 1), (timer) {
      String minute = "";
      if (DateTime.now().minute.toString().length == 1) {
        minute = "0" + DateTime.now().minute.toString();
      } else {
        minute = DateTime.now().minute.toString();
      }
      if (DateTime.now().hour > 12) {
        currentTime.value =
            (DateTime.now().hour - 12).toString().obs + ":" + minute.toString();
        ampmIdentifier.value = "PM";
      } else {
        currentTime.value =
            DateTime.now().hour.toString().obs + ":" + minute.toString();
        ampmIdentifier.value = "PM";
      }
    });
    monthSetter(date: DateTime.now());
    morningAfternoonEvening(hour: DateTime.now().hour);
  }

  @override
  void onClose() {
    clock!.cancel();
    super.onClose();
  }

  morningAfternoonEvening({required int hour}) {
    if (hour < 12) {
      morning_afternoon_evening.value = "Good morning!";
    } else if (hour > 12 && hour < 18) {
      morning_afternoon_evening.value = "Good Afternoon!";
    } else {
      morning_afternoon_evening.value = "Good Evening!";
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
}
