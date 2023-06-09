import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'Api/SettingService.dart';

class Setting_Controller extends GetxController{
  SettingService settingService=SettingService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.toString().obs;
  RxString currentYearName = JDate.now().year.toString().obs;
}