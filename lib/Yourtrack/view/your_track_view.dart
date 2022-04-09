import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';
import 'package:metamorphosis/Diagnosis/view/diagnosis_view.dart';
import 'package:metamorphosis/Yourtrack/controller/your_track_controller.dart';
import 'package:metamorphosis/Yourtrack/dialog/yourtrack_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class YourTrackView extends GetView<YourtrackController> {
  const YourTrackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(YourtrackController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Your Tracks!",
                style:
                    TextStyle(fontSize: 30.sp, color: Colors.white, shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ]),
              ),
              Text(
                "Start your journey at metamorphosis",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 75.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => DiagnosisView(), arguments: {
                          "assestment_type": "Physical Assestment"
                        });
                      },
                      child: Container(
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 9.0,
                                percent: double.parse(controller
                                        .physical_over_all_health.value) /
                                    100,
                                animation: true,
                                animationDuration: 2500,
                                center: Text(
                                  "${double.parse(controller.physical_over_all_health.value).toStringAsFixed(2)}%",
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                progressColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Physical Self-Care",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => DiagnosisView(), arguments: {
                          "assestment_type": "Psychological Assestment"
                        });
                      },
                      child: Container(
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Psychological \n Self-Care",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 9.0,
                                percent: double.parse(controller
                                        .psychological_over_all_health.value) /
                                    100,
                                animation: true,
                                animationDuration: 2500,
                                center: Text(
                                  "${double.parse(controller.psychological_over_all_health.value).toStringAsFixed(2)}%",
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                progressColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => DiagnosisView(), arguments: {
                          "assestment_type": "Spiritual Assestment"
                        });
                      },
                      child: Container(
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purpleAccent),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 4.w,
                            ),
                            Container(
                              child: CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 9.0,
                                percent: double.parse(controller
                                        .spiritual_over_all_health.value) /
                                    100,
                                animation: true,
                                animationDuration: 2500,
                                center: Text(
                                  "${double.parse(controller.spiritual_over_all_health.value).toStringAsFixed(2)}%",
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                progressColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Spiritual Self-Care",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 17.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purpleAccent[100]),
                      child: Row(
                        children: [
                          Container(
                            width: 35.w,
                            // color: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Stress Level",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                      color: Colors.white),
                                ),
                                Obx(
                                  () => Text(
                                    Get.find<ChartScreenController>()
                                        .perceived_stress
                                        .value,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: Colors.red),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    YourTrackDialog.bottomSheetCallendar(
                                        plan: "De-Stress",
                                        controller: controller);
                                  },
                                  child: Container(
                                    height: 6.h,
                                    width: 23.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "De-Stress",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10.sp,
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: LinearPercentIndicator(
                              width: 45.w,
                              animation: true,
                              lineHeight: 7.0.h,
                              animationDuration: 2500,
                              percent: Get.find<ChartScreenController>()
                                  .perceived_Stress_percent_Value
                                  .value,
                              center: Text(
                                ((Get.find<ChartScreenController>()
                                                .perceived_Stress_percent_Value
                                                .value) *
                                            100)
                                        .toStringAsFixed(0) +
                                    "%",
                                style: TextStyle(
                                    fontSize: 8.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              barRadius: Radius.circular(10),
                              progressColor: Colors.pinkAccent,
                            ),
                          ))
                        ],
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
