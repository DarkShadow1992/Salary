import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../Base/BasePageController.dart';
import 'Api/ArchiveService.dart';

class Archive_Controller extends GetxController{
  ArchiveService archiveService=ArchiveService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.toString().obs;
  RxString currentYearName = JDate.now().year.toString().obs;
  RxList<Map<String, dynamic>> items=<Map<String, dynamic>>[].obs;
  RxString money = "0".obs;

  void getDetailsList() async {

    getCurrentMoney();

    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_details");

    if(getRowCount>0){
      items.value = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_details");
    }

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

    DateTime a = DateTime.parse('$_date $time1:00');
    DateTime b = DateTime.parse('$_date $time2:00');

    return (a.difference(b).inMinutes*double.parse(money.value)).toStringAsFixed(0).seRagham();
  }

  String getHours(String time1, String time2) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    var _date = dateFormat.format(DateTime.now());

    DateTime a = DateTime.parse('$_date $time1:00');
    DateTime b = DateTime.parse('$_date $time2:00');

    return getTimeString(a.difference(b).inMinutes);
  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

}