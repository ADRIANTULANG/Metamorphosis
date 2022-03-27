import 'package:flutter/material.dart';
import 'package:metamorphosis/Splashscreen/view/splashcreen_view.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Metamorphosis',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.purple[300],
            primarySwatch: Colors.purple,
          ),
          home: const SplashScreenView());
    });
  }
}
