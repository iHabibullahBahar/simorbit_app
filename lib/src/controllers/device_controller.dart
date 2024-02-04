import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simorbit_app/src/models/login_model.dart';

class DeviceController extends GetxController {
  static DeviceController get to => Get.find();

  static DeviceController get instance => Get.find();
  RxBool isLoading = false.obs;
  TextEditingController imeiTextController = TextEditingController();
  List<DeviceInfo> globalDevices = [];
  List<int> deviceIds = [];

  @override
  void onInit() {
    super.onInit();
  }

  LoginModel loginModel = LoginModel();

  Future<bool> isAnyDeviceAdded() async {
    List<DeviceInfo> devices = await getDevices();
    if (devices.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> checkIMEI(String IMEI) async {
    var body = {"secret": "X1766086542124389214", "imei": IMEI};
    try {
      var response = await http.post(
        Uri.parse(
          "https://www.simorbit.devsfolder.com/api/v11/login/",
        ),
        body: body,
      );
      var data = response.body;
      final decodedData = jsonDecode(data);
      if (decodedData['status'] == "false") {
        Get.snackbar(
          "Error",
          "IMEI not found",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      loginModel = LoginModel.fromJson(decodedData);
      if (loginModel.status == "true") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        DeviceInfo newDevice =
            DeviceInfo(imei: IMEI, deviceId: loginModel.data!.id!);

        await addDevice(newDevice);
        List<DeviceInfo> devices = await getDevices();
        for (DeviceInfo device in devices) {
          print(device.toJson());
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addDevice(DeviceInfo devicee) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<DeviceInfo> devices = await getDevices();
    if (devices.length > 0) {
      for (DeviceInfo device in devices) {
        if (device.imei == devicee.imei) {
          Get.snackbar(
            "Error",
            "Device already added",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );

          return;
        }
      }
    }
    List<String>? devicesJson = prefs.getStringList('devices') ?? [];
    devicesJson.add(json.encode(devicee.toJson()));

    await prefs.setStringList('devices', devicesJson);
    Get.snackbar(
      "Success",
      "Device added successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
      colorText: Colors.white,
    );
  }

  Future<List<DeviceInfo>> getDevices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? devicesJson = prefs.getStringList('devices') ?? [];
    List<DeviceInfo> devices = devicesJson
        .map((jsonString) => DeviceInfo.fromJson(json.decode(jsonString)))
        .toList();
    globalDevices = devices;
    for (DeviceInfo device in devices) {
      deviceIds.add(int.parse(device.deviceId));
    }

    return devices;
  }

  Future<void> clearDeviceList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('devices');
  }

  Future<void> removeDevice(DeviceInfo deviceToRemove) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<DeviceInfo> devices = await getDevices();
    devices.removeWhere((device) =>
        device.imei == deviceToRemove.imei &&
        device.deviceId == deviceToRemove.deviceId);
    List<String> updatedDevicesJson =
        devices.map((device) => json.encode(device.toJson())).toList();
    await prefs.setStringList('devices', updatedDevicesJson);
  }
}

class DeviceInfo {
  final String imei;
  final String deviceId;

  DeviceInfo({required this.imei, required this.deviceId});

  Map<String, dynamic> toJson() {
    return {
      'imei': imei,
      'deviceId': deviceId,
    };
  }

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      imei: json['imei'],
      deviceId: json['deviceId'],
    );
  }
}
