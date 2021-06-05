/*
 * @Description: 艰巨
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-06-02 17:31:40
 */
// part of R;
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PrimaryButtonSize { defaultSize, medium, small, mini }

class CDimen {
  static CDimen _singleton = CDimen._();
  // ignore: unused_element
  CDimen._();
  factory CDimen() => _singleton;

  final double dp1 = 1.h;

  final double dp2 = 2.h;
  final double width = Get.width;
  final double height = Get.height;

  final double dp5 = 5.w;
  final double dp7 = 7.w;

  final double dp160 = 160.w;
  final double dp165 = 165.w;
  final double dp16 = 16.w;

  final double dp18 = 18.h;

  final double dp12 = 12.w;

  final double dp8 = 8.w;

  final double dp3 = 3.w;
  final double dp4 = 4.w;

  final double dp13 = 13.w;

  final double dp14 = 14.w;
  final double dp15 = 15.w;
  final double dp20 = 20.w;
  final double dp22 = 22.w;
  final double dp24 = 24.w;
  final double dp27 = 27.w;
  final double dp10 = 10.w;
  final double dp17 = 17.w;
  final double dp9 = 9.w;
  final double dp108 = 108.h;
  final double dp6 = 6.w;
  final double dp25 = 25.w;
  final double dp28 = 28.h;
  final double dp30 = 30.h;
  final double dp32 = 32.h;
  final double dp36 = 36.h;
  final double dp40 = 40.h;
  final double dp44 = 44.h;
  final double dp45 = 45.h;
  final double dp48 = 48.h;
  final double dp50 = 50.w;
  final double dp56 = 56.w;
  final double dp57 = 57.h;
  final double dp60 = 60.h;
  final double dp68 = 68.h;
  final double dp64 = 64.w;
  final double dp70 = 70.h;
  final double dp72 = 72.h;
  final double dp75 = 75.h;
  final double dp80 = 80.w;
  final double dp84 = 84.w;
  final double dp85 = 85.w;
  final double dp90 = 90.w;
  final double dp100 = 100.h;
  final double dp132 = 132.h;
  final double dp200 = 200.h;

  final double dp128 = 128.w;
  final double dp184 = 184.h;
  final double dp185 = 185.h;
  final double dp140 = 140.h;
  final double dp280 = 280.h;
  final double dp158 = 158.h;

  final double sp2 = 2.sp;
  final double sp4 = 4.sp;
  final double sp7 = 7.sp;
  final double sp8 = 8.sp;
  final double sp9 = 9.sp;
  final double sp10 = 10.sp;
  final double sp11 = 11.sp;
  final double sp12 = 12.sp;
  final double sp14 = 14.sp;
  final double sp15 = 15.sp;

  final double sp16 = 16.sp;

  final double sp18 = 18.sp;

  final double sp24 = 24.sp;

  final double sp32 = 32.sp;

  final double sp3 = 3.sp;

  final double sp5 = 5.sp;
  final double sp30 = 30.sp;
  final double sp20 = 20.sp;

  final double sp13 = 13.sp;
}
