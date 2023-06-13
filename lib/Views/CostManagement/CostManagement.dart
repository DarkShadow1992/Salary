import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/AllApp_Color.dart';
import '../../Utils/HexColor.dart';
import '../../Utils/MaskedTextController.dart';
import 'CostManagementController.dart';
import 'package:flutter/services.dart';

class CostManagement extends StatelessWidget {
  var controller = Get.put(CostManagement_Controller());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //تنظیمات عمومی
        Container(
            margin: EdgeInsets.fromLTRB(0.w, 10.h, 16.w, 10.h),
            alignment: Alignment.centerRight,
            child: Text(
              'تنظیمات عمومی',
              style: TextStyle(
                color: AppColor.Color_GrayColor,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.right,
            )),
        SizedBox(height: 15.h,),
        Row(
          children: [
            SizedBox(width: 18.w),
            Expanded(flex: 60, child: Container(
              height: 50.h,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.h)),
                  border: Border.all(
                      color: HexColor("4788C7").withOpacity(.5)
                  )
              ),
              child: TextField(
                controller: controller.txtController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.sp, color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.h),
                    borderSide: BorderSide(
                        color: HexColor("#243841").withAlpha(26)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.h),
                    borderSide: BorderSide(
                        color: HexColor("#243841").withAlpha(26)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.h),
                    borderSide: BorderSide(
                        color: HexColor("#243841").withAlpha(26)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.h),
                    borderSide: BorderSide(
                        color: HexColor("#243841").withAlpha(26)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.h),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  hintText: "مبلغ خود را وارد نمایید",
                  hintStyle: TextStyle(
                    color: HexColor("CCDEEF"),
                    fontSize: 13.sp
                  ),
                ),
                textDirection: TextDirection.rtl,
                onTap: () {

                },
                onChanged: (string) {
                  string = controller.formatNumber(string.replaceAll(',', ''));
                  controller.txtController.value = TextEditingValue(
                    text: string,
                    selection: TextSelection.collapsed(offset: string.length),
                  );
                },
              )
            )),
            SizedBox(width: 10.w),
            Expanded(flex: 20, child: Container(
              height: 50.h,
              width: Get.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: HexColor("E5F1FC"),
                  borderRadius: BorderRadius.all(Radius.circular(6.h)),

              ),
              child: Text('ثبت'),
            )),
            SizedBox(width: 18.w),
          ],
        )
      ],
    );
  }
}