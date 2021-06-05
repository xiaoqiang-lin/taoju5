/*
 * @Description: 商品分类
 * @Author: iamsmiling
 * @Date: 2021-04-19 17:03:03
 * @LastEditTime: 2021-05-27 17:23:21
 */

import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class CategoryAPI {
  HttpKit _http = HttpKit();

  Future<BaseEntity> getCategoryList({Map? params}) {
    return _http.get("/app/goods/categoryList", params: params);
  }

  Future<BaseEntity> categoryList({Map? params}) =>
      _http.post("/app/goods/goodsCategoryList", params: params);
}
