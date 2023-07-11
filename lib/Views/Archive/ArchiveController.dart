import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../Base/BasePageController.dart';
import 'Api/ArchiveService.dart';

class Archive_Controller extends GetxController{
  ArchiveService archiveService=ArchiveService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.toString().obs;
  RxString currentYearName = JDate.now().year.toString().obs;
  RxList<Map<String, dynamic>> items=<Map<String, dynamic>>[].obs;
  RxString money = "0".obs;
  RxDouble totalFullMoney=0.0.obs;

  void getDetailsList() async {
    getCurrentMoney();

    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_details");

    if(getRowCount>0){
      items.value = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_details");
    }

    getTotalFullMoney();

  }

  getCurrentMoney() async {
    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_money");

    if (getRowCount > 0) {
      final allRows = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_money");
      for (final row in allRows) {
        money.value = row["money"].toString();
      }
      money.value=(int.parse(money.value)/60).toString();
    }
  }

  String getTotalSalary(String time1, String time2) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());

    DateTime a = DateTime.parse('$_date $time1');
    DateTime b = DateTime.parse('$_date $time2');

    if(a.difference(b).inMinutes > 0){
      return (a.difference(b).inMinutes*double.parse(money.value)).toStringAsFixed(0).seRagham();
    }else{
      return "0";
    }

  }

  getTotalFullMoney() {
    totalFullMoney.value=0.0;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());
    for(int i=0;i<items.length;i++){

      String time1=items[i]["out_time"].toString();
      String time2=items[i]["imp_time"].toString();

      DateTime a = DateTime.parse('$_date $time1');
      DateTime b = DateTime.parse('$_date $time2');

      if(a.difference(b).inMinutes > 0){
        totalFullMoney.value=totalFullMoney.value+a.difference(b).inMinutes*double.parse(money.value);
      }
    }
  }

  String getHours(String time1, String time2) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());

    DateTime a = DateTime.parse('$_date $time1');
    DateTime b = DateTime.parse('$_date $time2');

    if(a.difference(b).inMinutes > 0){
      return getTimeString(a.difference(b).inMinutes);
    }else{
      return "0";
    }

  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

}