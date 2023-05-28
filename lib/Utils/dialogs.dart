import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'HexColor.dart';
import 'colors.dart';

Future<dynamic> guide(BuildContext context) {
  return showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 280.h,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Padding(padding: EdgeInsets.only(top: 10.h,left: 10.w),child: GestureDetector(
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.close_rounded),
                  ),
                  onTap: () => Get.back(),
                ),),
                Padding(padding: EdgeInsets.only(top: 10.h,right: 10.w),child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('افزودن عکس سفارش',
                    style: TextStyle(
                        color: HexColor("272727"),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )),
                SizedBox(height: 10.h),
                Padding(padding: EdgeInsets.only(top: 10.h,right: 10.w,left: 10.w),child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('برای نمایش جزییات سفارش خود تا حد امکان از عکس های با کیفیت و فاقد پس زمینه استفاده نمایید.توجه داشته باشید که عکس بارگذاری شده توسط شما پس از تایید و صحت سنجی تیم طلاتو در سفارش شما نمایش داده خواهد شد.',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: HexColor("272727"),
                        fontSize: 13.sp,
                    ),
                  ),
                )),
                SizedBox(height: 30.h),
                Padding(padding: EdgeInsets.only(top: 10.h,right: 10.w,left: 10.w),child: Align(
                  alignment: Alignment.centerLeft,
                  child:Row(
                    children: [
                      GestureDetector(
                        child: Text('انتخاب عکس از گالری',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: HexColor(clr915858),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: () => Get.back(result: "1"),
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        child: Text('انتخاب عکس از دوربین',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: HexColor(clr915858),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: () => Get.back(result: "2"),
                      ),
                    ],
                  )
                )),
              ],
            ),
          ),
        );
      });
}