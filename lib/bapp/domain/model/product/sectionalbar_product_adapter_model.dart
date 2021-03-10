/*
 * @Description:型材商品适配
 * @Author: iamsmiling
 * @Date: 2021-01-15 22:21:29
 * @LastEditTime: 2021-01-15 22:25:27
 */

import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';

class SectionalProductAdapterModel {
  String image;
  String length;

  SectionalProductAdapterModel.fromCart(CartPorductModel model) {
    image = model.image;
    length = model.length;
  }
}
