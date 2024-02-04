import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/colors.dart';
import 'package:simorbit_app/src/consts/sizes.dart';
import 'package:simorbit_app/src/controllers/device_controller.dart';
import 'package:simorbit_app/src/screens/bottom_bar/bottom_bart.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: zWhiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: zWhiteColor,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Add your sim module",
              style: TextStyle(
                color: zTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(zDefaultPadding),
          child: ListView(
            children: [
              SizedBox(
                height: Get.height / 4,
              ),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: DeviceController.instance.imeiTextController,
                  scrollPadding: const EdgeInsets.only(bottom: 100),
                  style: const TextStyle(color: zTextColor),
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: zDefaultPadding),
                    hintText: "Enter IMEI Number",
                    hintStyle: TextStyle(
                      color: zGraySwatch[400],
                    ),
                  ),
                  cursorColor: zPrimaryColor,
                  onChanged: (value) {
                    if (value != null && value.isNotEmpty) {
                      setState(() {});
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (DeviceController
                              .instance.imeiTextController.text.length >
                          12) {
                        DeviceController.instance.checkIMEI(
                            DeviceController.instance.imeiTextController.text);
                        await Future.delayed(const Duration(seconds: 1));
                        if (await DeviceController.instance
                            .isAnyDeviceAdded()) {
                          Get.offAll(
                            () => AppNavigationBar(),
                          );
                          DeviceController.instance.imeiTextController.clear();
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please enter valid IMEI number",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: zErrorSwatch[500],
                          colorText: zWhiteColor,
                          margin: const EdgeInsets.all(zDefaultPadding),
                          borderRadius: 8,
                          duration: const Duration(seconds: 3),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: zPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: zDefaultPadding),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: zWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
