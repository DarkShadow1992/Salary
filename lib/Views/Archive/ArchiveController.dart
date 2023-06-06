import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'Api/HomeService.dart';

class Archive_Controller extends GetxController{
  ArchiveService archiveService=ArchiveService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.obs;
  RxString currentYearName = JDate.now().year.toString().obs;
}