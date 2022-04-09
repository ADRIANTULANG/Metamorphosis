import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';

import 'package:metamorphosis/Destress/view/destress_view.dart';
import 'package:metamorphosis/Profilescreen/controller/profilescreen_controller.dart';
import 'package:metamorphosis/Yourtrack/view/your_track_view.dart';
import 'package:metamorphosis/storage.dart';
import 'package:sizer/sizer.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 12.h,
                width: 25.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
              Text(
                "Hi ${Get.find<StorageService>().box.read('firstname')}!",
                style:
                    TextStyle(fontSize: 25.sp, color: Colors.white, shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ]),
              ),
              Text(
                "Welcome to your journey of Metamorphosis",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 55.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 7.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent[700]),
                      alignment: Alignment.center,
                      child: Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => AssestmentView());
                        if (Get.find<ChartScreenController>()
                                .isAvailable_to_take
                                .value ==
                            true) {
                          Get.to(() => DeStressView());
                        } else {
                          Get.snackbar(
                            "Message",
                            "${Get.find<ChartScreenController>().remaining_time_to_Stress_management.value} for your next stress management",
                            colorText: Colors.white,
                            backgroundColor: Colors.purple,
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      },
                      child: Container(
                        height: 7.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                        alignment: Alignment.center,
                        child: Text(
                          "Stress Management",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => YourTrackView());
                      },
                      child: Container(
                        height: 7.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pinkAccent),
                        alignment: Alignment.center,
                        child: Text(
                          "Assesment",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 7.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pinkAccent),
                      alignment: Alignment.center,
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 7.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink),
                      alignment: Alignment.center,
                      child: Text(
                        "About",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 7.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      alignment: Alignment.center,
                      child: Text(
                        "Log-out",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
