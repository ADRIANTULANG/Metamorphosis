import 'dart:async';
import 'dart:convert';

// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:metamorphosis/endspoints.dart';

class RegistrationApi {
// FuFuture<List<ItemsModel>>
  static Future create_user({
    required String username,
    required String password,
    required String email,
    required String phone,
    required String firstname,
    required String lastname,
    required String birthday,
    required String age,
    required String gender,
    required String height,
    required String weight,
    required String address,
    required String career,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endpoints/create-user.php"),
        body: {
          "username": username,
          "password": password,
          "email": email,
          "phone": phone,
          "firstname": firstname,
          "lastname": lastname,
          "birthday": birthday,
          "age": age,
          "gender": gender,
          "height": height,
          "weight": weight,
          "address": address,
          "career": career,
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
            return "Error message";
          }
        } else {
          return "Error status";
        }
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('create_user catch error $error');
      return Future.error(true);
    }
  }
}
