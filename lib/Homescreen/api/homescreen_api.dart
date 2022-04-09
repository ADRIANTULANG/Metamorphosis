import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/Homescreen/model/homescreen_model.dart';
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class HomeScreenApi {
// FuFuture<List<WeekProgressModel>>
  static Future<List<WeekProgressModel>> get_week_progress() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-current-week.php"),
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
            return weekProgressModelFromJson(data);
          } else {
            return [];
          }
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (error) {
      print('get_week catch error $error');
      return [];
    }
  }
}
