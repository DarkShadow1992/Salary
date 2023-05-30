import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'HomeController.dart';
import 'viewShamsiDate.dart';
import 'viewShamsiDateWidget.dart';
import 'viewTextFieldDetailsHome.dart';
import 'viewTouch.dart';

class Home extends StatelessWidget {
  var controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.w), topLeft: Radius.circular(20.w)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              SizedBox(height: 25.h),
              Container(
                  margin: EdgeInsets.fromLTRB(50.w, 0, 50.w, 15.h),
                  child: const ViewDateTimePersian()
              ),
              // TouchContentHome
              SizedBox(height: 25.h),
              ViewTouchContentHome(),
              // DateTimeWidgetPersian
              SizedBox(height: 50.h),
              ViewDateTimeWidgetPersian(),
              // TextField Details
              SizedBox(height: 25.h),
              ViewTextFieldDetails(),
              SizedBox(height: 100.h),
              // ViewTouchContentBottom
            ],
          ),
        ),
    );
  }
}