import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Utils/CustomAlerts.dart';
import '../Base/BasePageController.dart';
import 'Api/HomeService.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Home_Controller extends GetxController {
  HomeService homeService = HomeService();
  RxString money = "0".obs;
  RxString Lastid = "0".obs;
  RxString time = "0".obs;

  getCurrentMoney() async {
    final getRowCount = await Get.find<BasePage_Controller>()
        .dbHelper
        .queryRowCount("salary_money");

    if (getRowCount > 0) {
      final allRows = await Get.find<BasePage_Controller>()
          .dbHelper
          .queryAllRows("salary_money");
      for (final row in allRows) {
        money.value = row["money"].toString().seRagham();
      }
    }
  }

  getlastId() async {
    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_details");

    if (getRowCount > 0) {
      final allRows = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_details");
      for (final row in allRows) {
        Lastid.value = row["_id"].toString();
        time.value = row["out_time"].toString();
      }
    }
  }

  addLogin() async {
    await getlastId();

    if(time.value!="0"){
      getCurrentMoney();
      alertPutDateServices(Get.context!);
      Future.delayed(Duration(seconds: 3));
      Map<String, dynamic> row = {
        Get.find<BasePage_Controller>().dbHelper.columnimpDate:
        DateTime.now().toPersianDate(twoDigits: true),
        Get.find<BasePage_Controller>().dbHelper.columnimpTime:
        DateFormat.Hm().format(DateTime.now()),
        Get.find<BasePage_Controller>().dbHelper.columnoutDate: "0",
        Get.find<BasePage_Controller>().dbHelper.columnoutTime: "0",
        Get.find<BasePage_Controller>().dbHelper.columnPrice: money.value,
        Get.find<BasePage_Controller>().dbHelper.columnJob: "0"
      };
      await Get.find<BasePage_Controller>().dbHelper.insert(row, 'salary_details');
      Get.back();
      alertDialogLoginSuccess(Get.context!);
    }
    else{
      alertDialogNotEmptyMoney(Get.context!);
    }
  }

  addLogOut() async {
    await getlastId();

    if(time.value=="0"){
      alertPutDateServices(Get.context!);
      Future.delayed(Duration(seconds: 3));
      Map<String, dynamic> row = {
        Get.find<BasePage_Controller>().dbHelper.columnInsertId: int.parse(Lastid.value),
        Get.find<BasePage_Controller>().dbHelper.columnoutDate: DateTime.now().toPersianDate(twoDigits: true),
        Get.find<BasePage_Controller>().dbHelper.columnoutTime: DateFormat.Hm().format(DateTime.now()),
      };
      await Get.find<BasePage_Controller>().dbHelper.update(row, 'salary_details','_id');
      Get.back();
      alertDialogLogout(Get.context!);
    }
    else{
      alertDialogNotEmptyMoney(Get.context!);
    }
  }
}
