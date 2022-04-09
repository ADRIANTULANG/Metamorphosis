import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:metamorphosis/Overallhealth/model/Overallhealth_model.dart';
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class OverAllHealthApi {
  static Future<List<HealthProgress>>
      get_overall_health_of_assestments() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-overall-health.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      // print(response.body);
      if (response.statusCode == 200) {
        var status = jsonDecode(response.body)['success'];
        if (status == true) {
          var message = jsonDecode(response.body)['message'];
          if (message == "Success") {
            var data = jsonEncode(jsonDecode(response.body)['data']);

            return HealthProgressFromJson(data);
          } else {
            return Future.error(true);
          }
        } else {
          return Future.error(true);
        }
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('get_overall_health_of_assestments catch error $error');
      return Future.error(true);
    }
  }
}
