import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/BottomNavigator/view/bottomnav_view.dart';
import 'package:metamorphosis/Overallhealth/controller/Overallhealt_controller..dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class OverallHealthView extends GetView<OverAllHealthController> {
  const OverallHealthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OverAllHealthController());
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
                "Over All Health",
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
                "Start your over all health at metamorphosis",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 60.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                            child: Obx(
                              () => CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 9.0,
                                percent: double.parse(controller
                                        .physical_care_overall_health.value) /
                                    100,
                                animation: true,
                                animationDuration: 2500,
                                center: Obx(
                                  () => Text(
                                    "${double.parse(controller.physical_care_overall_health.value).toStringAsFixed(2)}%",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                progressColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
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
                    Container(
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
                            child: Obx(
                              () => CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 9.0,
                                percent: double.parse(controller
                                        .psychological_care_overall_health
                                        .value) /
                                    100,
                                animation: true,
                                animationDuration: 2500,
                                center: Obx(
                                  () => Text(
                                    "${double.parse(controller.psychological_care_overall_health.value).toStringAsFixed(2)}%",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                progressColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            child: Obx(
                              () => CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 9.0,
                                percent: double.parse(controller
                                        .spiritual_care_overall_health.value) /
                                    100,
                                animation: true,
                                animationDuration: 2500,
                                center: Obx(
                                  () => Text(
                                    "${double.parse(controller.spiritual_care_overall_health.value).toStringAsFixed(2)}%",
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                progressColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.round,
                              ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                Get.offAll(() => BottomNavScreenView());
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
                  "E X P L O R E",
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
    );
  }
}
