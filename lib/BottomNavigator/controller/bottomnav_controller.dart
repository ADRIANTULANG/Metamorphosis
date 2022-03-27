import 'package:get/get.dart';

class BottomNavController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxString selectedView = "home".obs;

  void changeView({required String view}) {
    selectedView.value = view;
  }
}
