/*
 * @Description: 选品控制器
 * @Author: iamsmiling
 * @Date: 2021-01-10 11:56:58
 * @LastEditTime: 2021-06-16 18:29:43
 */

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_product_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/domain/model/product/product_sort_model.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/product/product_list/product_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/search/search_controller.dart';

class SelectProductEvent {
  OrderDetailProductModel orderProduct;
  CustomerModel customer;
  OrderType orderType = OrderType.measureOrder;
  SelectProductEvent.empty();
  SelectProductEvent({@required this.orderProduct, @required this.customer});
}

class SelectableProductListController extends GetxController {
  List<ProductSortModel> sortList = [
    ProductSortModel(id: 1, name: "默认排序", isChecked: true),
    ProductSortModel(id: 2, name: "新品优先", order: "is_new", sort: "desc"),
    ProductSortModel(id: 3, name: "销量排序", order: "sales", sort: "desc"),
    ProductSortModel(id: 4, name: "价格升序", order: "price", sort: "asc"),
    ProductSortModel(id: 5, name: "价格降序", order: "price", sort: "desc"),
  ];

  String get sortName => sortList.firstWhere((e) => e.isChecked).name;

  SelectProductEvent event = Get.arguments;

  OrderMeasureDataModel get measureData => event.orderProduct.measureData;

  String keyword;

  Future search() {
    return Get.toNamed(
            BAppRoutes.search +
                "?height=${measureData.height}&searchType=${SearchType.product.index}&keyword=$keyword",
            arguments: event)
        .then((value) {
      keyword = value;

      update();
      Get.find<ProductListController>(tag: "0").refreshData(keyword: value);
    });
  }
}
