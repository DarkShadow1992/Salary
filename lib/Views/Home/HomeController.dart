import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/HexColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/colors.dart';
import '../Base/BasePageController.dart';
import 'Api/HomeService.dart';
import 'package:get_storage/get_storage.dart';
import 'Class/Me.dart';

class Home_Controller extends GetxController with GetSingleTickerProviderStateMixin {
  HomeService homeService=HomeService();


}