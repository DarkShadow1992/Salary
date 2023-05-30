import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/HexColor.dart';

class ViewTouchBotom extends StatefulWidget {
  const ViewTouchBotom({Key? key}) : super(key: key);

  @override
  State<ViewTouchBotom> createState() => _ViewTouchBottomState();
}

class _ViewTouchBottomState extends State<ViewTouchBotom> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // تنظیمات
          Container(
            alignment: Alignment.centerRight,
            child: Stack(
              children: [
                SizedBox (
                  width: 95.w,
                  height: 99.h,
                  child: Container(
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(360.w),
                              onTap: (){
                                // alertDialogLoginSuccess(context);
                              },
                              highlightColor: HexColor('#CCDEEF').withAlpha(50),
                              splashColor: HexColor('#CCDEEF').withAlpha(90),
                              child: Icon(
                                CupertinoIcons.settings_solid,
                                color: HexColor('#CCDEEF'),
                                size: 50.sp,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox (
                  width: 85.w,
                  height: 185.h,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 20.h, 8.w, 0),
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Text(
                              'تنظیمات',
                              style: TextStyle(
                                fontFamily:
                                'IRANSans_Light',
                                color: HexColor('#CCDEEF'),
                                fontSize: 13.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          // آرشیو
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                SizedBox (
                  width: 95.w,
                  height: 99.h,
                  child: Container(
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(360.w),
                              onTap: (){
                                // alertDialogLogout(context);
                              },
                              highlightColor: HexColor('#CCDEEF').withAlpha(50),
                              splashColor: HexColor('#CCDEEF').withAlpha(90),
                              child: Icon(
                                CupertinoIcons.list_bullet,
                                color: HexColor('#CCDEEF'),
                                size: 50.sp,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox (
                  width: 85.w,
                  height: 185.h,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 20.h, 8.w, 0),
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Text(
                              'آرشیو',
                              style: TextStyle(
                                fontFamily:
                                'IRANSans_Light',
                                color: HexColor('#CCDEEF'),
                                fontSize: 13.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          // بازنگری
          Container(
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                SizedBox (
                  width: 95.w,
                  height: 99.h,
                  child: Container(
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(360.w),
                              onTap: (){
                                // alertDialogLogout(context);
                              },
                              highlightColor: HexColor('#CCDEEF').withAlpha(50),
                              splashColor: HexColor('#CCDEEF').withAlpha(90),
                              child: Icon(
                                CupertinoIcons.arrow_clockwise,
                                color: HexColor('#083051'),
                                size: 50.sp,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox (
                  width: 85.w,
                  height: 185.h,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 20.h, 8.w, 0),
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: Text(
                              'بازنگری',
                              style: TextStyle(
                                fontFamily:
                                'IRANSans_Bold',
                                color: HexColor('#083051'),
                                fontSize: 13.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
