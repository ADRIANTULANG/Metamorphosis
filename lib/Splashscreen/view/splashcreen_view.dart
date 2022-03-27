import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metamorphosis/Splashscreen/controller/Splashscreen_comntroller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/butterfly.png"))),
      ),
    );
  }
}
