import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/colors.dart';
import 'package:simorbit_app/src/consts/sizes.dart';
import 'package:simorbit_app/src/controllers/device_controller.dart';
import 'package:simorbit_app/src/screens/login/login_screen.dart';
import 'package:simorbit_app/src/screens/settings/widgets/add_new_slot_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: zWhiteColor,
        elevation: 0,
        actions: [],
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: zTextColor,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(zDefaultPadding),
        child: ListView(
          children: [
            const SizedBox(
              height: 0,
            ),
            const Text(
              "Sim slots",
              style: TextStyle(
                color: zTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0;
                i < DeviceController.instance.globalDevices.length;
                i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: zGraySwatch[50],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "IMEI: ${DeviceController.instance.globalDevices[i].imei}",
                          style: const TextStyle(
                            color: zTextColor,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            DeviceInfo newDevice = DeviceInfo(
                                imei: DeviceController
                                    .instance.globalDevices[i].imei,
                                deviceId: DeviceController
                                    .instance.globalDevices[i].deviceId);
                            DeviceController.instance.removeDevice(newDevice);

                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {});
                            bool isanyDevice = await DeviceController.instance
                                .isAnyDeviceAdded();
                            if (!isanyDevice) {
                              Get.snackbar(
                                "All slots are removed",
                                "Please add a new slot",
                                backgroundColor: Colors.green,
                                colorText: zWhiteColor,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              Get.offAll(() => const LoginScreen());
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: zGraySwatch[100],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.delete_forever,
                                  color: Colors.red, size: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Get.to(() => AddNewSlotWidget());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: zPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add new slot",
                        style: TextStyle(
                          color: zWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add,
                        color: zWhiteColor,
                        size: 20,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _showNewSlotWidget() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          ///This will close the dialog box when user taps outside the dialog box
          onTap: () {
            Get.back();
          },
          child: GestureDetector(
            ///This will prevent the dialog box to close when user taps inside the dialog box
            onTap: () {},
            child: AddNewSlotWidget(),
          ),
        );
      },
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
