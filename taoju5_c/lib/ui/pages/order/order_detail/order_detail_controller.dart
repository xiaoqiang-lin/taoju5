/*
 * @Description: 订单详情
 * @Author: iamsmiling
 * @Date: 2021-05-17 18:24:05
 * @LastEditTime: 2021-05-27 16:54:56
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/dialog/cancel_order_dialog.dart';

class OrderDetailController
    extends BaseFutureLoadStateController<OrderDetailEntity> {
  String? id = Get.parameters["id"];

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

  Map<int, Function()> get actionMap => {1: cancelOrder};

  Future cancelOrder() {
    return openCancelOrderDialog(Get.context!);
    // return openCancelOrderModal(Get.context!, order.cancelOrderReason);
  }
}
