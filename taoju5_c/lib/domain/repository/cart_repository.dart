/*
 * @Description: 购物车相关
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:45:38
 * @LastEditTime: 2021-07-20 10:03:48
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/provider/cart_api.dart';

class CartRepository {
  CartAPI _api = CartAPI();

  Future addToCart({required Map params}) => _api.addToCart(params: params);

  Future<List<CartEntity>> cartList({Map? params}) => _api
      .cartList(params: params)
      .then((BaseEntity response) => JsonKit.asList(response.data["cart_list"])
          .map((e) => CartEntity.fromJson(e))
          .toList());

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
}
