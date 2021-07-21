/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:44:47
 * @LastEditTime: 2021-07-19 09:44:12
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:get/get.dart';

import 'modal/order_filter_modal.dart';

class OrderListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  List<OrderTabEntity> tabs = Get.arguments;

  ///初始选中的状态
  int initialIndex = int.parse(Get.parameters["index"] ?? "0");

  late TabController tabController;

  @override
  void onInit() {
    tabController = tabController = TabController(
        initialIndex: initialIndex, length: tabs.length, vsync: this);
    List<OrderTabEntity> categoryList = Get.arguments;

    for (OrderTabEntity item in categoryList) {
      Get.lazyPut(() => OrderListController(category: item), tag: item.status);
    }
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  ///筛选面板是否打开
  bool open = false;

  Future filter(BuildContext ctx) {
    if (open == true) return Future.value(true);
    open = true;
    update();

    return showOrderFilterModal(ctx,
            categories: tabs, currentIndex: tabController.index)
        .then((int? val) {
      if (val == null || val == tabController.index) return;
      tabController.animateTo(val);
      // Get.find<OrderListController>(tag: tabs[val].status).refreshData();
    }).whenComplete(() {
      open = false;
      update();
    });
  }

  void refreshData() {
    Get.find<OrderListController>(tag: tabs[tabController.index].status)
        .refreshOrderList();
  }
}

class OrderListController
    extends PullToRefreshListViewBuilderController<OrderEntity> {
  OrderRepository _repository = OrderRepository();

  List<OrderEntity> orders = [];

  late CancelOrderReasonEntity reason;

  late OrderTabEntity category;

  OrderListController({required this.category});

  @override
  Future<List<OrderEntity>> loadData({Map? params}) {
    return _repository.orderList(
        {"status": category.status, ...(params ?? {})}).then((value) {
      orders = value;
      return value;
    });
  }

  Future? refreshOrderList() {
    return refreshController?.requestRefresh();
  }
}
