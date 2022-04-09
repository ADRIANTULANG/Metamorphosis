import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/endspoints.dart';
import 'package:metamorphosis/storage.dart';

class SplashScreenApi {
// FuFuture<List<ItemsModel>>
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
