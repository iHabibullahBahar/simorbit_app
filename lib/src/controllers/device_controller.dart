import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeviceController extends GetxController {
  static DeviceController get to => Get.find();
  static DeviceController get instance => Get.find();
  RxBool isLoading = false.obs;
  TextEditingController imeiTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> checkIMEI(String IMEI) async {
    var body = {"secret": "X1766086542124389214", "imei": "109876543211212"};
    try {
      // var response = await http.post(
      //     Uri.parse("https://www.simorbit.devsfolder.com/api/v11/login"),
      //     body: body);
      var response = await http.get(
        Uri.parse("https://www.simorbit.devsfolder.com/api/v11/login"),
      );

      // final uri = Uri.http('simorbit.devsfolder.com', '/api/v11/login', body);
      // final response = await http.post(uri);

      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
