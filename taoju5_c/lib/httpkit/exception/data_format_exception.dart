/*
 * @Description: 数据格式异常
 * @Author: iamsmiling
 * @Date: 2021-05-26 16:18:34
 * @LastEditTime: 2021-05-26 16:20:46
 */

import 'package:taoju5_c/utils/toast.dart';

import 'base_exception.dart';
import 'package:dio/dio.dart';

class DataFormatException extends BaseHttpException {
  DataFormatException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions, noTip: false);

  @override
  onException() {
    ToastKit.error(message);
  }
}
