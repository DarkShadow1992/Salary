import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Utils/HexColor.dart';
import '../../Utils/colors.dart';
import '../../Utils/dialogs.dart';
import '../Home/HomeController.dart';
import 'BasePageController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BasePage extends StatelessWidget {
  var controller = Get.put(BasePage_Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(child: Scaffold(
        resizeToAvoidBottomInset: controller.isAvoid.value,
        endDrawer: Drawer(
          width: 100.w,
          backgroundColor: Colors.red,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              child: controller.pages[controller.pageIndex.value],
              height: Get.height,
              width: Get.width,
            ),
            Visibility(
                visible: controller.appbarVIS.value,
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("F2F9FF").withOpacity(.65),
                            blurRadius: 10.h, // soften the shadow
                            spreadRadius: 1.h, //extend the shadow
                            offset: Offset(
                              0.h,
                              0.h,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: HexColor("F2F9FF"),
                      height: 70.h,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 5.w),child: Align(alignment: Alignment.centerLeft, child: SvgPicture.asset('assets/svgs/edit.svg',width: 20.w)),),
                          Padding(padding: EdgeInsets.only(left: 40.w),child: Align(alignment: Alignment.centerLeft, child: SvgPicture.asset('assets/svgs/settings.svg',color: HexColor("083051"),width: 20.w)),),
                          Align(alignment: Alignment.center,child: Text('مدیریت حقوق و دستمزد',textAlign: TextAlign.center,style: TextStyle(fontSize: 15.sp,color: HexColor(primaryText))),),
                          Padding(padding: EdgeInsets.only(right: 5.w),child: Align(alignment: Alignment.centerRight, child:SvgPicture.asset('assets/svgs/Menu.svg',width: 20.w)),),
                          SizedBox(width: 10.w),
                            ],
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Visibility(
                  visible: controller.navbarVIS.value,
                  child: Stack(
                    children: [
                      Container(
                        width: Get.width,
                        height: 65.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: HexColor("727272").withOpacity(.50),
                              blurRadius: 10.h, // soften the shadow
                              spreadRadius: 1.h, //extend the shadow
                              offset: Offset(
                                0.h,
                                0.h,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 65.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: GestureDetector(
                              child: Container(
                                  color: HexColor(controller.navIndex.value==5 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                                  width: 65.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: SvgPicture.asset(controller.navIndex.value==5 ? 'assets/svgs/ProfileFill.svg' : 'assets/svgs/Profile.svg',height: 30.h),),
                                      Text('پروفایل',style: TextStyle(
                                          fontSize: 11.sp,
                                          color: HexColor(controller.navIndex.value==5 ? controller.selectedColor : controller.unselectedColor)
                                      )),
                                      SizedBox(height: 5.h),
                                    ],
                                  )
                              ),
                              onTap:() {

                              },
                            )),
                            Expanded(child: GestureDetector(
                              child: Container(
                                  color: HexColor(controller.navIndex.value==4 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                                  width: 65.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: SvgPicture.asset(controller.navIndex.value==4 ? 'assets/svgs/marketFill.svg' : 'assets/svgs/market.svg',height: 30.h),),
                                      Text('بازار',style: TextStyle(
                                          fontSize: 11.sp,
                                          color: HexColor(controller.navIndex.value==4 ? controller.selectedColor : controller.unselectedColor)
                                      )),
                                      SizedBox(height: 5.h),
                                    ],
                                  ),
                              ),
                              onTap:() async {

                              },
                            )),
                            Expanded(child: GestureDetector(
                              child: Container(
                                  color: HexColor(controller.navIndex.value==3 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                                  width: 65.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: SvgPicture.asset(controller.navIndex.value==3 ? 'assets/svgs/OrderFill.svg' : 'assets/svgs/AddPrd.svg',height: 30.h),),
                                      Text('افزودن محصول',style: TextStyle(
                                          fontSize: 11.sp,
                                          color: HexColor(controller.navIndex.value==3 ? controller.selectedColor : controller.unselectedColor)
                                      )),
                                      SizedBox(height: 5.h),
                                    ],
                                  )
                              ),
                              onTap:() async {

                              },
                            )),
                            Expanded(child: GestureDetector(
                              child: Container(
                                  color: HexColor(controller.navIndex.value==2 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                                  width: 65.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: SvgPicture.asset(controller.navIndex.value==2 ? 'assets/svgs/CustomerClubfill.svg' : 'assets/svgs/CustomerClub.svg',height: 40.h),),
                                      Text('باشگاه مشتریان',style: TextStyle(
                                          fontSize: 11.sp,
                                          color: HexColor(controller.navIndex.value==2 ? controller.selectedColor : controller.unselectedColor)
                                      )),
                                      SizedBox(height: 5.h),
                                    ],
                                  )
                              ),
                              onTap:() {

                              },
                            )),
                            Expanded(child: GestureDetector(
                              child: Container(
                                  color: HexColor(controller.navIndex.value==1 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                                  width: 65.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: SvgPicture.asset(controller.navIndex.value==1 ?  'assets/svgs/VitrinFill.svg' : 'assets/svgs/Vitrin.svg'),),
                                      Text('ویترین',style: TextStyle(
                                          fontSize: 11.sp,
                                          color: HexColor(controller.navIndex.value==1 ? controller.selectedColor : controller.unselectedColor)
                                      )),
                                      SizedBox(height: 5.h),
                                    ],
                                  )
                              ),
                              onTap:() {

                              },
                            )),
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ))));
  }
}