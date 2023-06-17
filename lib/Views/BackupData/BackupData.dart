import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salary/Views/Base/BasePageController.dart';
import '../../Utils/AllApp_Color.dart';
import 'BackupDataController.dart';

class BackupData extends StatelessWidget {
  var controller = Get.put(BackupData_Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //پشتیبانی برنامه
        Container(
            margin: EdgeInsets.fromLTRB(0.w, 10.h, 16.w, 10.h),
            alignment: Alignment.centerRight,
            child: Text(
              'پشتیبانی برنامه',
              style: TextStyle(
                color: AppColor.Color_GrayColor,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.right,
            )),
        //پشتیبانی برنامه
        Padding(
           padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 0.h),
           child: SizedBox(
             width: Get.width,
             height: 70.h,
             child: Card(
               margin: EdgeInsets.fromLTRB(15.w, 0.h, 10.w, 0.h),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(6.w),
               ),
               shadowColor: Colors.black38,
               elevation: 2.0,
               child: InkWell(
                 borderRadius: BorderRadius.circular(6.w),
                 onTap: () {
                   // Get.find<BasePage_Controller>().gotoCostManegment();
                 },
                 highlightColor: AppColor.Card_highlightColor,
                 splashColor: AppColor.Card_highlightColor,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                    SizedBox(
                      width: Get.width,
                      child: Row(
                        children: [
                          // دریافت فایل پشتیبان
                          Expanded(
                            child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h), child: Text(
                              'دریافت فایل پشتیبان',
                              style: TextStyle(
                                color: AppColor.Color_TextPrimaryColor,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),),
                          ),
                          // ردبف آیکن مدیریت هزینه ها
                          const Icon(CupertinoIcons.square_arrow_down_fill),
                          SizedBox(width: 18.w,)
                        ],
                      ),
                    ),
                   ],
                 ),
               ),
             ),
           )
       ),
        Padding(
            padding: EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 0.h),
            child: SizedBox(
              width: Get.width,
              height: 70.h,
              child: Card(
                margin: EdgeInsets.fromLTRB(15.w, 0.h, 10.w, 0.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.w),
                ),
                shadowColor: Colors.black38,
                elevation: 2.0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6.w),
                  onTap: () {
                    Get.find<BasePage_Controller>().gotoBackupData();
                  },
                  highlightColor: AppColor.Card_highlightColor,
                  splashColor: AppColor.Card_highlightColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child:  Row(
                          children: [
                            // بازیابی فایل پشتیبان
                            Expanded(
                              child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h), child: Text(
                                'بازیابی فایل پشتیبان',
                                style: TextStyle(
                                  color: AppColor.Color_TextPrimaryColor,
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),),
                            ),
                            // ردبف آیکن مدیریت هزینه ها
                            Expanded(
                              child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 105.w, 0.h), child: const Icon(CupertinoIcons.arrow_2_circlepath_circle_fill),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}
