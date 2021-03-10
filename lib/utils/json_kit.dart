/*
 * @Description: json转换工具类
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:59:08
 * @LastEditTime: 2021-02-10 10:58:43
 */

import 'package:taoju5/extensions/map_kit.dart';
import 'package:taoju5/extensions/datetime_kit.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/interface/i_xselectable.dart';
import 'package:taoju5/config/net_config.dart';

abstract class JsonKit {
  static int asInt(dynamic n) {
    if (n is num) return n.toInt();
    if (GetUtils.isNum(n)) return int.tryParse(n);
    if (GetUtils.isNullOrBlank(n)) return 0;
    return n;
  }

  static String asString(dynamic n, {String trueDesc, String falseDesc}) {
    if (n is String && GetUtils.isNum(n)) {
      n = JsonKit.asInt(n);
    }
    if (n is num) {
      if (GetUtils.isNullOrBlank(trueDesc) ||
          GetUtils.isNullOrBlank(trueDesc)) {
        return n.toString();
      }
      if (n > 0) return trueDesc;
      return falseDesc;
    }

    return n.toString();
  }

  static double asDouble(dynamic n) {
    if (n is num) return n.toDouble();
    if (GetUtils.isNum(n)) return double.tryParse(n);
    if (GetUtils.isNullOrBlank(n)) return 0.0;
    return n;
  }

  static bool asBool(dynamic value) {
    if (GetUtils.isNullOrBlank(value)) return false;

    if (value is num) return value > 0;

    return true;
  }

  static String asWebUrl(String path) {
    if (GetUtils.isNullOrBlank(path)) return path;
    if (GetUtils.isImage(path)) {
      if (GetUtils.hasMatch(path, "(http|https)")) return path;
      return NetConfig.baseUrl + (path.startsWith("/") ? path : "/$path");
    }
    return path;
  }

  static dynamic getValueInComplexMap(Map json, List keys) {
    if (GetUtils.isNull(json)) return json;
    return json.getValueInComplexMap(keys);
  }

  static List asList(dynamic value) {
    if (value == null) return [];
    if (value is List) return value;
    if (value is Iterable) return value.toList();
    return [];
  }

  static dynamic getFirstItem(List list) {
    if (GetUtils.isNullOrBlank(list)) return;
    return list.first;
  }

  static getValueByKey(Map json, dynamic key, {bool onlyFirst = true}) {
    return json.getValueByKey(key, onlyFirst: onlyFirst);
  }

  static DateTime getDateTimeFromMillseconds(int mills) {
    return DateTime.fromMillisecondsSinceEpoch((mills ?? 0) * 1000);
  }

  static String formatDateTimeFromMillseconds(int mills,
      {String format: "yyyy-MM-dd HH:mm:ss"}) {
    return formatDateTime(getDateTimeFromMillseconds(mills));
  }

  static String formatDateTime(DateTime dateTime,
      {String format: "yyyy-MM-dd HH:mm:ss"}) {
    return dateTime.formatDate(format: format);
  }

  static bool isNullOrZero(dynamic value) {
    return GetUtils.isNull(value) || value == 0;
  }

  static bool isNullOrBlank(dynamic value) {
    return GetUtils.isNullOrBlank(value) || value == 0;
  }

  static List<IXSelectable> selectFirstItem(List<IXSelectable> list) {
    for (int i = 0; i < list.length; i++) {
      list[i].isChecked = i == 0;
    }
    return list;
  }

  static bool isImage(String url) {
    return GetUtils.isImage(url);
  }

  static bool isUrl(String url) {
    return GetUtils.isURL(url);
  }

  static Map normalize(Map json) {
    for (MapEntry entry in json.entries) {
      var value = entry.value;
      var key = entry.key;
      if (value is Map) {
        return normalize(value);
      }
      if (value is String && (isImage(value))) {
        json[key] = JsonKit.asWebUrl(value);
      }
    }
    return json;
  }
}
