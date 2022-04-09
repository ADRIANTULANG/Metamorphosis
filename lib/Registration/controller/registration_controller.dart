import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Registration/api/registration_api.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:sizer/sizer.dart';

class RegistrationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController heigth = TextEditingController();
  TextEditingController weigth = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController career = TextEditingController();

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  RxString birthDatePick = "".obs;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    DateTime datepick = DateTime.parse(args.value.toString());

    birthDatePick.value = datepick.year.toString() +
        "-" +
        datepick.month.toString() +
        "-" +
        datepick.day.toString();
    Get.back();
  }

  showDatePicker() {
    Get.dialog(AlertDialog(
      content: Container(
        height: 40.h,
        width: 85.w,
        child: SfDateRangePicker(
          onSelectionChanged: _onSelectionChanged,
          selectionMode: DateRangePickerSelectionMode.single,
        ),
      ),
    ));
  }

  register_user({required BuildContext context}) async {
    var result = await RegistrationApi.create_user(
        username: username.text,
        password: password.text,
        email: email.text,
        phone: phone.text,
        firstname: firstname.text,
        lastname: lastname.text,
        birthday: birthDatePick.value,
        age: age.text,
        gender: gender.text,
        height: heigth.text,
        weight: weigth.text,
        address: address.text,
        career: career.text);
    print(result);
    if (result == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Success!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Sorry please try again.'),
      ));
    }
  }
}
