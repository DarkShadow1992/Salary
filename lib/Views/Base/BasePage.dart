import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Utils/AllApp_Color.dart';
import '../../Utils/HexColor.dart';
import '../Home/viewDrawerHome.dart';
import 'BasePageController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            title: Text(controller.textHeader.value,
              style: TextStyle(
                  color: AppColor.Color_TextPrimaryColor,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp),
            ),
            iconTheme: IconThemeData(
              color: AppColor.Color_TextPrimaryColor,
            ),
            elevation: 0.0,
            toolbarHeight: 70.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.h),
                  bottomRight: Radius.circular(30.h),
                )
            ),
            actions: <Widget>[
              controller.pageIndex.value==0 ? IconButton(
                icon: const Icon(CupertinoIcons.moon_stars_fill),
                color: AppColor.Color_IconPrimaryColor,
                padding: const EdgeInsets.only(left: 15.0),
                onPressed: (){
                  print("A");
                  //Get.changeTheme(Themes.dark);
                },
              ) : IconButton(
                icon: const Icon(CupertinoIcons.chevron_back),
                color: AppColor.Color_IconPrimaryColor,
                padding: const EdgeInsets.only(left: 15.0),
                onPressed: (){
                  controller.backPages();
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
            height: 60.h,
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
                              fontSize: 12.sp,
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
                      color: HexColor(controller.navIndex.value==3 ? controller.selectedBackColor : "FFFFFF").withOpacity(0.15),
                      width: 65.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Expanded(child: SvgPicture.asset(controller.navIndex.value==1 ?  'assets/svgs/VitrinFill.svg' : 'assets/svgs/Vitrin.svg'),),
                          Expanded(child: Icon(CupertinoIcons.archivebox,color: HexColor(controller.navIndex.value==3 ? controller.selectedColor : controller.unselectedColor))),
                          Text('آرشیو',style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor(controller.navIndex.value==3 ? controller.selectedColor : controller.unselectedColor)
                          )),
                          SizedBox(height: 5.h),
                        ],
                      )
                  ),
                  onTap:() {
                    controller.gotoArchive();
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
                          Expanded(child: Icon(CupertinoIcons.settings,color: HexColor(controller.navIndex.value==4 ? controller.selectedColor : controller.unselectedColor))),
                          Text('تنظیمات',style: TextStyle(
                              fontSize: 12.sp,
                              color: HexColor(controller.navIndex.value==4 ? controller.selectedColor : controller.unselectedColor)
                          )),
                          SizedBox(height: 5.h),
                        ],
                      )
                  ),
                  onTap:() async {
                    controller.gotoSetting();
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
                          Expanded(child: Icon(CupertinoIcons.clear_circled_solid, color: HexColor("D9366C"))),
                          Text('خروج',style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight:  FontWeight.bold,
                              color: HexColor(controller.selectExitColor)
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