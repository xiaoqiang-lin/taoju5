/*
 * @Description: 搜索
 * @Author: iamsmiling
 * @Date: 2021-02-02 10:59:59
 * @LastEditTime: 2021-02-02 11:26:15
 */
import 'package:taoju5/xdio/x_dio.dart';

class SearchAPI {
  Future<BaseResponse> search(String url, {Map params}) =>
      XDio().get(url, params: params);
}
