import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/BottomNavigator/controller/bottomnav_controller.dart';
import 'package:metamorphosis/Chartscreen/controller/chartscreen_controller.dart';
import 'package:metamorphosis/Chartscreen/view/chartscreen_view.dart';
import 'package:metamorphosis/Homescreen/controller/homescreen_controller.dart';
import 'package:metamorphosis/Homescreen/view/homescreen_view.dart';
import 'package:metamorphosis/Profilescreen/controller/profilescreen_controller.dart';
import 'package:metamorphosis/Profilescreen/view/profilescreen_view.dart';
import 'package:metamorphosis/Taskscreen/controller/taskscreen_controller.dart';
import 'package:metamorphosis/Taskscreen/view/taskscreen_view.dart';
import 'package:sizer/sizer.dart';

class BottomNavScreenView extends GetView<BottomNavController> {
  const BottomNavScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    Get.put(HomeScreenController());
    Get.put(TaskScreenController());
    Get.put(ProfileScreenController());
    Get.put(ChartScreenController());
    return Scaffold(
      body: Obx(
        () => controller.selectedView.value == "home"
            ? HomeScreenView()
            : controller.selectedView.value == "task"
                ? TaskScreenView()
                : controller.selectedView.value == "chart"
                    ? ChartScreenView()
                    : ProfileScreenView(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        alignment: Alignment.center,
        height: 15.h,
        width: 100.w,
        // color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Container(
                height: 8.h,
                width: 18.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: controller.selectedView.value == "home"
                        ? Colors.tealAccent
                        : Colors.deepPurple),
                child: IconButton(
                    onPressed: () {
                      if (controller.selectedView.value != "home") {
                        controller.changeView(view: "home");
                      }
                    },
                    icon: Obx(
                      () => Icon(
                        Icons.home_rounded,
                        size: controller.selectedView.value == "home"
                            ? 40.sp
                            : 25.sp,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            Obx(
              () => Container(
                height: 8.h,
                width: 18.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: controller.selectedView.value == "task"
                        ? Colors.tealAccent
                        : Colors.deepPurple),
                child: IconButton(
                    onPressed: () {
                      if (controller.selectedView.value != "task") {
                        controller.changeView(view: "task");
                      }
                    },
                    icon: Obx(
                      () => Icon(
                        Icons.list_alt_rounded,
                        size: controller.selectedView.value == "task"
                            ? 40.sp
                            : 25.sp,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            Obx(
              () => Container(
                height: 8.h,
                width: 18.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: controller.selectedView.value == "chart"
                        ? Colors.tealAccent
                        : Colors.deepPurple),
                child: IconButton(
                    onPressed: () {
                      if (controller.selectedView.value != "chart") {
                        controller.changeView(view: "chart");
                      }
                    },
                    icon: Obx(
                      () => Icon(
                        Icons.align_vertical_bottom_rounded,
                        size: controller.selectedView.value == "chart"
                            ? 40.sp
                            : 25.sp,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            Obx(
              () => Container(
                height: 8.h,
                width: 18.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: controller.selectedView.value == "profile"
                        ? Colors.tealAccent
                        : Colors.deepPurple),
                child: IconButton(
                    onPressed: () {
                      if (controller.selectedView.value != "profile") {
                        controller.changeView(view: "profile");
                      }
                    },
                    icon: Obx(
                      () => Icon(
                        Icons.person_rounded,
                        size: controller.selectedView.value == "profile"
                            ? 40.sp
                            : 25.sp,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
