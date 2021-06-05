/*
 * @Description: 无效的参数异常
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:02:18
 * @LastEditTime: 2021-05-26 16:17:02
 */
import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:dio/dio.dart';

class ArgumentException extends BaseHttpException {
  ArgumentException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions, noTip: false);

  @override
  onException() {}
}
