/*
 * @Description: token失效异常
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:17:31
 * @LastEditTime: 2021-04-27 09:37:07
 */

import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:taoju5_c/routes/router_delegater.dart';

class ExpiredTokenException extends BaseHttpException {
  ExpiredTokenException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions, noTip: false);

  @override
  onException() {
    RouterDelegater.toLoginPage();
  }
}
