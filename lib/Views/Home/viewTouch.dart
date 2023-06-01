import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/AllApp_Color.dart';
import '../../Utils/CustomAlerts.dart';

class ViewTouchContentHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ورود به شرکت
        Container(
          margin: EdgeInsets.fromLTRB(40.w, 0.h, 40.w, 0.w),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(360.w),
                    onTap: (){
                      alertPutDateServices(context);
                      Future.delayed(const Duration(seconds: 2), () {
                        alertDialogLoginSuccess(context);
                      });
                    },
                    highlightColor: AppColor.Color_TouchSinginhighlightColor.withAlpha(25),
                    splashColor: AppColor.Color_TouchSinginSplashColor.withAlpha(40),
                    child: Icon(
                      Icons.fingerprint,
                      color: AppColor.Card_EditTextColor,
                      size: 100.sp,
                    ),
                  ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    'ورود',
                    style: TextStyle(
                      color: AppColor.Color_TextPrimaryColor,
                      fontSize: 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
              ),
            ],
          ),
        ),
        // خروج از شرکت
        Container(
          margin: EdgeInsets.fromLTRB(40.w, 0.h, 40.w, 0.w),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  borderRadius: BorderRadius.circular(360.w),
                  onTap: (){
                    alertPutDateServices(context);
                    Future.delayed(const Duration(seconds: 2), () {
                      alertDialogLogout(context);
                    });
                  },
                  highlightColor: AppColor.Color_TouchSinginhighlightColor.withAlpha(25),
                  splashColor: AppColor.Color_TouchSinginSplashColor.withAlpha(40),
                  child: Icon(
                    Icons.fingerprint,
                    color: AppColor.Card_TrashSplashColor,
                    size: 100.sp,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
                alignment: Alignment.center,
                child: Text(
                  'خروج',
                  style: TextStyle(
                    color: AppColor.Color_TextPrimaryColor,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
