/*
 * @Description: 商品排序模型
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:17:11
 * @LastEditTime: 2021-01-15 14:24:30
 */

import 'package:flutter/foundation.dart';

class ProductSortModel {
  String name;
  bool isChecked;
  String sort;
  String order;
  int id;
  ProductSortModel(
      {@required this.name,
      @required this.id,
      this.sort = "",
      this.order = "",
      this.isChecked = false});
  Map get params => {"sort": sort, "order": order};
}
