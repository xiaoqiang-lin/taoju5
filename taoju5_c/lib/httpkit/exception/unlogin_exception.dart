/*
 * @Description: 未
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:13:06
 * @LastEditTime: 2021-04-27 10:28:57
 */
import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:taoju5_c/routes/router_delegater.dart';

class UnLoginException extends BaseHttpException {
  UnLoginException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions, noTip: false);

  @override
  onException() {
    RouterDelegater.toLoginPage();
  }
}
