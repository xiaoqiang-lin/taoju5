/*
 * @Description: cart
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:33:06
 * @LastEditTime: 2021-04-27 16:16:06
 */

import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';

class CartController extends BaseFutureLoadStateController {
  CartRepository _repository = CartRepository();

  @override
  Future loadData({Map? params}) {
    return _repository.cartList();
  }
}
