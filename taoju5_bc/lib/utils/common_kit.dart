/*
 * @Description: 常用工具方法
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:44:12
 * @LastEditTime: 2021-04-23 14:47:55
 */

import 'dart:async';

import 'package:get/get_utils/get_utils.dart';
import 'package:taoju5_bc/config/net_config.dart';
import 'package:taoju5_bc/extensions/datetime_kit.dart';

abstract class CommonKit {
  static bool isNullOrZero(dynamic value) {
    if (value == null) return true;
    if (value is String) return value == "0" || value == "0.00";
    return value == 0;
  }

  static bool isNullOrEmpty(dynamic value) {
    if (value == null) return true;
    if (value is Iterable) return value.isEmpty;
    return false;
  }

  static bool isNum(dynamic value) {
    if (value == null) return false;
    if (value is num) return true;
    if (GetUtils.isNum(value)) return true;
    return false;
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

  static String getFileExt(String fileName) {
    int index = fileName.lastIndexOf(".");
    return fileName.substring(index + 1);
  }

  // static bool get isImage(String val)=>GetUtils.isImage(filePath)
}
