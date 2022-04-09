import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/Chartscreen/model/chartscreen_model.dart';
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class ChartScreenApi {
// FuFuture< List<StressLevel>>
  static Future<List<StressLevel>> get_stress_level() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-stress-level.php"),
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
            return stressLevelFromJson(data);
          } else {
            return [];
          }
        } else {
          return Future.error(true);
        }
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('get_stress_level catch error $error');
      return Future.error(true);
    }
  }

// <List<WeeklyProgress>>  weeklyProgressFromJson
  static Future<List<WeeklyProgress>> get_Weekly_progress() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-weekly-progress.php"),
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

            return weeklyProgressFromJson(data);
          } else {
            return [];
          }
        } else {
          return Future.error(true);
        }
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('get_Weekly_progress catch error $error');
      return Future.error(true);
    }
  }
}
