import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:metamorphosis/Assestment/controller/assestment_controller.dart';
import 'package:metamorphosis/Assestment/widget/physical_assesment_view.dart';
import 'package:metamorphosis/Assestment/widget/psychological_assestment_view.dart';
import 'package:metamorphosis/Assestment/widget/spiritual_assestment_view.dart';
import 'package:sizer/sizer.dart';

class AssestmentView extends GetView<AssestmentController> {
  const AssestmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AssestmentController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Self Care ",
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
                "Assestment",
                style:
                    TextStyle(fontSize: 30.sp, color: Colors.white, shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ]),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Rate the following areas according to how well you think you are doing.",
                maxLines: 2,
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              SizedBox(
                height: .5.h,
              ),
              Text(
                "5 = I do this well (e.g., frequently)",
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              Text(
                "4 = I do this OK (e.g., occasionally)",
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              Text(
                "3 = I barely or rarely do this",
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              Text(
                "2 = I never do this",
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              Text(
                "1 = This never occured to me.",
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              SizedBox(
                height: 3.h,
              ),
              PhysicalCareAssestmentView(),
              SizedBox(
                height: 3.h,
              ),
              PsychologicalSelfCareView(),
              SizedBox(
                height: 3.h,
              ),
              SpiritualSelfCareAssesmentView(),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    controller.submit_assestment();
                  },
                  child: Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.white,
                            blurStyle: BlurStyle.normal,
                            blurRadius: 15.0,
                            // offset: Offset(0.0, 0.75),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Colors.black, width: .5.w)),
                    alignment: Alignment.center,
                    child: Text(
                      "D O N E",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 15.0,
                              color: Colors.black,
                              offset: Offset(2.0, 2.0),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
