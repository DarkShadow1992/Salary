import 'dart:async';
import 'package:get/get.dart';
import 'Views/Base/BasePage.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Timer timer = Timer(
        const Duration(milliseconds: 3000), () {
      Get.offAll(() => BasePage());
    });
  }

}