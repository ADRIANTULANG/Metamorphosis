import 'package:get/get.dart';
import 'package:metamorphosis/Overallhealth/api/Overallhealth_api.dart';
import 'package:metamorphosis/Overallhealth/model/Overallhealth_model.dart';

class OverAllHealthController extends GetxController {
  @override
  void onInit() {
    get_over_all_health_of_Assestments();
    super.onInit();
  }

  RxList<HealthProgress> over_all_health_list = <HealthProgress>[].obs;

  RxString physical_care_overall_health = '0.0'.obs;
  RxString psychological_care_overall_health = '0.0'.obs;
  RxString spiritual_care_overall_health = '0.0'.obs;

  get_over_all_health_of_Assestments() async {
    var result = await OverAllHealthApi.get_overall_health_of_assestments();

    over_all_health_list.assignAll(result);
    for (var i = 0; i < over_all_health_list.length; i++) {
      if (over_all_health_list[i].selfCareType == "Physical Assestment") {
        physical_care_overall_health.value =
            over_all_health_list[i].overallHealth;
      } else if (over_all_health_list[i].selfCareType ==
          "Psychological Assestment") {
        psychological_care_overall_health.value =
            over_all_health_list[i].overallHealth;
      } else if (over_all_health_list[i].selfCareType ==
          "Spiritual Assestment") {
        spiritual_care_overall_health.value =
            over_all_health_list[i].overallHealth;
      }
    }
  }
}
