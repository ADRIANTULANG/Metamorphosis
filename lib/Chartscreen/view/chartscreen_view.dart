import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';
import 'package:metamorphosis/Chartscreen/dialog/chartscreen_dialog.dart';
import 'package:metamorphosis/Homescreen/controller/homescreen_controller.dart';
import 'package:metamorphosis/storage.dart';

import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ChartScreenView extends GetView<ChartScreenController> {
  const ChartScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70.w,
                        child: Text(
                          "Hi  ${Get.find<StorageService>().box.read('firstname')}!",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ]),
                        ),
                      ),
                      Text(
                        "Start your journey at metamorphosis",
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 18.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  )
                ],
              ),
              Container(
                height: 65.h,
                width: 90.w,
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Weekly Progress",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 20.h,
                                width: 42.w,
                                // color: Colors.red,
                                alignment: Alignment.topCenter,
                                child: Container(
                                  child: Obx(
                                    () => ListView.builder(
                                      padding: EdgeInsets.only(top: 2.h),
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.weeklyProgressList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Container(
                                                    width: 6.w,
                                                    child: Text(
                                                      "W" +
                                                          controller
                                                              .weeklyProgressList[
                                                                  index]
                                                              .week,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 9.sp),
                                                    ),
                                                  ),
                                                  Container(
                                                    child:
                                                        new LinearPercentIndicator(
                                                      width: 35.w,
                                                      animation: true,
                                                      lineHeight: 1.5.h,
                                                      animationDuration: 2500,
                                                      percent: double.parse(
                                                          controller
                                                              .weeklyProgressList[
                                                                  index]
                                                              .progressPercent),
                                                      backgroundColor:
                                                          Colors.grey,
                                                      center: Text(
                                                        (double.parse(controller
                                                                        .weeklyProgressList[
                                                                            index]
                                                                        .progressPercent) *
                                                                    100)
                                                                .toStringAsFixed(
                                                                    0) +
                                                            "%",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 7.5.sp),
                                                      ),
                                                      barRadius:
                                                          Radius.circular(15),
                                                      progressColor: Colors
                                                          .deepPurpleAccent,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 15.w,
                              ),
                              Container(
                                child: Obx(
                                  () => CircularPercentIndicator(
                                      radius: 14.w,
                                      lineWidth: 2.w,
                                      percent: (double.parse(
                                              Get.find<BottomNavController>()
                                                  .dailyProgress
                                                  .value) /
                                          100),
                                      animation: true,
                                      animationDuration: 2500,
                                      center: Obx(
                                        () => Text(
                                          double.parse(Get.find<
                                                          BottomNavController>()
                                                      .dailyProgress
                                                      .value)
                                                  .toStringAsFixed(0) +
                                              "%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      progressColor: Colors.deepPurpleAccent,
                                      circularStrokeCap:
                                          CircularStrokeCap.round),
                                ),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Text(
                                "Current Daily",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Progress",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 10.h,
                      width: 90.w,
                      padding: EdgeInsets.only(left: 2.w, right: 2.w),
                      decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Stress Level",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Obx(
                                () => Text(
                                  controller.perceived_stress.value,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(() => DeStressView());
                                  ChartScreenDialog.bottomSheetCallendar(
                                      plan: "De-Stress",
                                      controller: controller);
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 25.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "De-stress",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: Obx(
                              () => LinearPercentIndicator(
                                width: 50.w,
                                animation: true,
                                lineHeight: 7.0.h,
                                animationDuration: 2500,
                                percent: controller
                                    .perceived_Stress_percent_Value.value,
                                center: Text(
                                  (controller.perceived_Stress_percent_Value
                                                  .value *
                                              100)
                                          .toStringAsFixed(0)
                                          .toString() +
                                      "%",
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                barRadius: Radius.circular(10),
                                progressColor: Colors.pinkAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 22.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Obx(
                                  () => CircularPercentIndicator(
                                      radius: 10.w,
                                      lineWidth: 2.w,
                                      percent: Get.find<HomeScreenController>()
                                          .days_remaining_in_percent
                                          .value,
                                      animation: true,
                                      animationDuration: 2500,
                                      center: new Text(
                                        (Get.find<HomeScreenController>()
                                                        .days_remaining_in_percent
                                                        .value *
                                                    100)
                                                .toStringAsFixed(0) +
                                            "%",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      progressColor: Colors.deepPurpleAccent,
                                      circularStrokeCap:
                                          CircularStrokeCap.round),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Estimated Day/s",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "to finish",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              // Container(
                              //   height: 4.h,
                              //   width: 25.w,
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //       color: Colors.blueAccent,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: Text(
                              //     "Predict",
                              //     style: TextStyle(
                              //         fontSize: 8.sp,
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Container(
                          height: 22.h,
                          width: 39.w,
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 13.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    color: Colors.pink[100],
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Obx(
                                  () => Text(
                                    Get.find<HomeScreenController>()
                                        .days_remaining
                                        .value
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.sp,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "More Day/s",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "'til your next",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "journey starts",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
