/*
 * @Description: 窗帘商品属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:57:25
 * @LastEditTime: 2021-05-10 11:14:12
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

class CurtainProductAttributeController extends GetxController {
  ProductDetailEntity product;
  CurtainAttributeEntity arribute;

  CurtainProductAttributeController(
      {required this.product, required this.arribute});
}
