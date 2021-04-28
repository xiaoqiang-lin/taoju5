/*
 * @Description:本地存储
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:41:02
 * @LastEditTime: 2021-04-27 09:45:35
 */
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences
class LocalStorage {
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
