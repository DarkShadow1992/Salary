import 'package:get/get.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:get_storage/get_storage.dart';
import '../Home/Home.dart';
import 'Api/BasePageService.dart';
import 'package:flutter/cupertino.dart';

class BasePage_Controller extends GetxController {
  BasePageService basePageService=BasePageService();
  RxInt pageIndex = 0.obs;
  RxList pages = [
    Home(),//0
  ].obs;
  RxInt navIndex = 1.obs;
  String selectedColor="C49664";
  String unselectedColor="999999";
  String selectedBackColor="C49664";
  final box = GetStorage();
  RxBool appbarVIS=true.obs;
  RxBool navbarVIS=true.obs;
  RxBool isAvoid=false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    BackButtonInterceptor.add(myInterceptor);

    if (box.read("token")==null) {

    } else {}

  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {

    return true;
  }

}