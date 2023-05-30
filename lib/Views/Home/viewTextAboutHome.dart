import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/HexColor.dart';

class ViewTextAboutHome extends StatelessWidget {
  const ViewTextAboutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 115.h, 0, 0),
      child: ClipRRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // متن درباره برنامه
              Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.fromLTRB(0.w, 250.h, 0.w, 0.w),
                child: Row(
                  children: [
                    Text(
                      style: TextStyle(
                          color: HexColor("#4788C7"),
                          fontSize: 12.sp),
                      'کلیه حقوق محفوظ است. 1401 . 2022',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
