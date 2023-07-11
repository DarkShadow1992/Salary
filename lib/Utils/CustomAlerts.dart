import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'AllApp_Color.dart';
import '../../Utils/HexColor.dart';
import 'package:get/get.dart';

alertDialogAboutApp(BuildContext context) {
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: AppColor.Color_barrierAlertDialogColor.withAlpha(220),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("درباره",
          textDirection: ui.TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            
            fontSize: 12.sp,
            color: HexColor('#212121'),
          ),
          textAlign: TextAlign.center,
        ),
        content: Text("کنترل تردد پرسنل",
          style: TextStyle(
              
              fontSize: 12.sp,
              color: HexColor('#191A1C')),
          textAlign: TextAlign.center,
          textDirection: ui.TextDirection.rtl,
        ),

        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexColor('#083051').withOpacity(0.10),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#E3ECF5'),
                  ),
                ),
                child: Text('بازگشت', style: TextStyle(
                    fontSize: 12.sp,
                    color: HexColor('#083051')
                ),)
            ),
          )
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        elevation: 5.5,
        // elevation: 5,
      );
    },
  );
}
//******************************************************************************** */
//LoginSuccess AlertDialog
alertDialogLoginSuccess(BuildContext context) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.Hm().format(now);

    // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: AppColor.Color_barrierAlertDialogColor.withAlpha(220),
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Directionality(textDirection: ui.TextDirection.rtl, child: AlertDialog(
        title: Column(
          children: <Widget>[
            Text("ثبت کارکرد روزانه",
              textDirection: ui.TextDirection.rtl,
              style: TextStyle(

                fontSize: 12.sp,
                color: AppColor.Card_EditTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Row(
          children: <Widget>[
            Text(' ثبت اطلاعات ورود: \n تاریخ : ${
                DateTime.now().toPersianDate(twoDigits: true)} \n ساعت : $formattedDate',
              style: TextStyle(
                fontWeight: ui.FontWeight.w600,
                fontSize: 12.sp,
                height: 2.0.sp,
                color: AppColor.Color_TextPrimaryColor,
              ),
              textAlign: TextAlign.start,
            ),
            Icon(
              Icons.fingerprint,
              color: AppColor.Card_EditTextColor,
              size: 25.sp,
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Get.back(result: "OK");
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexColor('#00CC99'),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#E7FFF9'),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                  ),
                ),
                child: Text('ثبت و بازگشت', style: TextStyle(

                  fontSize: 12.sp,
                  color: AppColor.Color_TextPrimaryColor,
                ),)
            ),
          )
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        elevation: 5.5,
        // elevation: 5,
      ));
    },
  );
}
//******************************************************************************** */
//PutDate AlertDialog
alertPutDateServices(BuildContext context) {
  Timer _timer;
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD'),
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      _timer = Timer(const Duration(milliseconds: 1300), () {
        Navigator.of(context).pop();
      });
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          AlertDialog(
            titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
            insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            title: Text("در حال ثبت اطلاعات",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12.w,
                  color: AppColor.Color_TextPrimaryColor
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: HexColor('#FFFFFF'),
            buttonPadding: const EdgeInsets.all(5),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            ),
            elevation: 5.5,
          ),
          SpinKitThreeBounce(
            color: AppColor.Card_EditTextColor,
            size: 20.0,
            duration: const Duration(milliseconds: 950),
          ),
        ],
      );
    },
  );
}
//******************************************************************************** */
//PopDate AlertDialog
alertPopDateServices(BuildContext context) {
  Timer _timer;
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD'),
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      _timer = Timer(const Duration(milliseconds: 1300), () {
        Navigator.of(context).pop();
      });
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          AlertDialog(
            titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
            insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            title: Text("در حال ثبت خروجی",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  
                  fontSize: 12.w,
                  color: AppColor.Color_TextPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: HexColor('#FFFFFF'),
            buttonPadding: const EdgeInsets.all(5),
            elevation: 5.5,
          ),
          SpinKitThreeBounce(
            color: AppColor.Card_TrashTextColor,
            size: 20.0,
            duration: const Duration(milliseconds: 950),
          ),
        ],
      );
    },
  );
}
//******************************************************************************** */
//LogoutSuccess AlertDialog
alertDialogLogout(BuildContext context) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat.Hm().format(now);

  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: AppColor.Color_barrierAlertDialogColor.withAlpha(220),
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return Directionality(textDirection: ui.TextDirection.rtl, child: AlertDialog(
        title: Text("خروج از کارکرد",
          textDirection: ui.TextDirection.rtl,
          style: TextStyle(

            fontSize: 12.sp,
            color: AppColor.Card_TrashTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        content: Row(
          children: <Widget>[
            Text(' ثبت اطلاعات خروج: \n تاریخ : ${
                DateTime.now().toPersianDate(twoDigits: true)} \n ساعت : $formattedDate',
              style: TextStyle(

                fontWeight: ui.FontWeight.w600,
                fontSize: 12.sp,
                height: 2.1.sp,
                color: HexColor('#191A1C'),
              ),
              textAlign: TextAlign.start,
              textDirection: ui.TextDirection.rtl,
            ),
            Icon(
              Icons.fingerprint,
              color: AppColor.Card_TrashTextColor,
              size: 25.sp,
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexColor('#E1618B'),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#F9E1E9'),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                  ),
                ),
                child: Text('ثبت و بازگشت', style: TextStyle(

                    fontSize: 12.sp,
                    color: HexColor('#083051')
                ),)
            ),
          )
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        elevation: 5.5,
        // elevation: 5,
      ));
    },
  );
}
//******************************************************************************** */
//Search not data App AlertDialog
alertDialogSearchNoData(BuildContext context) {
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD').withOpacity(0.95),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("خو دی نزن...!",
          textDirection: ui.TextDirection.rtl,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            
            fontSize: 12.sp,
            color: HexColor('#212121'),
          ),
          textAlign: TextAlign.center,
        ),
        content: Text("همش در حال کنجکاوی باش...!.",
          style: TextStyle(
              
              fontSize: 12.sp,
              color: HexColor('#191A1C')),
          textAlign: TextAlign.justify,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#4788C7'),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15)
                  ),
                ),
                child: Text('بازگشت', style: TextStyle(
                    
                    fontSize: 12.sp,
                    color: HexColor('#FFFFFF')
                ),)
            ),
          )
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        elevation: 25.55,
        // elevation: 5,
      );
    },
  );
}
//******************************************************************************** */
//Search not data App AlertDialog
alertDialogNoNotifications(BuildContext context) {
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD').withOpacity(0.79),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("اعلان برنامه",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            
            fontSize: 12.sp,
            color: HexColor('#191A1C'),
          ),
          textAlign: TextAlign.center,
        ),
        content: Text("هیچ اطلاعیه ای برای شما وجود ندارد. ",
          style: TextStyle(
              
              fontSize: 12.sp,
              color: HexColor('#191A1C')),
          textAlign: TextAlign.justify,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child:  TextButton(
              autofocus: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                backgroundColor: MaterialStateProperty.all<Color>(
                  HexColor('#E85C07'),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 15)
                ),
              ),
              child: Text('بازگشت',
                style: TextStyle(
                  
                  fontSize: 12.sp,
                  color: HexColor('#FFFFFF'),
                ),),
            ),
          )
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        elevation: 55.55,
        // elevation: 5,
      );
    },
  );
}
//******************************************************************************** */
//Success AlertDialog ThemeProvider
alertDialogThemeProvider(BuildContext context) {
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#6574CF').withAlpha(150),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("پوسته برنامه",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                
                fontSize: 18,
                color: HexColor('#111258')),
          textAlign: TextAlign.center,
        ),
        content: Text(" حالت روشن و تیره به زودی در برنامه قرار خواهد گرفت.",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                
                fontSize: 17,
                color: HexColor('#111258')),
          textAlign: TextAlign.justify,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
              alignment: Alignment.center,
            ),
            child: Text('بازگشت', style: TextStyle(
                
                fontSize: 18,
                color: HexColor('#6574CF')
            ),),
          ),
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        elevation: 0.55,
        // elevation: 5,
      );
    },
  );
}
//******************************************************************************** */
//Exit App AlertDialog
alertDialogExitApp(BuildContext context) {
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD').withOpacity(0.95),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("خروج از برنامه",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              
              fontSize: 12.sp,
              color: HexColor('#111258')),
          textAlign: TextAlign.center,
        ),
        content: Text("آیا ادامه می دهید؟",
          style: TextStyle(
              
              fontSize: 12.sp,
              color: HexColor('#191A1C')),
          textAlign: TextAlign.justify,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#083051'),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15)
                  ),
                ),
                child: Text('آری',
                  style: TextStyle(
                    
                    fontSize: 12.sp,
                    color: HexColor('#FFFFFF'),
                  ),)
            ),
          ),
          SizedBox(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  overlayColor: MaterialStateProperty.all<Color>(
                    HexColor('#083051'),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    HexColor('#083051'),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15)
                  ),
                ),
                child: Text('خیر',
                  style: TextStyle(
                    
                    fontSize: 12.sp,
                    color: HexColor('#FFFFFF'),
                  ),)
            ),
          )
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        elevation: 5.5,
        // elevation: 5,
      );
    },
  );
}
//******************************************************************************** */
//Exit App Questiuon AlertDialog
alertDialogQuestionExitApp(BuildContext context) {
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD').withOpacity(0.95),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("خروج از برنامه",
          style: TextStyle(
              
              fontSize: 12.sp,
              color: HexColor('#111258')),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        content: Text("آیا ادامه می دهید؟",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              
              fontSize: 12.sp,
              color: HexColor('#191A1C')),
          textAlign: TextAlign.center,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: ui.TextDirection.rtl,
            children: [
              TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    overlayColor: MaterialStateProperty.all<Color>(
                      HexColor('#083051').withOpacity(0.10),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      HexColor('#E3ECF5'),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 5)
                    ),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text('آری',
                    style: TextStyle(
                      
                      fontSize: 12.sp,
                      color: HexColor('#083051'),
                    ),
                  )
              ),
              TextButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    overlayColor: MaterialStateProperty.all<Color>(
                      HexColor('#083051').withOpacity(0.10),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      HexColor('#E3ECF5'),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 5)
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('خیر',
                    style: TextStyle(
                      
                      fontSize: 12.sp,
                      color: HexColor('#083051'),
                    ),
                  )
              ),
            ],
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        elevation: 5.5,
        // elevation: 5,
      );
    },
  );
}
//******************************************************************************** */
//Search not data App AlertDialog
alertDialogBlankData(BuildContext context) async => showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#6574CF').withAlpha(150),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("عملیات ناموفق",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 13,
                color: Color(0xFF9A0024)),
          textAlign: TextAlign.center,
        ),
        content: const Text("وارد کردن مبلغ دستمزد الزامیست.",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Color(0xFF9A0024)),
          textAlign: TextAlign.justify,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
              alignment: Alignment.center,
            ),
            child: Text('بازگشت', style: TextStyle(
                fontSize: 11,
                color: HexColor('#6574CF')
            ),),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            style: const ButtonStyle(
                alignment: Alignment.center
            ),
            child:Text('خروج از برنامه', style: TextStyle(
                fontWeight: FontWeight.w800,

                fontSize: 11,
                color: HexColor('#6574CF')
            ),),
          ),
        ],
        backgroundColor: HexColor('#FFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        elevation: 0.55,
        // elevation: 5,
      );
    },
  );
