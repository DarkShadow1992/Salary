import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jdate/jdate.dart';
import 'Api/ArchiveService.dart';

class Archive_Controller extends GetxController{
  ArchiveService archiveService=ArchiveService();
  String formattedDate = DateFormat.Hm().format(DateTime.now());
  RxString currentMonthName = JDate.now().monthName.toString().obs;
  RxString currentYearName = JDate.now().year.toString().obs;
}