import 'package:get/get.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';

class DeStressController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  double question1 = 0;
  double question2 = 0;
  double question3 = 0;
  double question4 = 0;
  double question5 = 0;
  double question6 = 0;
  double question7 = 0;
  double question8 = 0;
  double question9 = 0;
  double question10 = 0;

  de_stress() async {
    question4 = await reversed_Value(value: question4);
    question5 = await reversed_Value(value: question5);
    question7 = await reversed_Value(value: question7);
    question8 = await reversed_Value(value: question8);

    double pss = await question1 +
        question1 +
        question2 +
        question3 +
        question4 +
        question5 +
        question6 +
        question7 +
        question8 +
        question9 +
        question10;
    var perceivedStress = "";
    if (pss > 0 && pss <= 13) {
      perceivedStress = "Low";
    } else if (pss >= 14 && pss <= 26) {
      perceivedStress = "Moderate";
    } else if (pss >= 27) {
      perceivedStress = "High";
    }
    print("pss: $pss");
    print("stress level: $perceivedStress");
    Get.find<ChartScreenController>().perceived_stress.value = perceivedStress;
    Get.find<ChartScreenController>().perceived_Stress_percent_Value.value =
        double.parse((pss / 40).toStringAsFixed(2).toString());
    Get.back();
  }

  double reversed_Value({required double value}) {
    double finalValue = 0;
    if (value == 0) {
      finalValue = 4;
    } else if (value == 1) {
      finalValue = 3;
    } else if (value == 2) {
      finalValue = 2;
    } else if (value == 3) {
      finalValue = 1;
    } else if (value == 4) {
      finalValue = 0;
    }
    return finalValue;
  }
}
