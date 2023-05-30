import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Utils/AllApp_Color.dart';
import '../../Utils/CustomAlerts.dart';
import '../../Utils/HexColor.dart';
import '../../Utils/colors.dart';
import '../Home/viewDrawerHome.dart';
import '../Home/viewShamsiDate.dart';
import 'BasePageController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasePage extends StatelessWidget {
  var controller = Get.put(BasePage_Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(child: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: true,
          drawerScrimColor: AppColor.Color_drawerScrimColor,
          drawerEnableOpenDragGesture: false,
          backgroundColor: AppColor.Color_HomeBackgroundColor,
          appBar: AppBar(
            title: Text('حقوق و دستمزد',
              style: TextStyle(
                  color: AppColor.Color_TextPrimaryColor,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14.sp),
            ),
            iconTheme: IconThemeData(
              color: AppColor.Color_TextPrimaryColor,
            ),
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.w),
                  bottomRight: Radius.circular(20.w),
                )
            ),
            actions: <Widget>[
              IconButton(
                icon: (
                    const Icon(CupertinoIcons.square_stack_3d_up_fill)
                ),
                color: AppColor.Color_IconPrimaryColor,
                onPressed: (){

                },
              ),
              IconButton(
                icon: (
                    const Icon(CupertinoIcons.moon_stars_fill)
                ),
                color: AppColor.Color_IconPrimaryColor,
                onPressed: (){
                },
              ),
            ],
            backgroundColor: AppColor.Color_HomeBackgroundColor,
            centerTitle: true,
          ),
          drawer: const DrawerMainHome(),
          body: SizedBox(
            child: controller.pages[controller.pageIndex.value],
            height: Get.height,
            width: Get.width,
          ),
          bottomNavigationBar: Container(
            height: 65.h,
            decoration: BoxDecoration(
              color: HexColor(controller.selectedBackColor).withOpacity(0.15),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.h),
                topLeft: Radius.circular(20.h)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexColor(controller.navIndex.value==2 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.h)
                          )
                      ),
                      width: 65.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Icon(CupertinoIcons.home,color: HexColor(controller.navIndex.value==2 ? controller.selectedColor : controller.unselectedColor))),
                          Text('خانه',style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor(controller.navIndex.value==2 ? controller.selectedColor : controller.unselectedColor)
                          )),
                          SizedBox(height: 5.h),
                        ],
                      )
                  ),
                  onTap:() {
                    controller.gotoHome();
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
                          Text('آرشیو',style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor(controller.navIndex.value==1 ? controller.selectedColor : controller.unselectedColor)
                          )),
                          SizedBox(height: 5.h),
                        ],
                      )
                  ),
                  onTap:() {
                    controller.gotoSetting();
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
                          Text('تنظیمات',style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor(controller.navIndex.value==3 ? controller.selectedColor : controller.unselectedColor)
                          )),
                          SizedBox(height: 5.h),
                        ],
                      )
                  ),
                  onTap:() async {
                    controller.gotoArchive();
                  },
                )),
                Expanded(child: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color: HexColor("FFFFFF").withOpacity(0.15),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.h)
                          )
                      ),
                      width: 65.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: SvgPicture.asset('assets/svgs/VitrinFill.svg'),),
                          Text('خروج',style: TextStyle(
                              fontSize: 11.sp,
                              color: HexColor(controller.unselectedColor)
                          )),
                          SizedBox(height: 5.h),
                        ],
                      )
                  ),
                  onTap:() {
                    controller.gotoExit();
                  },
                )),
              ],
            ),
          ),
        )
      ),
    )));
  }
}