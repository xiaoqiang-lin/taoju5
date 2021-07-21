/*
 * @Description: 门店
 * @Author: iamsmiling
 * @Date: 2021-07-21 14:26:04
 * @LastEditTime: 2021-07-21 16:11:23
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/category/category_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class StoreAPI {
  HttpKit _http = HttpKit();

  Future<BaseEntity> storeDetail({Map? params}) =>
      _http.get("/app/shop/shopDetail", params: params);

  Future<BaseEntity> storeList({Map? params}) =>
      _http.get("/app/shop/shopList", params: params);

  Future<BaseEntity> storeTabs({Map? params}) =>
      _http.get("/app/shop/shopTitle", params: params);
}
