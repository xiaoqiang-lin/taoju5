/*
 * @Description: 商品相关
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:02:12
 * @LastEditTime: 2021-04-30 09:05:14
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/provider/product_api.dart';

class ProductRepository {
  ProductAPI _api = ProductAPI();

  ///商品详情
  Future<ProductDetailEntity> productDetail(Map params) =>
      _api.productDetail(params).then((BaseEntity response) {
        return ProductDetailEntity.fromJson(response.data["goods_detail"]);
      });

  ///商品详情
  Future<List<ProductEntity>> productList(Map params) =>
      _api.productList(params).then((BaseEntity response) {
        return JsonKit.asList(response.data["goods_list"])
            .map((e) => ProductEntity.fromJson(e))
            .toList();
      });

  ///商品属性
  Future productAttribute(Map params) => _api.productAttribute(params);

  ///商品浏览记录
  Future addToHistory(Map params) => _api.addToHistory(params);
}
