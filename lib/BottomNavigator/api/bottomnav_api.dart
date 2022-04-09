import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/BottomNavigator/model/bottomnav_model.dart';
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class BottomNavApi {
// Future<List<DataTemporaryModel>>
  static Future<List<DataTemporaryModel>>
      get_diagnosisi_and_personalized_plan() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-diagnosis.php"),
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
            return dataTemporaryModelFromJson(data);
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
      print('get_diagnosisi_and_personalized_plan catch error $error');
      return Future.error(true);
    }
  }

// <List<OverAllHealthProgress>>
  static Future<List<OverAllHealthProgress>>
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

            return overAllHealthProgressFromJson(data);
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

//  List<DailyProgress>   List<DailyProgress> dailyProgressFromJson
  static Future<List<DailyProgress>> get_daily_progress() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-daily-progress.php"),
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
            return dailyProgressFromJson(data);
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
      print('get_daily_progress catch error $error');
      return Future.error(true);
    }
  }

  static Future update_daily_progress() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/update-daily-progress.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
          "date_taken": DateTime.now().toString().trim().toString()
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
            return "Success";
          } else {
            return "Error";
          }
        } else {
          return Future.error(true);
        }
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('update_daily_progress catch error $error');
      return Future.error(true);
    }
  }
}
