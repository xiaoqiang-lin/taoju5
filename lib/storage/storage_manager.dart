/*
 * @Description: 数据存储
 * @Author: iamsmiling
 * @Date: 2020-12-18 17:19:33
 * @LastEditTime: 2021-02-01 11:24:39
 */
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'taojuwu_storage.dart';

class StorageManager {
  StorageManager._();
  static StorageManager _singleton = StorageManager._();
  factory StorageManager() => _singleton;

  /// app全局配置 eg:theme
  SharedPreferences sharedPreferences;

  /// 临时目录 eg: cookie
  Directory temporaryDirectory;

  /// 初始化必备操作 eg:user数据
  TaojuwuStorage localStorage = TaojuwuStorage();

  /// 必备数据的初始化操作
  ///
  /// 由于是同步操作会导致阻塞,所以应尽量减少存储容量
  init() async {
    // async 异步操作
    // sync 同步操作
    temporaryDirectory = await getTemporaryDirectory();
    sharedPreferences = await SharedPreferences.getInstance();
  }

  clear() {
    sharedPreferences.clear();
    // localStorage.clear();
  }
}
