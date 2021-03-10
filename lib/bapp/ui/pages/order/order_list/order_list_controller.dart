/*
 * @Description: 订单列表控制器
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:24:18
 * @LastEditTime: 2021-02-02 17:00:26
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5/bapp/domain/model/order/order_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/interface/i_xselectable.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/fragement/order_filter_page.dart';

import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:taoju5/bapp/ui/widgets/common/modal/x_popdown_modal.dart';

class OrderTimeOptionModel implements IXSelectable {
  @override
  bool isChecked;
  String name;
  String status;
  OrderTimeOptionModel({this.isChecked = false, this.name, this.status});
}

class OrderStatusTabModel implements IXSelectable {
  String name;
  String status;
  final count = 0.obs;
  bool isChecked;
  OrderStatusTabModel({this.name, this.status, this.isChecked = false});
  Map get params => {"status": status};
}

class OrderListParentController extends GetxController
    with SingleGetTickerProviderMixin {
  List<OrderStatusTabModel> tabList = [
    OrderStatusTabModel(name: "进行中", status: "ing", isChecked: true),
    OrderStatusTabModel(name: "待审核", status: "1"),
    OrderStatusTabModel(name: "待测量", status: "2"),
    OrderStatusTabModel(name: "待选品", status: "14"),
    OrderStatusTabModel(name: "待付款", status: "3,4"),
    OrderStatusTabModel(name: "生产中", status: "5"),
    OrderStatusTabModel(name: "待发货", status: "6"),
    OrderStatusTabModel(name: "待收货", status: "15"),
    OrderStatusTabModel(name: "待安装", status: "7"),
    OrderStatusTabModel(name: "已完成", status: "8"),
    OrderStatusTabModel(name: "已取消", status: "9"),
    OrderStatusTabModel(name: "全部"),
  ];

  List<OrderTimeOptionModel> timeList = [
    OrderTimeOptionModel(name: "全部时间", status: "0", isChecked: true),
    OrderTimeOptionModel(name: "近三个月", status: "1"),
    OrderTimeOptionModel(name: "三个月前", status: "2"),
  ];
  TabController tabController;

  bool showFilterPanel = false;

  ///获取tag
  String get tag => tabList[tabController?.index ?? 0].name;

  ///获取[orderListController]

  void updateCount(List<int> list) {
    for (int i = 0; i < list.length; i++) {
      tabList[i].count.value = list[i];
    }
  }

  Future filter(BuildContext context) {
    ///如果已经打开了筛选面版 则关闭筛选面板
    showFilterPanel = true;
    update(["tab"]);
    if (!ModalRoute.of(context).isCurrent) {
      Get.back();
      return Future.value(false);
    }

    ///打开排序面板
    RenderBox renderBox = context.findRenderObject();
    Rect box = renderBox.localToGlobal(Offset.zero) & renderBox.size;
    return showXModalPopdown(context,
            builder: (context) => OrderFilterPage(), offset: box.bottom)
        .whenComplete(() {
      showFilterPanel = false;
      update(["tab"]);
    });
  }

  void selectStatus(OrderStatusTabModel model) {
    tabList.forEach((e) {
      e.isChecked = e == model;
    });
    update(["status", "tab"]);
  }

  void selectTime(OrderTimeOptionModel model) {
    timeList.forEach((e) {
      e.isChecked = e == model;
    });
    update(["time"]);
  }

  ///刷新数据
  void refreshData() {
    ///更新数据
    final controller = Get.find<OrderListController>(tag: tag);

    String time = timeList.firstWhere((e) => e.isChecked).status;
    controller.time = time;
    controller.refreshData();

    ///tab跳转
    int index = tabList.indexWhere((e) => e.isChecked);
    tabController.animateTo(index);
    Get.back();
  }

  void _onTabChange() {
    for (int i = 0; i < tabList.length; i++) {
      tabList[i].isChecked = i == tabController.index;
    }
    update(["status"]);
  }

  @override
  void onInit() {
    tabController = TabController(length: tabList.length, vsync: this)
      ..addListener(_onTabChange);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.removeListener(_onTabChange);
    tabController.dispose();
    super.onClose();
  }
}

class OrderListController extends GetxController {
  final String status;
  OrderRepository _repository = OrderRepository();

  List<OrderModel> orderList;

  XLoadState loadState = XLoadState.idle;

  RefreshController refreshController;

  String time;
  int currentPage = 1;

  refreshData() {
    loadState = XLoadState.busy;
    currentPage = 1;
    update();
    _repository.orderList(params: {
      "status": status,
      "page": currentPage,
      "order_time": time
    }).then((value) {
      orderList = value.orderModelList;
      if (GetUtils.isNullOrBlank(orderList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }

      Get.find<OrderListParentController>().updateCount(value.countList);
      refreshController?.refreshCompleted();
    }).catchError((err) {
      refreshController?.refreshFailed();
    }).whenComplete(update);
  }

  loadMore() {
    loadState = XLoadState.busy;
    currentPage += 1;
    _repository.orderList(params: {
      "status": status,
      "page": currentPage,
      "order_time": time
    }).then((value) {
      orderList.addAll(value.orderModelList);
      loadState = XLoadState.idle;
      Get.find<OrderListParentController>().updateCount(value.countList);
      if (GetUtils.isNullOrBlank(value.orderModelList)) {
        refreshController?.loadNoData();
      } else {
        refreshController?.loadComplete();
      }
    }).catchError((err) {
      currentPage -= 1;
      refreshController?.loadFailed();
    }).whenComplete(update);
  }

  OrderListController({@required this.status});
  Future<OrderModelListWrapper> _loadData() {
    loadState = XLoadState.busy;
    return _repository.orderList(params: {"status": status}).then((value) {
      orderList = value.orderModelList;

      if (GetUtils.isNullOrBlank(orderList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
      Get.find<OrderListParentController>().updateCount(value.countList);
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    _loadData();
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }
}
