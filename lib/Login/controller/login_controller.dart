import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Assestment/view/assestment_view.dart';
import 'package:metamorphosis/BottomNavigator/view/bottomnav_view.dart';
import 'package:metamorphosis/Homescreen/api/homescreen_api.dart';
import 'package:metamorphosis/Homescreen/model/homescreen_model.dart';
import 'package:metamorphosis/Login/api/login_api.dart';
import 'package:metamorphosis/Login/model/login_model.dart';
import 'package:metamorphosis/storage.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  RxList<LoginModel> user_data = <LoginModel>[].obs;
  RxList<WeekProgressModel> weekDetails = <WeekProgressModel>[].obs;

  login({required BuildContext context}) async {
    var result = await LoginApi.get_user(
        username: username.text, password: password.text);
    user_data.assignAll(result);
    if (user_data.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User did not exist!'),
      ));
    } else {
      Get.find<StorageService>().storeusers(
          userid: user_data[0].userid,
          username: user_data[0].username,
          password: user_data[0].password,
          email: user_data[0].email,
          phone: user_data[0].phone,
          firstname: user_data[0].firstname,
          lastname: user_data[0].lastname,
          birthday: user_data[0].birthday,
          age: user_data[0].age,
          gender: user_data[0].gender,
          height: user_data[0].height,
          weight: user_data[0].weight,
          address: user_data[0].address,
          career: user_data[0].career);
      get_assestment_if_exist();
    }
  }

  get_assestment_if_exist() async {
    var count = await LoginApi.get_count();
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
