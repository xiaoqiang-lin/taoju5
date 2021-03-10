/*
 * @Description: 自定义图标
 * @Author: iamsmiling
 * @Date: 2020-12-23 16:39:25
 * @LastEditTime: 2021-02-01 14:20:14
 */

import 'package:flutter/material.dart';

class BIcons {
  static const IconData prev = _XIconData(0xe643);

  static const IconData cart = _XIconData(0xe67c);

  static const IconData del = _XIconData(0xe644);

  static const IconData clear = _XIconData(0xe65e);
  static const IconData plus_blank = _XIconData(0xe693);
  static const IconData plus_full = _XIconData(0xe6bd);
  static const IconData sub_blank = _XIconData(0xe67a);
  static const IconData sub_full = _XIconData(0xe678);
  static const IconData plus_no_outline = _XIconData(0xe6a3);
  static const IconData sub_no_outline = _XIconData(0xe684);
  static const IconData search = _XIconData(0xe64a);
  static const IconData add = _XIconData(0xe64d);
  static const IconData plus = _XIconData(0xe602);
  static const IconData substract = _XIconData(0xe676);

  static const IconData drop_down = _XIconData(0xe604);
  static const IconData close = _XIconData(0xe60a);
  static const IconData eye_close = _XIconData(0xe627);

  static const IconData scan = _XIconData(0xe606);
  static const IconData check = _XIconData(0xe6e5);
  static const IconData user_add = _XIconData(0xe64b);
  static const IconData like = _XIconData(0xe79d);
  static const IconData tel_book = _XIconData(0xe667);

  static const IconData eye = _XIconData(0xe63c);
  static const IconData edit = _XIconData(0xe657);
  static const IconData checked = _XIconData(0xe7ba);

  static const IconData filter = _XIconData(0xe8ec);
  static const IconData next = _XIconData(0xe6a2);
  static const IconData disabled = _XIconData(0xe706);
  static const IconData share = _XIconData(0xe999);
  static const IconData fill_checked = _XIconData(0xe7d3);

  static const IconData user = _XIconData(0xe67b);
  static const IconData dot = _XIconData(0xe63f);
  static const IconData exclamation_point = _XIconData(0xe670);
  static const IconData exclamation_point_fill = _XIconData(0xe860);

  static const IconData three_dot = _XIconData(0xe601);
}

class _XIconData extends IconData {
  final String fontFamily;
  const _XIconData(int codePoint, {this.fontFamily = 'Taojuwu'})
      : super(codePoint);
}
