import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simorbit_app/src/controllers/device_controller.dart';
import 'package:simorbit_app/src/models/call_model.dart';

class CallController extends GetxController {
  static CallController get to => Get.find();
  static CallController get instance => Get.find();
  RxBool isLoading = false.obs;
  CallModel callModel = CallModel();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMessages();
  }

  void fetchMessages() async {
    String ids = "";
    List<DeviceInfo> devices = await DeviceController.instance.getDevices();
    for (int i = 0; i < devices.length; i++) {
      ids += devices[i].deviceId.toString();
      if (i != devices.length - 1) {
        ids += ",";
      }
    }
    isLoading.value = true;
    try {
      // for (int i = 0; i < DeviceController.instance.deviceIds.length; i++) {
      //   ids += DeviceController.instance.deviceIds[i].toString();
      //   if (i != DeviceController.instance.deviceIds.length - 1) {
      //     ids += ",";
      //   }
      // }
      var body = {"secret": "X1766086542124389214", "ids": ids};
      var response = await http.post(
          Uri.parse("https://www.simorbit.devsfolder.com/api/v11/calls/"),
          body: body);
      var data = response.body;
      final decodedData = jsonDecode(data);
      callModel = CallModel.fromJson(decodedData);
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }
}
