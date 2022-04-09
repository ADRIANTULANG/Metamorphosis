import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:metamorphosis/Login/controller/login_controller.dart';
import 'package:metamorphosis/Registration/view/registration_view1.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Container(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Metamorphosis",
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
                "A unified self-care app",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 6.h,
                width: 85.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: TextField(
                  controller: controller.username,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(left: 5.w, top: 3.5.w),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 6.h,
                width: 85.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: TextField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    contentPadding: EdgeInsets.only(left: 5.w, top: 3.5.w),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InkWell(
                onTap: () {
                  // Get.to(() => BottomNavScreenView());
                  controller.login(context: context);
                },
                child: Container(
                    height: 6.h,
                    width: 85.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.purple[700],
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all()),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => RegistrationViewPersonalInfo());
                    },
                    child: Container(
                      child: Text(
                        "Sign up!",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
