/*
 * @Description: app路由
 * @Author: iamsmiling
 * @Date: 2021-06-04 14:05:10
 * @LastEditTime: 2021-06-07 14:05:34
 */

import 'package:get_storage/get_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart' as cApp;

class AppRoutes {
  static GetStorage _cbox = GetStorage('c');
  static GetStorage _bbox = GetStorage('b');
  static get initial {
    if (_cbox.read("token") != null) {
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
}
