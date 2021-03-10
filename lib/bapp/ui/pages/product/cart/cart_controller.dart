/*
 * @Description: 每一个item的控制器
 * @Author: iamsmiling
 * @Date: 2021-01-15 21:13:15
 * @LastEditTime: 2021-01-15 21:14:47
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';

class CartController extends GetxController {
  final CartPorductModel product;

  CartController(this.product);
}
