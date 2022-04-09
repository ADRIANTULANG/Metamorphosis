import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';
import 'package:metamorphosis/Homescreen/controller/homescreen_controller.dart';
import 'package:metamorphosis/storage.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 70.w,
                        child: Text(
                          "Hi ${Get.find<StorageService>().box.read('firstname')}!",
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
                height: 25.h,
                width: 90.w,
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            controller.currentDate.value,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.currentTime.value,
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.ampmIdentifier.value,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Obx(
                          () => Text(
                            controller.morning_afternoon_evening.value,
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          "User!",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Obx(
                            () => CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 9.0,
                              percent: (double.parse(
                                      Get.find<BottomNavController>()
                                          .dailyProgress
                                          .value) /
                                  100),
                              animation: true,
                              animationDuration: 2500,
                              center: Obx(
                                () => Text(
                                  double.parse(Get.find<BottomNavController>()
                                              .dailyProgress
                                              .value)
                                          .toStringAsFixed(0) +
                                      "%",
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              backgroundColor: Colors.grey,
                              progressColor: Colors.deepPurple,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Current Daily Progress",
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 37.h,
                width: 90.w,
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Task Overview",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 27.h,
                      width: 100.w,
                      // color: Colors.red,
                      child: Obx(
                        () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount:
                              controller.plans_for_task_over_view.length > 3
                                  ? 3
                                  : controller.plans_for_task_over_view.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 2.w, right: 2.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(25)),
                                height: 14.h,
                                width: 75.w,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 5.w),
                                      width: 100.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller
                                            .plans_for_task_over_view[index]
                                            .diagnosis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5.w, right: 5.w),
                                      width: 100.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller
                                            .plans_for_task_over_view[index]
                                            .plan,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          onTap: () {
                                            controller.go_to_task(
                                                task: controller
                                                    .plans_for_task_over_view[
                                                        index]
                                                    .diagnosis);
                                          },
                                          child: Container(
                                            height: 8.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.black)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "View Task",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
