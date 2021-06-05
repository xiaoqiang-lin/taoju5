/*
 * @Description: 自定义异常基类
 * @Author: iamsmiling
 * @Date: 2021-04-27 09:13:57
 * @LastEditTime: 2021-05-26 16:30:47
 */
import 'package:dio/dio.dart';

abstract class BaseHttpException extends DioError {
  final String message;
  final RequestOptions requestOptions;
  final bool noTip;
  BaseHttpException(
      {required this.message, required this.requestOptions, this.noTip = true})
      : super(requestOptions: requestOptions);

  @override
  String toString() => message;

  ///出现异常时采取的策略
  onException();
}
