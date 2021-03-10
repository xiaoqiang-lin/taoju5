/*
 * @Description: 选品控制器
 * @Author: iamsmiling
 * @Date: 2021-01-10 11:56:58
 * @LastEditTime: 2021-01-10 17:59:44
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_sort_model.dart';

class SelectableProductListController extends GetxController {
  List<ProductSortModel> sortList = [
    ProductSortModel(id: 1, name: "默认排序", isChecked: true),
    ProductSortModel(id: 2, name: "新品优先", order: "is_new", sort: "desc"),
    ProductSortModel(id: 3, name: "销量排序", order: "sales", sort: "desc"),
    ProductSortModel(id: 4, name: "价格升序", order: "price", sort: "asc"),
    ProductSortModel(id: 5, name: "价格降序", order: "price", sort: "desc"),
  ];

  String get sortName => sortList.firstWhere((e) => e.isChecked).name;

  ///是否为网格视图
  bool isGridMode = true;
}
