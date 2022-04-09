import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/Login/model/login_model.dart';
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class LoginApi {
// FuFuture<List<ItemsModel>>
  static Future<List<LoginModel>> get_user({
    required String username,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/get-user.php"),
        body: {
          "username": username,
          "password": password,
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
            return loginModelFromJson(data);
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
      print('create_user catch error $error');
      return Future.error(true);
    }
  }

  static Future get_count() async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/check-if-already-take-assestment.php"),
        body: {
          "userid": Get.find<StorageService>().box.read('userid').toString(),
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
            var count = data[0]['count'];
            return count;
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
      print('create_user catch error $error');
      return "Error";
    }
  }
}
