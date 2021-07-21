/*
 * @Description: 订单详情
 * @Author: iamsmiling
 * @Date: 2021-05-17 18:24:05
 * @LastEditTime: 2021-07-19 09:24:55
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_operation_mixin.dart';

class OrderDetailController
    extends BaseFutureLoadStateController<OrderDetailEntity>
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

  Future operate(OrderActionButtonEntity a) {
    return Function.apply(actionMap[a.actionCode] ?? (_) {}, [order, a]);
  }
}
