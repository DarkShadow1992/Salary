import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salary/Utils/CustomAlerts.dart';
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
        //مبلغ هر ساعت (تومان)
        Container(
            margin: EdgeInsets.fromLTRB(0.w, 10.h, 16.w, 10.h),
            alignment: Alignment.centerRight,
            child: Text(
              'مبلغ هر ساعت (تومان)',
              style: TextStyle(
                color: AppColor.Color_GrayColor,
                fontSize: 13.sp,
              ),
              textAlign: TextAlign.right,
            )),
        SizedBox(height: 15.h,),
        Row(
          children: [
            SizedBox(width: 15.w),
            Expanded(flex: 60, child: Container(
              height: 45.h,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.h)),
                  border: Border.all(
                      color: AppColor.Card_EditColor
                  )
              ),
              child: TextField(
                controller: controller.txtController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.sp, color: AppColor.Color_TextPrimaryColor),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.w),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
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
            Expanded(
                flex: 15,
                child: InkWell(
                    borderRadius: BorderRadius.circular(6.w),
                    onTap: () {
                       controller.insertMoney();
                    },
                    highlightColor: AppColor.Card_highlightColor,
                    splashColor: AppColor.Card_highlightColor,
                  child: Container(
                    height: 45.h,
                    width: Get.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.Card_GreenLightColor,
                      borderRadius: BorderRadius.all(Radius.circular(6.h)),
                    ),
                    child: const Text('ثبت',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  )
                )),
            SizedBox(width: 18.w),
          ],
        )
      ],
    );
  }
}