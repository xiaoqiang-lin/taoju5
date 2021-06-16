/*
 * @Description:本地存储
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:41:02
 * @LastEditTime: 2021-06-11 17:04:37
 */
import 'package:get_storage/get_storage.dart';

///SharedPreferences
class LocalStorage {
  static GetStorage _box = GetStorage("c");

  static get(String key) async {
    return _box.read(key);
  }

  static remove(String key) {
    return _box.remove(key);
  }

  static save(String key, dynamic val) {
    return _box.write(key, val);
  }
}
