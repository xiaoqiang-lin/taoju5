/*
 * @Description:日志打印
 * @Author: iamsmiling
 * @Date: 2020-12-22 16:24:55
 * @LastEditTime: 2020-12-22 16:42:12
 */

import 'dart:developer' as developer;

abstract class XLogger {
  static const _isDebug = !bool.fromEnvironment("dart.vm.product");

  static void e(dynamic message) {
    if (!_isDebug) return;
    developer.log("", stackTrace: StackTrace.fromString(message.toString()));
  }

  static void v(dynamic message) {
    if (!_isDebug) return;
    developer.log(message.toString());
  }
}
