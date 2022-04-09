import 'dart:async';

import 'package:get/get.dart';
import 'package:metamorphosis/Assestment/view/assestment_view.dart';
import 'package:metamorphosis/BottomNavigator/view/bottomnav_view.dart';
import 'package:metamorphosis/Homescreen/api/homescreen_api.dart';
import 'package:metamorphosis/Homescreen/model/homescreen_model.dart';
import 'package:metamorphosis/Login/view/login_view.dart';
import 'package:metamorphosis/Splashscreen/api/splashscreen_api.dart';
import 'package:metamorphosis/storage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    timer_function();
    super.onInit();
  }

  RxList<WeekProgressModel> weekDetails = <WeekProgressModel>[].obs;
  Timer? timer;

  timer_function() {
    timer = Timer(Duration(seconds: 3), () {
      if (Get.find<StorageService>().box.read('userid') == null) {
        Get.offAll(() => LoginView());
      } else {
        get_assestment_if_exist();
      }
    });
  }

  get_assestment_if_exist() async {
    var count = await SplashScreenApi.get_count();
    if (count == "Error") {
    } else {
      if (int.parse(count.toString()) > 0) {
        get_week_progress();
      } else {
        Get.offAll(() => AssestmentView());
      }
    }
  }

  get_week_progress() async {
    var result = await HomeScreenApi.get_week_progress();
    weekDetails.assignAll(result);
    Duration difference = DateTime.now().difference(weekDetails[0].dateStarted);
    if (difference.inDays >= 7) {
      print(difference.inDays);
      print("already past 7 days");
      Get.offAll(() => AssestmentView());
    } else {
      print(difference.inDays);
      print("continue to complete the task");
      Get.offAll(() => BottomNavScreenView());
    }
  }
}
