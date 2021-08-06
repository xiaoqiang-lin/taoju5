/*
 * @Description: app路由
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:05:10
 * @LastEditTime: 2021-07-27 17:54:50
 */

import 'package:get_storage/get_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart' as cApp;

class AppRoutes {
  static GetStorage _cbox = GetStorage('c');
  static GetStorage _bbox = GetStorage('b');
  static GetStorage _box = GetStorage();
  static get initial {
    if (_box.read("firstRun") == true) {
      return firstGuide;
    }
    if (_cbox.read("token") != null) {
      print(_cbox.read("token"));
      return cApp.AppRoutes.main;
    }

    if (_bbox.read("token") != null) {
      return b;
    }

    return loginGuide;
  }

  static const loginGuide = '/loginGuide';

  static const unknow = '/404';

  static const b = '/b';

  static const c = '/c';

  static const firstGuide = '/firstGuide';

  static const secondGuide = '/secondGuide';
}
