/*
 * @Description: 购物车相关
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:45:38
 * @LastEditTime: 2021-04-27 16:15:54
 */
import 'package:taoju5_c/domain/provider/cart_api.dart';

class CartRepository {
  CartAPI _api = CartAPI();

  Future addToCart({required Map params}) => _api.addToCart(params: params);

  Future cartList({Map? params}) => _api.cartList(params: params);
}
