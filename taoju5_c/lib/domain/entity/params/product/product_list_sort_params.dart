/*
 * @Description: 商品列表排序
 * @Author: iamsmiling
 * @Date: 2021-04-25 12:20:34
 * @LastEditTime: 2021-05-27 14:57:15
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

class ProductListSortParamsEntity extends BaseParamsEntity {
  String name;
  String? order;
  String? sort;
  String descIcon;

  ///是否降序
  bool isAsc;
  String ascIcon;

  bool showIcon;

  ProductListSortParamsEntity(
      {required this.name,
      this.order = "",
      this.sort = "",
      this.isAsc = false,
      this.descIcon = "",
      this.showIcon = false,
      this.ascIcon = ""});

  @override
  Map get params => {"sort": sort, "order": order};

  @override
  bool validate() => true;

  @override
  String toString() {
    return name;
  }
}
