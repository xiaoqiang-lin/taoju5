/*
 * @Description: 搜索相关
 * @Author: iamsmiling
 * @Date: 2021-02-02 11:19:59
 * @LastEditTime: 2021-02-02 11:21:53
 */

import 'package:taoju5/utils/json_kit.dart';

class SearchModel {
  List<String> data;
  SearchModel.fromJson(List json) {
    data = JsonKit.asList(json).cast<String>();
  }
}
