import 'package:get/get.dart';

class ChartScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  RxString perceived_stress = "Undefine".obs;
  RxDouble perceived_Stress_percent_Value = 0.0.obs;
}
