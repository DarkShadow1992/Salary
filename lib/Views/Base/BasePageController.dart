import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salary/Views/Setting/Setting.dart';
import '../../Utils/Strings.dart';
import '../../Utils/database_helper.dart';
import '../Archive/Archive.dart';
import '../BackupData/BackupData.dart';
import '../CostManagement/CostManagement.dart';
import '../CostManagement/CostManagementController.dart';
import '../Home/Home.dart';
import 'Api/BasePageService.dart';
import 'package:flutter/cupertino.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BasePage_Controller extends GetxController {
  BasePageService basePageService=BasePageService();
  RxInt pageIndex = 0.obs;
  RxList pages = [
    Home(),//0
    Archive(),//1
    Setting(),//2
    CostManagement(),//3
    BackupData()//4
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
  final dbHelper = DatabaseHelper();

  @override
  Future<void> onInit() async {
    super.onInit();
    BackButtonInterceptor.add(myInterceptor);
    if (box.read("token")==null) {

    } else {}
    await dbHelper.init();
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
    pageIndex.value=1;
    navIndex.value=3;
    textHeader.value=txtArchiveHeader;
  }

  gotoHome() {
    pageIndex.value=0;
    navIndex.value=2;
    textHeader.value=txtHomeHeader;
  }

  backToHome() {
    pageIndex.value=0;
    navIndex.value=2;
    textHeader.value=txtHomeHeader;
  }

  gotoSetting() {
    pageIndex.value=2;
    navIndex.value=4;
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
    if(pageIndex.value==4){
      backToSetting();
    }else if(pageIndex.value==3){
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

  gotoBackupData() {
    pageIndex.value=4;
    textHeader.value=txtBackupHeader;
  }

  backToBackupData(){
    pageIndex.value=3;
    textHeader.value=txtBackupHeader;
  }

 /* void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: 23
    };
    final id = await dbHelper.insert(row);
    debugPrint('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    debugPrint('query all rows:');
    for (final row in allRows) {
      debugPrint(row.toString());
    }
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Mary',
      DatabaseHelper.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    debugPrint('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    debugPrint('deleted $rowsDeleted row(s): row $id');
  }*/
}