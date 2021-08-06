/*
 * @Description: 我的足迹
 * @Author: iamsmiling
 * @Date: 2021-05-19 11:04:53
 * @LastEditTime: 2021-07-29 10:09:52
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';

class FootPrintEntityListWrapperEntity {
  late List<FootPrintEntity> list;
  late int totalPage;
  late int totalCount;

  FootPrintEntityListWrapperEntity.fromJson(Map json) {
    list = JsonKit.asList(json["data"])
        .map((e) => FootPrintEntity.fromJson(e))
        .toList();
    totalCount = JsonKit.asInt(json["total_count"]);
    totalPage = JsonKit.asInt(json["page_count"]);
  }
}

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
