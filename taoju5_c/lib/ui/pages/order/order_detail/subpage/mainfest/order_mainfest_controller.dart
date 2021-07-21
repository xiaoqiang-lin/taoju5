/*
 * @Description: 商品清单
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:42:41
 * @LastEditTime: 2021-07-19 09:16:03
 */

import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/order/order_mainfest_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderMainfestController
    extends BaseFutureLoadStateController<OrderMainfestEntity> {
  OrderMainfestEntity mainfest = OrderMainfestEntity();
  @override
  Future<OrderMainfestEntity> loadData({Map? params}) {
    OrderRepository repository = OrderRepository();
    String orderId = Get.parameters["order_id"] ?? "";
    return repository.mainfest({"order_id": orderId}).then((value) {
      mainfest = value;
      return value;
    });
  }
}
