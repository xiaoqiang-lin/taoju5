/*
 * @Description:网络相关工具函数
 * @Author: iamsmiling
 * @Date: 2021-01-22 17:18:53
 * @LastEditTime: 2021-01-22 23:52:59
 */
import 'dart:typed_data';

import 'package:dio/dio.dart';

abstract class NetKit {
  static Dio dio = Dio();

  static Future<Uint8List> resolveImageFromUrl(String url) async {
    Response response =
        await dio.get(url, options: Options(responseType: ResponseType.bytes));
    return response.data;
  }
}
