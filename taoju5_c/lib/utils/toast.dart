/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-06 10:40:06
 * @LastEditTime: 2021-04-29 17:42:13
 */

import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class ToastKit {
  static init() {}

  static success(String message) {
    EasyLoading.showInfo(message);
  }

  static warning(String message) {}

  static loading(
      {String? message,
      EasyLoadingMaskType maskType = EasyLoadingMaskType.none}) {
    EasyLoading.show(status: message, maskType: maskType);
  }

  static dismiss({Duration? delay}) {
    EasyLoading.dismiss();
  }

  static error(String message) {
    EasyLoading.showInfo(message);
  }
}
