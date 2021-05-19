/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:44:47
 * @LastEditTime: 2021-05-18 17:33:42
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderListController
    extends BaseFutureLoadStateController<List<OrderEntity>>
    with SingleGetTickerProviderMixin {
  OrderRepository _repository = OrderRepository();

  List<OrderEntity> orders = [];

  List<OrderTabEntity> tabs = [];

  late TabController tabController;

  ///初始选中的状态
  String initialStatus = Get.parameters["status"] ?? "";

  int get initialIndex {
    for (int i = 0; i < tabs.length; i++) {
      if (tabs[i].status == initialStatus) return i;
    }
    return 0;
  }

  @override
  Future<List<OrderEntity>> loadData({Map? params}) {
    return _repository.orderList(params).then((value) {
      orders = value.orders;
      tabs = value.tabs;
      tabController = TabController(
          initialIndex: initialIndex, length: tabs.length, vsync: this);
      return orders;
    });
  }
}
