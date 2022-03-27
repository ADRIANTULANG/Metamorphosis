import 'dart:async';

import 'package:get/get.dart';
import 'package:metamorphosis/Login/view/login_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    timer_function();
    super.onInit();
  }

  Timer? timer;

  timer_function() {
    timer = Timer(Duration(seconds: 3), () {
      Get.to(() => LoginView());
    });
  }
}
