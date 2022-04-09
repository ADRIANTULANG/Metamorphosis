import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Destress/controller/destress_controller.dart';
import 'package:metamorphosis/helpers.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DeStressView extends GetView<DeStressController> {
  const DeStressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeStressController());
    return Scaffold(
      body: Container(
        // color: Colors.red,
        width: 100.w,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Perceived Stress Scale",
                style: AppStyle.headers(color: Colors.white, fontsize: 20),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "For each question choose from the following alternatives:",
                textAlign: TextAlign.center,
                style: AppStyle.bodyText(color: Colors.white, fontsize: 13),
              ),
              SizedBox(
                height: .5.h,
              ),
              Text(
                " 0 - never 1 - almost never \n 2 - sometimes 3 - fairly often \n 4 - very often",
                textAlign: TextAlign.center,
                style: AppStyle.bodyText(color: Colors.white, fontsize: 13),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "1. In the last month, how often have you been upset because of  something that happened unexpectedly ?.",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question1 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "2. In the last month, how often have you felt that you were unable to control the important things in your life?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question2 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "3. In the last month, how often have you felt nervous and stressed?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question3 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "4. In the last month, how often have you felt confident about your ability to handle your personal problems?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question4 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "5. In the last month, how often have you felt that things were going your way?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question5 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "6. In the last month, how often have you found that you could not cope with all the things that you had to do?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question6 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "7. In the last month, how often have you been able to control irritations in your life?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question7 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "8. In the last month, how often have you felt that you were on top of things?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question8 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "9. In the last month, how often have you been angered because of things that happened that were outside of your control?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question9 = rating;
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 90.w,
                // color: Colors.red,
                child: Text(
                  "10. In the last month, how often have you felt difficulties were piling up so high that you could not overcome them?",
                  style: AppStyle.normalText(color: Colors.black, fontsize: 10),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  controller.question10 = rating;
                },
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 10.h,
        width: 100.w,
        // color: Colors.white,
        alignment: Alignment.center,
        child: InkWell(
          onTap: () async {
            await controller.de_stress();
          },
          child: Container(
            alignment: Alignment.center,
            height: 7.h,
            width: 90.w,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              "D O N E",
              style: AppStyle.bodyText(color: Colors.white, fontsize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
