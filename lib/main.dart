import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Utils/AllApp_Color.dart';
import 'Utils/HexColor.dart';
import 'mainController.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: HexColor("000000"),
    statusBarColor: HexColor("000000"),
    statusBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Splash());
}

class Splash extends StatelessWidget {
  var controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context,i) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "IRANSansMedium"),
            builder: EasyLoading.init(),
            home: Container(
              color: HexColor("E5F1FC"),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svgs/time_limit.svg',width: 100.w),
                  SizedBox(height: 30.h,),
                  Text('کنترل تردد پرسنل',style: TextStyle(
                    color: HexColor("4788C7"),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp
                  ),),
                  SizedBox(height: 20.h,),
                  Text('نسخه آزمایشی',style: TextStyle(
                    color: AppColor.Color_TextPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp
                  ),)
              ],
              ),
            )),);
  }
}