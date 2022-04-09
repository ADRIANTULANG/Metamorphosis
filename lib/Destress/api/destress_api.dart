import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class DeStressApi {
// FuFuture<List<ItemsModel>>
  static Future insert_stress_level({
    required String stress_level,
    required String stress_percent,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/insert-stress-level.php"),
        body: {
          "stress_level": stress_level,
          "stress_percent": stress_percent,
          "date_taken": DateTime.now().toString(),
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
            return "Success";
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
      print('insert_stress_level catch error $error');
      return Future.error(true);
    }
  }

  static Future delete_stress_level() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/delete-stress-level.php"),
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
            return "Success";
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
      print('delete_stress_level catch error $error');
      return Future.error(true);
    }
  }
}
