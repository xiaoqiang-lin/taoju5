/*
 * @Description: 常用工具方法
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:44:12
 * @LastEditTime: 2021-04-17 16:30:52
 */

import 'dart:async';

import 'package:get/get_utils/get_utils.dart';
import 'package:taoju5/extensions/datetime_kit.dart';
import 'package:taoju5/config/net_config.dart';

abstract class CommonKit {
  static bool isNullOrZero(dynamic value) {
    if (value == null) return true;
    if (value is String) return value == "0" || value == "0.00";
    return value == 0;
  }

  static String formatDateTime(DateTime dateTime,
      {String format: "yyyy-MM-dd HH:mm:ss"}) {
    return dateTime.formatDate(format: format);
  }

  static String asWebUrl(String path) {
    if (GetUtils.isNullOrBlank(path)) return path;
    if (GetUtils.isImage(path)) {
      if (GetUtils.hasMatch(path, "(http|https)")) return path;
      return NetConfig.baseUrl + (path.startsWith("/") ? path : "/$path");
    }
    return path;
  }

  static double asDouble(var n) {
    if (n is num) return n.toDouble();
    if (GetUtils.isNum(n)) return double.tryParse(n);
    if (GetUtils.isNullOrBlank(n)) return 0.0;
    return n;
  }

  static Function debounce(
    Function func, [
    Duration delay = const Duration(milliseconds: 800),
  ]) {
    Timer timer;
    Function target = () {
      if (timer?.isActive ?? false) {
        timer?.cancel();
      }
      timer = Timer(delay, () {
        func?.call();
      });
    };
    return target;
  }

  static bool isMobileNumber(String val) {
    if (GetUtils.isNullOrBlank(val)) return false;
    return RegExp(
            '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(val);
  }

  // static bool get isImage(String val)=>GetUtils.isImage(filePath)
}
