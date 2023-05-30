import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_scroll_glow/no_scroll_glow.dart';

import '../../Utils/CustomAlerts.dart';
import '../../Utils/HexColor.dart';

class DrawerMainHome extends StatelessWidget {
  const DrawerMainHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ClipRRect(
          child: Drawer(
              child: NoScrollGlow(
                  child: Material(
                    color: HexColor('#CCDEEF').withOpacity(0.50),
                    child: ListView(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter, //aligns to topCenter.
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                alertDialogAboutApp(context);
                              },
                              child: CircleAvatar(
                                minRadius: 28.0,
                                maxRadius: 28.0,
                                backgroundColor: Colors.transparent,
                                child: Image.asset('assets/logo/logo.png'),
                              ),
                            ),
                          ),// ,
                        ),
                        //***************************************************************** */
                        ListTile(
                          leading: Icon(
                              (CupertinoIcons.time),
                              color: HexColor('#4788C7')
                          ),
                          onTap: () {
                            // alertDialogSearchNoData(context);
                          },
                          // subtitle: Text('ورود به حساب کاربری در برنامه',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.w400,
                          //         fontSize: 12.sp,
                          //         
                          //         color: HexColor('#191A1C'))),
                          title: Text('ثبت ورود و خروج',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        ListTile(
                          leading: Icon(
                              CupertinoIcons.pencil_circle,
                              color: HexColor('#4788C7')
                          ),
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => LoginPage(),
                            //   ),
                            // );
                          },
                          title: Text('ثبت دستی',
                              style: TextStyle(
                                
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                              (CupertinoIcons.list_bullet),
                              color: HexColor('#4788C7')
                          ),
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (_) => LoginPage(),
                            //   ),
                            // );
                          },
                          title: Text('ماه جاری',
                              style: TextStyle(
                                
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        ListTile(
                          leading: Icon(
                              CupertinoIcons.archivebox,
                              color: HexColor('#4788C7')
                          ),
                          onTap: () {},
                          title: Text('آرشیو ماه ها',
                              style: TextStyle(
                                
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                              CupertinoIcons.settings,
                              color: HexColor('#4788C7')
                          ),
                          onTap: () {},
                          title: Text('تنظیمات',
                              style: TextStyle(
                                
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                              CupertinoIcons.square_line_vertical_square_fill,
                              color: HexColor('#4788C7')
                          ),
                          onTap: () {},
                          title: Text('گزارش خطا',
                              style: TextStyle(
                                
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        ListTile(
                          leading: Icon(
                              CupertinoIcons.text_bubble,
                              color: HexColor('#4788C7')
                          ),
                          // onTap: () {Navigator.of(context).pop(true);},
                          onTap: () {
                            alertDialogAboutApp(context);
                          },
                          title: Text('درباره',
                              style: TextStyle(
                                
                                fontSize: 12.sp,
                                color: HexColor('#083051'),
                              )),
                        ),
                        ListTile(
                          title: Text('مدیریت حقوق و دستمزد',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: HexColor('#083051'),),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        ListTile(
                          title: Text('02.01.22-beta.69',
                            style: TextStyle(
                              
                              fontSize: 10.sp,
                              color: HexColor('#083051'),),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                        //***************************************************************** */
                      ],
                    ),
                  )
              )
          ),
      ),
    );
  }
}
