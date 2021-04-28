/*
 * @Description: 网络未连接异常
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:24:53
 * @LastEditTime: 2021-04-27 11:10:54
 */

import 'package:taoju5_c/httpkit/exception/base_exception.dart';
import 'package:dio/dio.dart';

class OfflineException extends BaseHttpException {
  OfflineException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions, noTip: true);

  @override
  onException() {
    // RouterDelegater.toOfflinePage();
  }
}
