import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salary/Views/Base/BasePageController.dart';
import 'Api/CostManagementService.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CostManagement_Controller extends GetxController{
  CostManagementService settingService=CostManagementService();
  final txtController = TextEditingController();
  static const _locale = 'en';
  String formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  RxBool isEmpty=true.obs;

  void getCurrentMoney() async {
    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_money");

    if(getRowCount>0){
      final allRows = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_money");
      for (final row in allRows) {
        Get.find<CostManagement_Controller>().txtController.text=row["money"].toString().seRagham();
      }
      Get.find<CostManagement_Controller>().isEmpty.value=false;
    }

    Get.find<BasePage_Controller>().gotoCostManegment();
  }
  void insertMoney() async {
    if(txtController.text.trim().isNotEmpty){
      if(isEmpty.value){
        Map<String, dynamic> row = {
          Get.find<BasePage_Controller>().dbHelper.columnMoney : int.parse(txtController.text.replaceAll(",", ""))
        };
        await Get.find<BasePage_Controller>().dbHelper.insert(row,'salary_money');
        ///DIALOG
      }
      else{
        updateMoney(txtController.text.replaceAll(",", ""));
      }
    }else{
      ///DIALOG
    }

  }
  void updateMoney(String money) async {
    Map<String, dynamic> row = {
      Get.find<BasePage_Controller>().dbHelper.columnMoneyId: 1,
      Get.find<BasePage_Controller>().dbHelper.columnMoney: money,
    };
    await Get.find<BasePage_Controller>().dbHelper.update(row,'salary_money','_id');
    ///DIALOG
  }

}