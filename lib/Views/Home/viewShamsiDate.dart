import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../Utils/AllApp_Color.dart';
import '../../Utils/HexColor.dart';

class ViewDateTimePersian extends StatelessWidget {
  const ViewDateTimePersian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.w),
        border: Border.all(color: HexColor("#E3F1FE")),
        color: HexColor('#FFFFFF'),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 8.w, 0, 8.w),
            child: Row(
              children: [
                Text('امروز :    ',
                  style: TextStyle(
                      color: HexColor('#083051'),
                      fontSize: 13.sp),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  DateTime.now().toPersianDateStr(
                    showDayStr: true,
                  ),
                  style: TextStyle(
                      color: AppColor.Card_EditTextColor,
                      fontSize: 13.sp),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
