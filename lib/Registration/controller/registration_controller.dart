import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:sizer/sizer.dart';

class RegistrationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

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
}
