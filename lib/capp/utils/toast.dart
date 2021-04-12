import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class ToastKit {
  static init() {}

  static success(String message) {
    EasyLoading.showInfo(message);
  }

  static warning(String message) {}

  static error(String message) {}
}
