import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';

import 'package:metamorphosis/Timer/view/timer_view.dart';
import 'package:metamorphosis/storage.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChartScreenDialog {
  static bottomSheetCallendar(
      {required String plan, required ChartScreenController controller}) {
    return Get.bottomSheet(Container(
      height: 40.h,
      width: 100.w,
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 100.w,
            alignment: Alignment.center,
            child: Text(
              "Set timer for " + plan + " task",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 10.h,
                    width: 15.w,
                    // color: Colors.blue,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 10.h,
                          scrollDirection: Axis.vertical),
                      items: controller.hours.map((hour) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.partialselectedHour.value =
                                      hour.toString();
                                },
                                child: Container(
                                    height: 10.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                        color: controller.partialselectedHour
                                                    .value ==
                                                hour
                                            ? Colors.purple
                                            : Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$hour',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 15.w,
                    child: Text(
                      "Hour",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 8.h,
                alignment: Alignment.center,
                child: Text(
                  " : ",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 10.h,
                    width: 15.w,
                    // color: Colors.blue,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 10.h,
                          scrollDirection: Axis.vertical),
                      items: controller.minutes.map((minute) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.partialselectedMinutes.value =
                                      minute.toString();
                                },
                                child: Container(
                                    height: 10.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                        color: controller.partialselectedMinutes
                                                    .value ==
                                                minute
                                            ? Colors.purple
                                            : Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$minute',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 15.w,
                    child: Text(
                      "Min",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 8.h,
                alignment: Alignment.center,
                child: Text(
                  " : ",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 10.h,
                    width: 15.w,
                    // color: Colors.blue,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 10.h,
                          scrollDirection: Axis.vertical),
                      items: controller.seconds.map((seconds) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.partialselectedSeconds.value =
                                      seconds.toString();
                                },
                                child: Container(
                                    height: 10.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                        color: controller.partialselectedSeconds
                                                    .value ==
                                                seconds
                                            ? Colors.purple
                                            : Colors.grey),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$seconds',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: 15.w,
                    child: Text(
                      "Sec",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          InkWell(
            onTap: () {
              Get.to(() => StopWatchTimerPage(
                  hour: int.parse(controller.partialselectedHour.value),
                  sec: int.parse(controller.partialselectedSeconds.value),
                  min: int.parse(controller.partialselectedMinutes.value)));
            },
            child: Container(
              width: 80.w,
              height: 6.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.purple,
                  border: Border.all(color: Colors.black)),
              child: Text(
                "SET",
                style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }

  static showDialog_Message_available_to_take_st() {
    Get.dialog(AlertDialog(
      title: Container(
        width: 80.w,
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(Icons.info),
            SizedBox(
              width: 1.w,
            ),
            Text(
              "Reminder",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent),
            ),
          ],
        ),
      ),
      content: Container(
        height: 7.h,
        width: 80.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Container(
          width: 80.w,
          alignment: Alignment.center,
          child: Text(
            "Hi  ${Get.find<StorageService>().box.read('firstname')}, Stress Management is ready to take. You can take the test right now.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ));
  }
}
