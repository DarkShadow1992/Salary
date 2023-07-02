import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import '../Base/BasePageController.dart';
import 'Api/ArchiveService.dart';

class Archive_Controller extends GetxController{
  ArchiveService archiveService=ArchiveService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.toString().obs;
  RxString currentYearName = JDate.now().year.toString().obs;
  RxList<Map<String, dynamic>> items=<Map<String, dynamic>>[].obs;

  void getDetailsList() async {
    final getRowCount = await Get.find<BasePage_Controller>().dbHelper.queryRowCount("salary_details");

    if(getRowCount>0){
      items.value = await Get.find<BasePage_Controller>().dbHelper.queryAllRows("salary_details");
    }

  }

  String getHours() {
    String hours="0";

    return hours;
  }

  String getTotalSalary() {
    String hours="0";

    return hours;
  }

}