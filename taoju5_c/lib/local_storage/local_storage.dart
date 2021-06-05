/*
 * @Description:本地存储
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:41:02
 * @LastEditTime: 2021-06-03 15:03:14
 */
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences
class LocalStorage {
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static Future remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
