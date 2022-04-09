import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Assestment/controller/assestment_controller.dart';
import 'package:sizer/sizer.dart';

import '../../helpers.dart';

class PhysicalCareAssestmentView extends GetView<AssestmentController> {
  const PhysicalCareAssestmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 1.w, right: 1.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Container(
            width: 100.w,
            alignment: Alignment.center,
            child: Text(
              "Physical Self Care Assestment",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      blurRadius: 15.0,
                      color: Colors.black,
                      offset: Offset(3.0, 3.0),
                    ),
                  ]),
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.physicalCareAssestment_questions.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100.w,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 100.w,
                        alignment: Alignment.center,
                        child: Text(
                          controller.physicalCareAssestment_questions[index]
                              ['question'],
                          textAlign: TextAlign.center,
                          style: AppStyle.normalText(
                              color: Colors.black, fontsize: 10),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.circle_outlined,
                          color: Colors.purple,
                        ),
                        onRatingUpdate: (rating) {
                          controller.physicalCareAssestment_questions[index]
                              ['rating'] = rating;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
