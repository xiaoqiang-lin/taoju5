/*
 * @Description: 淘居屋
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:58:46
 * @LastEditTime: 2020-12-21 16:39:15
 */

import 'package:flutter/material.dart';
import 'package:taoju5/xdio/x_dio.dart';
import 'package:dio/dio.dart';

class TaojuwuAPI {
  Future<BaseResponse> curtainProductAttrs(String url) => XDio().get(url);

  Future<BaseResponse> uploadImage(String url,
          {Map params, @required var formData}) =>
      XDio().post(url,
          queryParameters: params,
          formData: formData,
          options: Options(responseType: ResponseType.plain));
  Future<BaseResponse> feedback(String url, {Map params}) =>
      XDio().post(url, queryParameters: params);
}
