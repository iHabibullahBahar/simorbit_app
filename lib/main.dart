import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/screens/splash_screen.dart';

import 'src/controllers/device_controller.dart';

void main() {
  final deviceController = Get.put(DeviceController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
