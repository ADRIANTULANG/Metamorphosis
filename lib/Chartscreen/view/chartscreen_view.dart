import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';
import 'package:metamorphosis/Destress/view/destress_view.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                "Daily Progress",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(width: 6.w, child: Text("M")),
                                  Container(
                                    child: new LinearPercentIndicator(
                                      width: 35.w,
                                      animation: true,
                                      lineHeight: 1.5.h,
                                      animationDuration: 2500,
                                      percent: 0.8,
                                      backgroundColor: Colors.white,
                                      // center: Text("80.0%"),
                                      barRadius: Radius.circular(15),
                                      progressColor: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(width: 6.w, child: Text("T")),
                                  Container(
                                    child: new LinearPercentIndicator(
                                      width: 35.w,
                                      animation: true,
                                      lineHeight: 1.5.h,
                                      animationDuration: 2500,
                                      percent: 0.4,
                                      backgroundColor: Colors.white,
                                      // center: Text("70.0%"),
                                      barRadius: Radius.circular(15),
                                      progressColor: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(width: 6.w, child: Text("W")),
                                  Container(
                                    child: new LinearPercentIndicator(
                                      width: 35.w,
                                      animation: true,
                                      lineHeight: 1.5.h,
                                      animationDuration: 2500,
                                      percent: 0.95,
                                      backgroundColor: Colors.white,
                                      // center: Text("70.0%"),
                                      barRadius: Radius.circular(15),
                                      progressColor: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(width: 6.w, child: Text("TH")),
                                  Container(
                                    child: new LinearPercentIndicator(
                                      width: 35.w,
                                      animation: true,
                                      lineHeight: 1.5.h,
                                      animationDuration: 2500,
                                      backgroundColor: Colors.white,
                                      percent: 0.7,
                                      // center: Text("70.0%"),
                                      barRadius: Radius.circular(15),
                                      progressColor: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(width: 6.w, child: Text("F")),
                                  Container(
                                    child: new LinearPercentIndicator(
                                      width: 35.w,
                                      animation: true,
                                      lineHeight: 1.5.h,
                                      animationDuration: 2500,
                                      backgroundColor: Colors.white,
                                      percent: 0.9,
                                      // center: Text("90.0%"),
                                      barRadius: Radius.circular(15),
                                      progressColor: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Container(width: 6.w, child: Text("S")),
                                  Container(
                                    child: new LinearPercentIndicator(
                                      width: 35.w,
                                      animation: true,
                                      lineHeight: 1.5.h,
                                      animationDuration: 2500,
                                      backgroundColor: Colors.white,
                                      percent: 0.6,
                                      // center: Text("60.0%"),
                                      barRadius: Radius.circular(15),
                                      progressColor: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ],
                              ),
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
                                child: CircularPercentIndicator(
                                    radius: 14.w,
                                    lineWidth: 2.w,
                                    percent: 0.30,
                                    animation: true,
                                    animationDuration: 2500,
                                    center: new Text(
                                      "30%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    progressColor: Colors.deepPurpleAccent,
                                    circularStrokeCap: CircularStrokeCap.round),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              Text(
                                "Your Current",
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
                                  Get.to(() => DeStressView());
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
                                child: CircularPercentIndicator(
                                    radius: 10.w,
                                    lineWidth: 2.w,
                                    percent: 0.50,
                                    animation: true,
                                    animationDuration: 2500,
                                    center: new Text(
                                      "50%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    progressColor: Colors.deepPurpleAccent,
                                    circularStrokeCap: CircularStrokeCap.round),
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
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 4.h,
                                width: 25.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Predict",
                                  style: TextStyle(
                                      fontSize: 8.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
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
