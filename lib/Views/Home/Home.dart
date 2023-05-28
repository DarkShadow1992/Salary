import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/HexColor.dart';
import '../../Utils/colors.dart';
import 'HomeController.dart';

class Home extends StatelessWidget {
  var controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("F2F9FF"),
    );
  }
}