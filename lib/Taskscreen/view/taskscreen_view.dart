import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';
import 'package:metamorphosis/Diagnosis/view/diagnosis_view.dart';
import 'package:metamorphosis/Taskscreen/controller/taskscreen_controller.dart';
import 'package:metamorphosis/storage.dart';
import 'package:sizer/sizer.dart';

class TaskScreenView extends GetView<TaskScreenController> {
  const TaskScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
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
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 60.h,
                width: 90.w,
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: Get.find<BottomNavController>()
                        .diagnosis_and_plan_list
                        .length,
                    itemBuilder: (BuildContext context, int mainindex) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            width: 100.w,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 3.w),
                            child: Text(
                              Get.find<BottomNavController>()
                                  .diagnosis_and_plan_list[mainindex]
                                  .assestmentType,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: Get.find<BottomNavController>()
                                  .diagnosis_and_plan_list[mainindex]
                                  .personalizedPlan
                                  .length,
                              itemBuilder:
                                  (BuildContext context, int subindex) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => DiagnosisView(), arguments: {
                                      "assestment_type": Get.find<
                                              BottomNavController>()
                                          .diagnosis_and_plan_list[mainindex]
                                          .assestmentType,
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Container(
                                      height: 15.h,
                                      width: 80.w,
                                      padding: EdgeInsets.only(
                                          left: 3.w, right: 3.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: subindex.isOdd
                                              ? Colors.deepPurple
                                              : Colors.pinkAccent),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 10.h,
                                              width: 10.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Obx(() => Get.find<
                                                              BottomNavController>()
                                                          .diagnosis_and_plan_list[
                                                              mainindex]
                                                          .personalizedPlan[
                                                              subindex]
                                                          .isDone
                                                          .value ==
                                                      true
                                                  ? Icon(Icons.check)
                                                  : SizedBox())),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                Get.find<BottomNavController>()
                                                    .diagnosis_and_plan_list[
                                                        mainindex]
                                                    .personalizedPlan[subindex]
                                                    .plan,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11.sp,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
