import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class AssestmentApi {
// FuFuture<List<ItemsModel>>
  static Future insert_diagnosis(
      {required String diagnosis,
      required String score,
      required String assestment_type,
      required String isActiveDiagnosis}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/insert-diagnosis.php"),
        body: {
          "diagnosis": diagnosis,
          "score": score,
          "isActiveDiagnosis": isActiveDiagnosis,
          "assestment_type": assestment_type,
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
            var data = jsonDecode(response.body)['data'];
            var last_inserted_id = data[0]['id'];
            return last_inserted_id;
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
      print('insert_diagnosis catch error $error');
      return Future.error(true);
    }
  }

  static Future insert_personalized_plan(
      {required String diagnosis_ID,
      required String diagnosis,
      required String plan,
      required String isDone,
      required String isScheduled,
      required String isTimer,
      required String startDate,
      required String endDate,
      required String isActive}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/insert-personalized-plan.php"),
        body: {
          "diagnosis_ID": diagnosis_ID,
          "plan": plan,
          "diagnosis": diagnosis,
          "isDone": isDone,
          "isScheduled": isScheduled,
          "isTimer": isTimer,
          "startDate": startDate,
          "endDate": endDate,
          "userid": Get.find<StorageService>().box.read("userid").toString(),
          "isActive": isActive
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      print(response.body);
      if (response.statusCode == 200) {
        var status = jsonDecode(response.body)['success'];
        if (status == true) {
          var message = jsonDecode(response.body)['message'];
          if (message == "Success") {
            return "Sucess";
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
      print('insert_personalized_plan catch error $error');
      return Future.error(true);
    }
  }

  static Future insert_Weeky_progress({
    required String week,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/create-week.php"),
        body: {
          "week": week,
          "progress_percent": 0.toString(),
          "userid": Get.find<StorageService>().box.read("userid").toString(),
          "dateStarted": DateTime.now().toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      print(response.body);
      if (response.statusCode == 200) {
        var status = jsonDecode(response.body)['success'];
        if (status == true) {
          var message = jsonDecode(response.body)['message'];
          if (message == "Success") {
            return "Sucess";
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
      print('insert_Weeky_progress catch error $error');
      return Future.error(true);
    }
  }

  static Future get_week() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-current-week.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      print(response.body);
      if (response.statusCode == 200) {
        var status = jsonDecode(response.body)['success'];
        if (status == true) {
          var message = jsonDecode(response.body)['message'];
          if (message == "Success") {
            List data = jsonDecode(response.body)['data'];

            if (data.isEmpty) {
              return null;
            } else {
              var curren_week = data[0]['week'];
              return curren_week;
            }
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
      print('get_week catch error $error');
      return "Error";
    }
  }

  static Future delete_diagnosis_and_plan() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/delete-diagnosis-and-plans.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      print(response.body);
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
      print('delete_diagnosis_and_plan catch error $error');
      return "Error";
    }
  }

  static Future insert_over_all_health(
      {required String selfcaretype, required String over_all_health}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/insert-overall-health.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
          "self_care_type": selfcaretype,
          "overall_health": over_all_health,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

      print(response.body);
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
      print('insert_over_all_health catch error $error');
      return "Error";
    }
  }

  static Future insert_Daily_progress({required String full_progress}) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/insert-daily-progress.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
          "full_progress": full_progress,
          "date_taken": DateTime.now().toString(),
          "progress_daily": "0",
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

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
      print('insert_Daily_progress catch error $error');
      return "Error";
    }
  }

  static Future delete_Daily_progress() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/delete-daily-progress.php"),
        body: {
          "userid": Get.find<StorageService>().box.read("userid").toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });

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
      print('delete_Daily_progress catch error $error');
      return "Error";
    }
  }
}
