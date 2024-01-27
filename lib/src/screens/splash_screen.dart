import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/image_paths.dart';
import 'package:simorbit_app/src/screens/bottom_bar/bottom_bart.dart';
import 'package:simorbit_app/src/screens/login/login_screen.dart';

String long = "", lat = "";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double imageHeight = 10;
  bool isFull = false;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 2000),
        () => isLogin
            ? Get.to(() => const LoginScreen(), duration: Duration.zero)
            : Get.to(() => const AppNavigationBar(), duration: Duration.zero));
    super.initState();

    Timer(
      ///Change the size in every 1 seconds if full
      const Duration(microseconds: 0),
      () => setState(() {
        isFull = !isFull;
        imageHeight = 300;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500), // Provide the duration
          height: imageHeight,
          width: imageHeight,
          // Use the properties stored in the State class.
          child: Center(
            child: Image.asset(zTextLogo),
          ),
        ),
      ),
    );
  }
}
