/*
 * @Description: 订单详情
 * @Author: iamsmiling
 * @Date: 2021-05-17 18:24:05
 * @LastEditTime: 2021-07-27 16:00:43
 */

import 'package:taoju5_c/component/net/chimera_refresh_builder.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_controller.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_operation_mixin.dart';

class OrderDetailController extends ChimeraRefreshController<OrderDetailEntity>
    with OrderOperationMixin {
  String? id = Get.parameters["order_id"];

  late OrderDetailEntity order;

  List<OrderActionButtonEntity> actions = [];

  @override
  Future<OrderDetailEntity> loadData({Map? params}) {
    OrderRepository repository = OrderRepository();
    return repository.orderDetail({"order_id": id}).then((value) {
      order = value;
      actions = order.actions;
      return value;
    });
  }

  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => CommendationController(controller: refreshController),
        tag: "orderDetail-$id");
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<CommendationController>(tag: "orderDetail-$id", force: true);
  }

  Future operate(OrderActionButtonEntity a) {
    return Function.apply(actionMap[a.actionCode] ?? (_) {}, [order, a]);
  }

  @override
  Future loadMore({Map? params}) {
    return Get.find<CommendationController>(tag: "orderDetail-$id").loadMore();
  }
}
