import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/HexColor.dart';

class ViewTextFieldDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w),
              margin: EdgeInsets.fromLTRB(50.w, 8.w, 50.w, 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                border: Border.all(color: HexColor("#E3F1FE")),
                color: HexColor('#FFFFFF'),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                keyboardType: TextInputType.multiline,
                autocorrect: true,
                maxLines: 8,
                maxLength: 255,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                decoration: InputDecoration(
                  hintText: "توضیحات (دلخواه)",
                  hintTextDirection: TextDirection.rtl,
                  counterStyle: TextStyle(
                      color: HexColor("#B8B8B8"),
                      fontSize: 12.sp),
                  contentPadding: const EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: HexColor("#B8B8B8"),
                      fontSize: 12.sp),
                  fillColor: HexColor('#FFFFFF'),
                ),
                style: TextStyle(
                    color: HexColor('#083051'),
                    fontSize: 12.sp),
              ),
            )
        ),
      ],
    );
  }
}