import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Registration/controller/registration_controller.dart';
import 'package:metamorphosis/Registration/view/registration_view2.dart';
import 'package:sizer/sizer.dart';

class RegistrationViewPersonalInfo extends GetView<RegistrationController> {
  const RegistrationViewPersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegistrationController());
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 4.w),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Hi User!",
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
              Container(
                width: 80.w,
                alignment: Alignment.center,
                child: Text(
                  "Welcome to your journey of Metamorphosis.",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 60.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Please fill-out the following",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Birthdate: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            controller.showDatePicker();
                          },
                          child: Container(
                            child: Obx(() => Text(
                                  controller.birthDatePick.value,
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.normal),
                                )),
                          ),
                        )),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Age: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10.w),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Gender: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 4.w),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Height: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 5.w),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Weight: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 4.w),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Addess: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 2.5.w),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Career: ",
                          style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.black45,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 4.5.w),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => RegistrationViewCredential());
                },
                child: Container(
                    height: 6.h,
                    width: 90.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.purple[700],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all()),
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
