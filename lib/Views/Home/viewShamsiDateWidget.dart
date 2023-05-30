import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../Utils/HexColor.dart';

class ViewDateTimeWidgetPersian extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(50.w, 0, 50.w, 0),
        padding: EdgeInsets.fromLTRB(0, 8.h, 0, 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.w),
          border: Border.all(color: HexColor("#E3F1FE")),
          color: HexColor('#FFFFFF'),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' تاریخ امروز :   ${DateTime.now().toPersianDate(twoDigits: true)}',
              style: TextStyle(
                  color: HexColor('#083051'),
                  fontSize: 13.sp),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ],
        )
    );
  }
}