//******************************************************************************** */
//Success AlertDialog AddMoney
alertDialogSuccessAddMoney(BuildContext context) async => showDialog(
  barrierDismissible: false,
  barrierColor: AppColor.Color_barrierAlertDialogColor.withAlpha(220),
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text("عملیات موفق",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: Color(0xFF00DCBE)),
        textAlign: TextAlign.center,
      ),
      content: const Text("ثبت هزینه با موفقیت انجام شد.",
        style: TextStyle(
            height: 2,
            fontWeight: FontWeight.w900,
            color: Color(0xFF083051),
            fontSize: 14,
        ),
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.rtl,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: () {
                Get.back(result: "OK");
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                overlayColor: MaterialStateProperty.all<Color>(
                  HexColor('#00CC99'),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  HexColor('#E7FFF9'),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                ),
              ),
              child: Text('ثبت و بازگشت', style: TextStyle(
                fontSize: 12.sp,
                color: AppColor.Color_TextPrimaryColor,
              ),)
          ),
        )
      ],
      backgroundColor: HexColor('#FFFFFF'),
      buttonPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      elevation: 5.5,
      // elevation: 5,
    );
  },
);
//******************************************************************************** */
//Danger AlertDialog Empty AddMoney
alertDialogNotEmptyMoney(BuildContext context) async => showDialog(
  barrierDismissible: false,
  barrierColor: AppColor.Color_barrierAlertDialogColor.withAlpha(220),
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text("عملیات ناموفق",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: Color(0xFFD9366C)),
        textAlign: TextAlign.center,
      ),
      content: const Text("لطفاً مبلغ هزینه را وارد نمایید.",
        style: TextStyle(
          height: 2,
          fontWeight: FontWeight.w900,
          color: Color(0xFF083051),
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.rtl,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: () {
                Get.back(result: "OK");
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                overlayColor: MaterialStateProperty.all<Color>(
                  HexColor('#E1618B'),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  HexColor('#F9E1E9'),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                ),
              ),
              child: Text('بازگشت', style: TextStyle(

                  fontSize: 12.sp,
                  color: HexColor('#083051')
              ),)
          ),
        )
      ],
      backgroundColor: HexColor('#FFFFFF'),
      buttonPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      elevation: 5.5,
      // elevation: 5,
    );
  },
);
//******************************************************************************** */
//Danger AlertDialog Empty AddMoney
alertDialogNotErrorLogOut(BuildContext context) async => showDialog(
  barrierDismissible: false,
  barrierColor: AppColor.Color_barrierAlertDialogColor.withAlpha(220),
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title:  Text("عملیات ناموفق",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14.sp,
            color: const Color(0xFFD9366C)),
        textAlign: TextAlign.center,
      ),
      content: const Text("لطفاً ابتدا ثبت ورود خود را انجام دهید.",
        style: TextStyle(
          height: 2,
          fontWeight: FontWeight.w900,
          color: Color(0xFF083051),
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.rtl,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                alignment: Alignment.center,
                overlayColor: MaterialStateProperty.all<Color>(
                  HexColor('#E1618B'),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  HexColor('#F9E1E9'),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
                ),
              ),
              child: Text('بازگشت', style: TextStyle(

                  fontSize: 12.sp,
                  color: HexColor('#083051')
              ),)
          ),
        )
      ],
      backgroundColor: HexColor('#FFFFFF'),
      buttonPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      elevation: 5.5,
      // elevation: 5,
    );
  },
);
//******************************************************************************** */
//Success AlertDialog
alertDialogSuccessRegister(BuildContext context) async => showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#6574CF').withAlpha(150),
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("ثبت نام",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 11,
              color: Color(0xFF088471)),
          textAlign: TextAlign.center,
        ),
        content: const Text("حساب کاربری شما با موفقیت ایجاد شد.\nنام کاربری شما، کد ملی شماست.",
          style: TextStyle(
              height: 2,
              fontWeight: FontWeight.w600,
              fontSize: 11,
              color: Color(0xFF088471)),
          textAlign: TextAlign.justify,
          textDirection: ui.TextDirection.rtl,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
              alignment: Alignment.center,
            ),
            child: Text('بازگشت', style: TextStyle(

                fontSize: 11,
                color: HexColor('#6574CF')
            ),),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            style: const ButtonStyle(
                alignment: Alignment.center
            ),
            child:Text('خروج از برنامه', style: TextStyle(
                fontWeight: FontWeight.w800,

                fontSize: 11,
                color: HexColor('#6574CF')
            ),),
          ),
        ],
        backgroundColor: HexColor('#FFFFFF'),
        buttonPadding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        elevation: 0.55,
        // elevation: 5,
      );
    },
  );
//******************************************************************************** */
//GetServerServices AlertDialog
alertGetServerServices(BuildContext context) {
  Timer timer;
  // show the alert dialog
  showDialog(
    barrierDismissible: false,
    barrierColor: HexColor('#F5FAFD').withOpacity(0.79),
    context: context,
    builder: (BuildContext context) {
      timer = Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          AlertDialog(
            titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 70),
            insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            title: Text("افزودن به سبد خرید",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  
                  fontSize: 12.sp,
                  color: HexColor('#191A1C')),
              textAlign: TextAlign.center,
            ),
            backgroundColor: HexColor('#FFFFFF'),
            buttonPadding: const EdgeInsets.all(10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            elevation: 55.55,
            // elevation: 5,
          ),
          SpinKitThreeBounce(
            color: HexColor('#2C9700'),
            size: 20.0,
            duration: const Duration(milliseconds: 750),
          ),
        ],
      );
    },
  );
}
//******************************************************************************** */


