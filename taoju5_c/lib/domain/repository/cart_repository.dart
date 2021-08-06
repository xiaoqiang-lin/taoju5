/*
 * @Description: 购物车相关
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:45:38
 * @LastEditTime: 2021-08-06 10:18:38
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/provider/cart_api.dart';

class CartRepository {
  CartAPI _api = CartAPI();

  Future addToCart({required Map params}) => _api.addToCart(params: params);

  Future<CartEntityListWrapperEntity> cartList({Map? params}) =>
      _api.cartList(params: params).then((BaseEntity response) =>
          CartEntityListWrapperEntity.fromJson(response.data));

  Future<List<CartEntity>> removeFromCart({Map? params}) => _api
      .removeFromCart(params: params)
      .then((BaseEntity response) => JsonKit.asList(response.data)
          .map((e) => CartEntity.fromJson(e))
          .toList());

  ///修改购物车数量
  Future<double> modifyCartCount({Map? params}) =>
      _api.modifyCartCount(params: params).then((BaseEntity response) {
        return JsonKit.asDouble(response.data);
      });

  ///修改购物车属性
  Future<CartEntity> modifyCartSku({Map? params}) =>
      _api.modifyCartSku(params: params).then((BaseEntity response) {
        return CartEntity.fromJson(response.data);
      });

  ///修改购物车属性
  Future<BaseEntity> batchAddToCart({Map? params}) =>
      _api.batchAddToCart(params: params).then((BaseEntity response) {
        return response;
      });

  ///购物车测量数据
  Future<CurtainMeasureDataAttributeEntity> measureData({Map? params}) =>
      _api.measureData(params: params).then((BaseEntity response) {
        return CurtainMeasureDataAttributeEntity.fromCartProductJson(
            response.data);
      });
}
