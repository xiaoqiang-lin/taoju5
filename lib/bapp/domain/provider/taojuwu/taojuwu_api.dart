/*
 * @Description: 淘居屋
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:58:46
 * @LastEditTime: 2021-09-15 20:44:31
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

  Future<BaseResponse> userProtocol({Map params}) =>
      XDio().get("/api/login/registerAgreement", params: params);

  Future<BaseResponse> privacyPolicy({Map params}) =>
      XDio().get("/api/login/privacyPolicyAgreement", params: params);

  Future<BaseResponse> locate({Map params}) =>
      XDio().get("https://apis.map.qq.com/ws/geocoder/v1/", params: params);
}
