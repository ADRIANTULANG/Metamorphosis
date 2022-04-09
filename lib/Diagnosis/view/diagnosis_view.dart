import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:metamorphosis/Diagnosis/controller/diagnosis_controller.dart';
import 'package:metamorphosis/Diagnosis/widgets/diagnosis_view_with_filter.dart';
import 'package:metamorphosis/Diagnosis/widgets/diagnosis_view_with_no_filter.dart';

import 'package:sizer/sizer.dart';

class DiagnosisView extends GetView<DiagnosisController> {
  const DiagnosisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DiagnosisController());
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value == true
            ? Container(
                height: 100.h,
                width: 100.h,
                child: Center(
                  child: CircularProgressIndicator(),
                ))
            : Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Hi user!",
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                              ),
                            ]),
                      ),
                      Text(
                        "Your diagnosis at metamorphosis",
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 100.w,
                        padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info),
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              width: 70.w,
                              child: Text(
                                controller.assestment_type.value != ""
                                    ? "Please check the checkbox if the task is done in order to track your progress."
                                    : "Please select one diagnosis.",
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => controller.assestment_type.value != ""
                            ? WithFilter()
                            : WithNoFilter(),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: Obx(
        () => controller.assestment_type.value != ""
            ? SizedBox()
            : Container(
                height: 10.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.selected_diagnosis_ID.value == "") {
                          Get.snackbar(
                            "Message",
                            "Please select one diagnosis to focus",
                            colorText: Colors.white,
                            backgroundColor: Colors.purple,
                            snackPosition: SnackPosition.TOP,
                          );
                        } else {
                          controller.update_Selected_Diagnosis();
                        }
                      },
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: Colors.black),
                            color: Colors.white),
                        child: Text(
                          "D O N E",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
