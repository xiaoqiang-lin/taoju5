/*
 * @Description: 艰巨
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-26 16:11:40
 */
// part of R;
import 'package:get/get.dart';

enum PrimaryButtonSize { defaultSize, medium, small, mini }

class CDimen {
  static CDimen _singleton = CDimen._();
  // ignore: unused_element
  CDimen._();
  factory CDimen() => _singleton;

  final double dp1 = 1;

  final double dp2 = 2;
  final double width = Get.width;
  final double height = Get.height;

  final double dp5 = 5;
  final double dp7 = 7;

  final double dp16 = 16;
  final double dp18 = 18;

  final double dp12 = 12;

  final double dp8 = 8;

  final double dp3 = 3;
  final double dp4 = 4;

  final double dp13 = 13;

  final double dp14 = 14;
  final double dp15 = 15;
  final double dp20 = 20;

  final double dp24 = 24;
  final double dp27 = 27;
  final double dp10 = 10;
  final double dp6 = 6;
  final double dp28 = 28;
  final double dp30 = 30;
  final double dp32 = 32;
  final double dp36 = 36;
  final double dp44 = 44;
  final double dp45 = 45;
  final double dp48 = 48;
  final double dp50 = 50;
  final double dp56 = 56;
  final double dp60 = 60;
  final double dp70 = 70;
  final double dp72 = 72;
  final double dp80 = 80;
  final double dp84 = 84;
  final double dp90 = 90;
  final double dp100 = 100;
  final double dp200 = 200;
  final double dp184 = 184;
  final double dp185 = 185;
  final double dp140 = 140;
  final double dp158 = 158;

  final double sp2 = 2;
  final double sp4 = 4;
  final double sp7 = 7;
  final double sp8 = 8;
  final double sp9 = 9;
  final double sp10 = 10;
  final double sp11 = 11;
  final double sp12 = 12;
  final double sp14 = 14;
  final double sp15 = 15;

  final double sp16 = 16;

  final double sp18 = 18;

  final double sp24 = 24;

  final double sp32 = 32;

  final double sp13 = 13;
}
