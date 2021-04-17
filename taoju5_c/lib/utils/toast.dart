/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-06 10:40:06
 * @LastEditTime: 2021-04-15 16:51:09
 */

import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class ToastKit {
  static init() {}

  static success(String message) {
    EasyLoading.showInfo(message);
  }

  static warning(String message) {}

  static loading({String message}) {
    EasyLoading.show(status: message);
  }

  static dismiss({Duration delay}) {
    EasyLoading.dismiss();
  }

  static error(String message) {
    EasyLoading.showInfo(message);
  }
}
