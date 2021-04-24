/*
 * @Description: 商品相关的接口
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:00:14
 * @LastEditTime: 2021-04-23 18:05:04
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/netkit/http_kit.dart';

class ProductAPI {
  HttpKit _http = HttpKit();

  ///商品详情
  Future<BaseEntity> productDetail(Map params) =>
      _http.get("/app/goods/goodsDetail", params: params);

  ///商品详情
  Future<BaseEntity> productList(Map params) =>
      _http.get("/app/goods/goodsList", params: params);
}
