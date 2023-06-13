import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salary/Views/Base/BasePageController.dart';
import '../../Utils/AllApp_Color.dart';
import '../../Utils/HexColor.dart';
import 'SettingController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Setting extends StatelessWidget {
  var controller = Get.put(Setting_Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //تنظیمات عمومی
        Container(
            margin: EdgeInsets.fromLTRB(0.w, 10.h, 16.w, 10.h),
            alignment: Alignment.centerRight,
            child: Text(
              'تنظیمات عمومی',
              style: TextStyle(
                color: AppColor.Color_GrayColor,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.right,
            )),
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
                   Get.find<BasePage_Controller>().gotoCostManegment();
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
                          // مدیریت هزینه ها
                          Expanded(
                            child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h), child: Text(
                              'مدیریت هزینه ها',
                              style: TextStyle(
                                color: AppColor.Color_TextPrimaryColor,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),),
                          ),
                          // ردبف آیکن مدیریت هزینه ها
                          const Icon(CupertinoIcons.arrow_up_bin_fill),
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
        // پوسته برنامه
        Padding(
            padding: EdgeInsets.fromLTRB(5.w, 15.h, 5.w, 0.h),
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
                  onTap: () {},
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
                            // پوسته برنامه
                            Expanded(
                              child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h), child: Text(
                                'پوسته برنامه',
                                style: TextStyle(
                                  color: AppColor.Color_TextPrimaryColor,
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),),
                            ),
                            // ردبف آیکن پوسته برنامه
                            Expanded(
                              child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 105.w, 0.h), child: const Icon(CupertinoIcons.doc_on_clipboard),
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
        //پشتیبانی برنامه
        Container(
            margin: EdgeInsets.fromLTRB(0.w, 25.h, 16.w, 12.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'پشتیبانی برنامه',
                    style: TextStyle(
                      color: AppColor.Color_GrayColor,
                      fontSize: 13.sp,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            )),
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
                  onTap: () {},
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
                            // پشتیبان گیری برنامه
                            Expanded(
                              child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h), child: Text(
                                'پشتیبان گیری',
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
                              child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 105.w, 0.h), child: const Icon(CupertinoIcons.tray_arrow_down_fill),
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
