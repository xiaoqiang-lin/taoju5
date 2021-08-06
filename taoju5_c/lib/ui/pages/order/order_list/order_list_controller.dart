/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:44:47
 * @LastEditTime: 2021-07-30 15:45:24
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';

import 'modal/order_filter_modal.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

    List<OrderTabEntity> categoryList = Get.arguments;

    for (OrderTabEntity item in categoryList) {
      if (Get.isRegistered<OrderListController>(tag: item.status)) {
        Get.delete<OrderListController>(tag: item.status, force: true);
      }
    }
    Get.delete<OrderListParentController>(force: true);
    super.onClose();
  }

  void reload() {
    Get.reload<OrderListParentController>();
    List<OrderTabEntity> categoryList = Get.arguments;

    for (OrderTabEntity item in categoryList) {
      Get.reload<OrderListController>(tag: item.status, force: true);
    }
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

  late ScrollController scrollController;

  late int totalPage1 = double.maxFinite ~/ 1;
  int currentPage1 = 1;

  OrderListController({required this.category});

  bool recommend = false;

  String keyword = Get.parameters["keyword"] ?? "";

  @override
  void onInit() {
    super.onInit();
    refreshController ??= RefreshController();
    scrollController = ScrollController();
    Get.lazyPut(() => CommendationController(controller: refreshController!),
        tag: "orderList-${category.status}");
  }

  @override
  void onClose() {
    super.onClose();
    if (Get.isRegistered<CommendationController>(
        tag: "orderList-${category.status}")) {
      Get.delete<CommendationController>(tag: "orderList-${category.status}");
    }
  }

  @override
  Future<List<OrderEntity>> loadData({Map? params}) {
    return _repository.orderList({
      "status": category.status,
      "page_index": currentPage1,
      "keyword": keyword,
      ...(params ?? {})
    }).then((value) {
      orders = value.orders;
      totalPage1 = value.totalPage;
      recommend = value.orders.isEmpty;
      return value.orders;
    });
  }

  Future? refreshOrderList() {
    return refreshController?.requestRefresh();
  }

  @override
  Future loadMore({Map? params}) {
    print("加载更多---$totalPage1---$currentPage1");
    currentPage1++;
    if (currentPage1 >= totalPage1 &&
        Get.isRegistered<CommendationController>(
          tag: "orderList-${category.status}",
        )) {
      recommend = true;
      update(["recommend"]);
      CommendationController c = Get.find<CommendationController>(
        tag: "orderList-${category.status}",
      );
      if (c.list.isEmpty) {
        c.loadData();
      }
      return c.loadMore();
    }
    return _repository.orderList({
      "status": category.status,
      "page_index": currentPage1,
      ...(params ?? {})
    }).then((value) {
      orders.addAll(value.orders);
      totalPage1 = value.totalPage;
      recommend = value.orders.isEmpty;
      refreshController?.loadComplete();
      if (currentPage1 > totalPage1) {
        recommend = true;
        update(["recommend"]);
      }
      return value.orders;
    }).whenComplete(update);
  }
}
