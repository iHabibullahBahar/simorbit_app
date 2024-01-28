import 'package:get/get.dart';

class CallController extends GetxController {
  static CallController get to => Get.find();
  static CallController get instance => Get.find();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
