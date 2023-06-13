import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salary/Views/Setting/Setting.dart';
import '../../Utils/Strings.dart';
import '../Archive/Archive.dart';
import '../CostManagement/CostManagement.dart';
import '../Home/Home.dart';
import 'Api/BasePageService.dart';
import 'package:flutter/cupertino.dart';

class BasePage_Controller extends GetxController {
  BasePageService basePageService=BasePageService();
  RxInt pageIndex = 0.obs;
  RxList pages = [
    Home(),//0
    Archive(),//1
    Setting(),//2
    CostManagement()//3
  ].obs;
  RxInt navIndex = 2.obs;
  String selectedColor="003C75";
  String unselectedColor="ADC2D6";
  String selectedBackColor="9ED0FF";
  String selectExitColor = "D12D0C";
  final box = GetStorage();
  RxBool appbarVIS=true.obs;
  RxBool navbarVIS=true.obs;
  RxBool isAvoid=false.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxString textHeader=txtHomeHeader.obs;

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
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
    return true;
  }

  gotoArchive() {
    navIndex.value=3;
    pageIndex.value=1;
    textHeader.value=txtArchiveHeader;
  }

  gotoHome() {
    navIndex.value=2;
    pageIndex.value=0;
    textHeader.value=txtHomeHeader;
  }

  backToHome() {
    pageIndex.value=0;
    navIndex.value=2;
    textHeader.value=txtHomeHeader;
  }

  gotoSetting() {
    navIndex.value=4;
    pageIndex.value=2;
    textHeader.value=txtSettingHeader;
  }

  backToSetting(){
    pageIndex.value=2;
    textHeader.value=txtSettingHeader;
  }

  gotoExit() {
    exit(0);
  }

  backPages() {
    if(pageIndex.value==3){
      backToSetting();
    }else if(pageIndex.value==2){
      backToHome();
    }else if(pageIndex.value==1){
      backToHome();
    }
  }

  gotoCostManegment() {
    pageIndex.value=3;
    textHeader.value=txtCostManagement;
  }
}