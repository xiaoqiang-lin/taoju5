/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 11:04:53
 * @LastEditTime: 2021-06-08 11:18:19
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';

class FootPrintEntity {
  late String date;

  late List<ProductEntity> products;

  FootPrintEntity.fromJson(Map json) {
    date = json["date"];
    products = JsonKit.asList(json["goods_list"])
        .map((e) => ProductEntity.fromJson(e))
        .toList();
  }
}
