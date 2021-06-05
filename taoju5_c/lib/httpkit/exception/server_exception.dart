/*
 * @Description: 服务器异常
 * @Author: iamsmiling
 * @Date: 2021-05-18 15:43:32
 * @LastEditTime: 2021-05-26 16:45:33
 */
import 'package:taoju5_c/utils/toast.dart';

import 'base_exception.dart';
import 'package:dio/dio.dart';

class ServerException extends BaseHttpException {
  ServerException(String message, RequestOptions requestOptions)
      : super(message: message, requestOptions: requestOptions, noTip: false);

  @override
  onException() {
    ToastKit.error(message, autoDismiss: false);
  }
}
