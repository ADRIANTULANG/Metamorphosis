import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class DiagnosisApi {
// FuFuture<List<ItemsModel>>

  static Future update_weekly_progress(
      {required String week_id, required String new_progress_value}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/update_Weekly_Progress.php"),
        body: {
          "userid": Get.find<StorageService>().box.read('userid').toString(),
          "week_id": week_id,
          "new_progress_value": new_progress_value
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
          return "Error";
        }
      } else {
        return "Error";
      }
    } catch (error) {
      print('update_weekly_progress catch error $error');
      return "Error";
    }
  }

  static Future update_daily_progress(
      {required String new_progress_value}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/update_Add_Daily_progress.php"),
        body: {
          "userid": Get.find<StorageService>().box.read('userid').toString(),
          "new_progress_value": new_progress_value
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
          return "Error";
        }
      } else {
        return "Error";
      }
    } catch (error) {
      print('update_weekly_progress catch error $error');
      return "Error";
    }
  }

  static Future update_personalized_plan({required String plan_id}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/update_personalized_plan.php"),
        body: {
          "userid": Get.find<StorageService>().box.read('userid').toString(),
          "plan_id": plan_id,
          "isDone": true.toString()
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
          return "Error";
        }
      } else {
        return "Error";
      }
    } catch (error) {
      print('update_personalized_plan catch error $error');
      return "Error";
    }
  }

  static Future update_selected_Diagnosis_to_focus(
      {required String diagnosis_id}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/update_diagnosis_and_plan_to_focus.php"),
        body: {
          "userid": Get.find<StorageService>().box.read('userid').toString(),
          "diagnosis_id": diagnosis_id,
          "active": true.toString()
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
          return "Error";
        }
      } else {
        return "Error";
      }
    } catch (error) {
      print('update_selected_Diagnosis_to_focus catch error $error');
      return "Error";
    }
  }
}
