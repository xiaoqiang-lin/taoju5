/*
 * @Description: 订单操作
 * @Author: iamsmiling
 * @Date: 2021-07-01 17:19:17
 * @LastEditTime: 2021-07-19 09:22:24
 */
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/dialog/cancel_order_dialog.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/dialog/confirm_select_dialog.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/modal/cancel_order_modal.dart';

mixin OrderOperationMixin {
  OrderRepository _repository = OrderRepository();

  Map<int, Function(OrderDetailEntity, OrderActionButtonEntity?)>
      get actionMap => {
            1: cancel,
            2: pay,
            3: confirm,
            4: payBalance,
            5: logistics,
            6: receive,
            7: refund,
            8: batchRefund,
            9: delete
          };

  ///确认选品
  Future confirm(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return _repository.operationHint(params: {
      "order_id": order.id,
      "type": action?.actionCode
    }).then((value) {
      return openConfirmSelectDialog(Get.context!, value);
    }).then((value) {
      if (value == true) {
        print(value);
        // return _repository
        //     .confirmSelectedProduct(params: {"order_id": order.id});
      }
    });
  }

  ///取消订单
  Future cancel(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return openCancelOrderDialog(Get.context!, order.cancelOrderMessage)
        .then((value) {
      if (value == true) {
        return openCancelOrderModal(Get.context!, order.cancelOrderReason)
            .then((value) {
          if (value is String) {
            return _repository.cancelOrder(
                params: {"order_id": order.id, "order_close_reason": value});
          }
        });
      }
    });
  }

  ///查看物流
  Future logistics(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return Get.toNamed(Get.currentRoute + AppRoutes.logistics) ??
        Future.value();
  }

  ///支付尾款
  Future payBalance(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return _repository.payBalance();
  }

  ///确认收货
  Future receive(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return Future.value();
  }

  ///确认支付
  Future pay(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return Get.toNamed(AppRoutes.pay,
            arguments: CreateOrderParamsEntity(
                orderId: "${order.id}", totalPrice: order.amount)) ??
        Future.value();
  }

  ///删除订单
  Future delete(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return _repository
        .deleteOrder(params: {"order_id": order.id}).then((value) {
      Get.back();
    });
  }

  ///申请退款
  Future refund(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return Get.toNamed(
            AppRoutes.orderDetail + "/${order.id}" + AppRoutes.refund,
            arguments: RefundProductParamsEntity(
                products: order.products.map((e) => e.product).toList(),
                cancelOrderReason: order.cancelOrderReason,
                orderId: "${order.id}")) ??
        Future.value();
  }

  ///批量退款
  Future batchRefund(OrderDetailEntity order, OrderActionButtonEntity? action) {
    return Get.toNamed(
            AppRoutes.orderDetail +
                "/${order.id}" +
                AppRoutes.selectRefundProduct,
            arguments: RefundProductParamsEntity(
                products: order.products.map((e) => e.product).toList(),
                cancelOrderReason: order.cancelOrderReason,
                orderId: "${order.id}")) ??
        Future.value();
  }
}
