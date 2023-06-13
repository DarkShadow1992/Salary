import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Api/CostManagementService.dart';

class CostManagement_Controller extends GetxController{
  CostManagementService settingService=CostManagementService();
  final txtController = TextEditingController();
  static const _locale = 'en';
  String formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));

}