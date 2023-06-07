import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/AllApp_Color.dart';
import '../../Utils/HexColor.dart';
import 'ArchiveController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class Archive extends StatelessWidget {
  var controller = Get.put(Archive_Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5.w, 0.w, 5.w, 0.w),
          child: Card(
            margin: EdgeInsets.fromLTRB(10.w, 14.w, 10.w, 12.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.w),
            ),
            shadowColor: Colors.black38,
            elevation: 9.0,
            child: InkWell(
              borderRadius: BorderRadius.circular(6.w),
              onTap: () {},
              highlightColor: AppColor.Card_highlightColor,
              splashColor: AppColor.Card_highlightColor,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0.w, 6.w, 12.w, 0.w),
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Text(
                              'ماه',
                              style: TextStyle(
                                color: AppColor.Color_TextPrimaryColor,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(10.w, 2.h, 40.w, 3.h),
                              alignment: Alignment.topLeft,
                              width: 100.w,
                              height: 35.w,
                              child: Card(
                                margin: EdgeInsets.all(2.w),
                                color: AppColor.Color_CardbackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7.w)),
                                  side: BorderSide(
                                    color: HexColor('#F5FAFD'),
                                    width: 0.0,
                                  ),
                                ),
                                elevation: 0.0,
                                child: InkWell(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7.w),
                                      topRight: Radius.circular(7.w),
                                      bottomRight: Radius.circular(7.h),
                                      bottomLeft: Radius.circular(7.h),
                                    ),
                                    onTap: () {
                                      // alertItemToBasketServices(context);
                                    },
                                    highlightColor:
                                        AppColor.Card_highlightColor,
                                    splashColor: AppColor.Card_splashColor,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        //currentMonthName.monthName,
                                        '${controller.currentMonthName}',
                                        style: TextStyle(
                                          color: AppColor
                                              .Color_CardbackgroundTextColor,
                                          fontSize: 12.sp,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0.w, 12.w, 0),
                    alignment: Alignment.topRight,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Text(
                            'سال جاری',
                            style: TextStyle(
                              color: AppColor.Color_TextPrimaryColor,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.w, 2.h, 40.w, 3.h),
                            alignment: Alignment.topLeft,
                            width: 100.w,
                            height: 35.w,
                            child: Card(
                              margin: EdgeInsets.all(2.w),
                              color: AppColor.Color_CardbackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.w)),
                                side: BorderSide(
                                  color: HexColor('#F5FAFD'),
                                  width: 0.0,
                                ),
                              ),
                              elevation: 0.0,
                              child: InkWell(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7.w),
                                    topRight: Radius.circular(7.w),
                                    bottomRight: Radius.circular(7.h),
                                    bottomLeft: Radius.circular(7.h),
                                  ),
                                  onTap: () {
                                    // alertItemToBasketServices(context);
                                  },
                                  highlightColor: AppColor.Card_highlightColor,
                                  splashColor: AppColor.Card_splashColor,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${controller.currentYearName}',
                                      style: TextStyle(
                                        color: AppColor
                                            .Color_CardbackgroundTextColor,
                                        fontSize: 12.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                      softWrap: false,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0.w, 12.w, 5.w),
                    alignment: Alignment.topRight,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Text(
                            'جمع کارکرد',
                            style: TextStyle(
                              color: AppColor.Color_TextPrimaryColor,
                              fontSize: 12.sp,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(10.w, 2.h, 40.w, 3.h),
                              alignment: Alignment.topLeft,
                              width: 100.w,
                              height: 35.w,
                              child: SizedBox(
                                height: Get.height,
                                width: Get.width,
                                child: Card(
                                  margin: EdgeInsets.all(2.w),
                                  color: AppColor.Color_CardbackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.w)),
                                    side: BorderSide(
                                      color: HexColor('#F5FAFD'),
                                      width: 0.0,
                                    ),
                                  ),
                                  elevation: 0.0,
                                  child: InkWell(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7.w),
                                        topRight: Radius.circular(7.w),
                                        bottomRight: Radius.circular(7.h),
                                        bottomLeft: Radius.circular(7.h),
                                      ),
                                      onTap: () {
                                        // alertItemToBasketServices(context);
                                      },
                                      highlightColor:
                                          AppColor.Card_highlightColor,
                                      splashColor: AppColor.Card_splashColor,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.w, 0.h, 5.w, 0.h),
                                            child: Text(
                                              '07:45:00',
                                              style: TextStyle(
                                                color: AppColor
                                                    .Color_CardbackgroundTextColor,
                                                fontSize: 12.sp,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.right,
                                            ),
                                          )),
                                          Expanded(
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5.w, 0.h, 0.w, 0.h),
                                                  child: Text(
                                                    'ساعت',
                                                    style: TextStyle(
                                                      color: AppColor
                                                          .Color_TextPrimaryColor,
                                                      fontSize: 12.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    textAlign: TextAlign.left,
                                                  ))),
                                        ],
                                      )),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.Color_WhiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.w),
                  topLeft: Radius.circular(20.w),
                  bottomLeft: Radius.circular(20.w),
                  bottomRight: Radius.circular(20.w)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0.w),
                topRight: Radius.circular(20.0.w),
                bottomLeft: Radius.circular(20.0.w),
                bottomRight: Radius.circular(20.0.w),
              ),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: AppColor.Color_GlowingOverscrollIndicator,
                showLeading: true,
                showTrailing: true,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 0.w),
                  itemCount: 1,
                  itemBuilder: (context, index) => SizedBox(
                    width: Get.width,
                    height: 140.h,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 8.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.w),
                      ),
                      shadowColor: Colors.black38,
                      color: AppColor.Card_highlightColor,
                      elevation: 2.0,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6.w),
                        onTap: () {},
                        highlightColor: AppColor.Card_highlightColor,
                        splashColor: AppColor.Card_highlightColor,
                        child: Column(
                          children: [
                            //  ردیف اطلاعات ورود
                            SizedBox(
                               height: 40.w,
                               width: Get.width,
                               child: Row(
                                 children: [
                                   // ردبف آیکن ثبت ورود
                                   Expanded(child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 10.w, 0.h),child: Align(alignment: Alignment.centerRight,child: SvgPicture.asset(
                                       'assets/icons/cardIcon_sign_in.svg',
                                       height: 22.h,
                                       color: AppColor.Card_EditTextColor),))),
                                   //  اطلاعات ورود
                                   Expanded(child: Text(
                                     'ورود',
                                     style: TextStyle(
                                       color: AppColor.Color_TextPrimaryColor,
                                       fontSize: 12.sp,
                                     ),
                                     textAlign: TextAlign.right,
                                     textDirection: TextDirection.rtl,
                                   ),),
                                   // دات ورود
                                   Expanded(child: SvgPicture.asset(
                                     'assets/icons/CardIcon_DOT.svg',
                                     height: 5.h,
                                     alignment: Alignment.center,
                                   ),),
                                   //تاریخ ثبت ورود
                                   Expanded(child:
                                   Text(
                                     '  ${DateTime.now().toPersianDate(twoDigits: true)}',
                                     style: TextStyle(
                                         color: AppColor.Card_EditTextColor,
                                         fontSize: 12.sp,
                                       fontWeight: FontWeight.bold,
                                     ),
                                     textAlign: TextAlign.left,
                                     textDirection: TextDirection.rtl,
                                   ),
                                   ),
                                   // ساعت ثبت ورود
                                   Expanded(child:
                                   Padding(
                                     padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h),
                                     child: Text(
                                       controller.formattedDate,
                                       style: TextStyle(
                                         fontSize: 12.sp,
                                         fontWeight: FontWeight.bold,
                                         color: AppColor.Card_EditTextColor,
                                       ),
                                       textAlign: TextAlign.center,
                                       textDirection: TextDirection.rtl,
                                     ),
                                   )
                                   ),
                                 ],
                               ),
                             ),
                            // ردیف اطلاعات خروج
                            SizedBox(
                              height: 32.w,
                              width: Get.width,
                              child: Row(
                                children: [
                                  // ردبف آیکن ثبت خروج
                                  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 10.w, 0.h),child: Align(alignment: Alignment.centerRight,child: SvgPicture.asset(
                                      'assets/icons/cardIcon_sign_out.svg',
                                      height: 22.h,
                                      color: AppColor.Card_TrashTextColor),))),
                                  //  اطلاعات خروج
                                  Expanded(child: Text(
                                    'خروج',
                                    style: TextStyle(
                                      color: AppColor.Color_TextPrimaryColor,
                                      fontSize: 12.sp,
                                    ),
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                  ),),
                                  // دات خروج
                                  Expanded(child: SvgPicture.asset(
                                    'assets/icons/CardIcon_DOT.svg',
                                    height: 5.h,
                                    alignment: Alignment.center,
                                  ),),
                                  //تاریخ ثبت خروج
                                  Expanded(child: Text(
                                    '  ${DateTime.now().toPersianDate(twoDigits: true)}',
                                    style: TextStyle(
                                        color: AppColor.Card_TrashTextColor,
                                        fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.rtl,
                                  ),),
                                  // ساعت ثبت خروج
                                  Expanded(child:
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h),
                                    child: Text(
                                      controller.formattedDate,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.Card_TrashTextColor,
                                      ),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  )
                                  ),
                                ],
                              ),
                            ),
                            // جمع کارکرد و جمع درآمد
                            SizedBox(
                              height: 40.w,
                              width: Get.width,
                              child: Card(
                                margin: EdgeInsets.fromLTRB(10.w, 2.w, 10.w, 2.w),
                                color: AppColor.Card_GoldColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(7.w)),
                                  side: BorderSide(
                                    color: HexColor('#F5FAFD'),
                                    width: 0.0,
                                  ),
                                ),
                                elevation: 0.0,
                                child: InkWell(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7.w),
                                    topRight: Radius.circular(7.w),
                                    bottomRight: Radius.circular(7.h),
                                    bottomLeft: Radius.circular(7.h),
                                  ),
                                  onTap: () {
                                    // alertItemToBasketServices(context);
                                  },
                                  highlightColor:
                                  AppColor.Card_highlightColor,
                                  splashColor:
                                  AppColor.Card_highlightColor,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // ردبف آیکن ثبت خروج
                                      Expanded(child: Padding(padding: EdgeInsets.fromLTRB(0.w, 0.h, 15.w, 0.h),child: Align(alignment: Alignment.centerRight,child: SvgPicture.asset(
                                          'assets/icons/cardIcon_edit.svg',
                                          height: 18.h,
                                          color: AppColor.Color_TextPrimaryColor),))),
                                      //  اطلاعات  کارکرد و جمع درآمد
                                      Expanded(child:
                                      Text(
                                        ' کارکرد :',
                                        style: TextStyle(
                                            color: AppColor.Color_TextPrimaryColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      ),
                                      // دات  کارکرد و جمع درآمد
                                      Expanded(child:
                                      Text(
                                        '21:41:00',
                                        selectionColor: AppColor.Card_EditColor,
                                        style: TextStyle(
                                            color: AppColor.Color_TextPrimaryColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),),
                                      //تاریخ  کارکرد و جمع درآمد
                                      Expanded(child:
                                      Text(
                                        'درآمد :',
                                        style: TextStyle(
                                          color: AppColor.Color_TextPrimaryColor,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      ),
                                      // ساعت  کارکرد
                                      Expanded(child:
                                      Text(
                                        '125.000',
                                        style: TextStyle(
                                            color: AppColor.Color_TextPrimaryColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.rtl,
                                      ),
                                      ),
                                      // تومان
                                      Expanded(child:
                                      Text(
                                        'تومان',
                                        style: TextStyle(
                                          color: AppColor.Color_TextPrimaryColor,
                                          fontSize: 12.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                      ),),
                                    ],
                                  )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
