/*
 * @Description: 商品分类
 * @Author: iamsmiling
 * @Date: 2021-04-19 17:03:03
 * @LastEditTime: 2021-04-19 17:08:55
 */

import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/netkit/http_kit.dart';

class CategoryAPI {
  HttpKit _http = HttpKit();

  Future<BaseEntity> getCategoryList({Map? params}) {
    return _http.get("/app/goods/categoryList", params: params);
  }
}
