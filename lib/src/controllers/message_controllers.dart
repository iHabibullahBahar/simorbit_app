import 'package:get/get.dart';

class MessageController extends GetxController {
  static MessageController get to => Get.find();
  static MessageController get instance => Get.find();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
