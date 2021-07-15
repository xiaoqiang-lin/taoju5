/*
 * @Description: 订单商品操作
 * @Author: iamsmiling
 * @Date: 2021-07-01 17:20:03
 * @LastEditTime: 2021-07-14 17:26:02
 */
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/params/order/refund_product_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/dialog/cancel_order_dialog.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/dialog/cancel_product_dialog.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/modal/cancel_order_modal.dart';
import 'package:taoju5_c/utils/toast.dart';

mixin OrderProductOperationMixin {
  OrderRepository _repository = OrderRepository();

  Map<int, Future Function(OrderDetailEntity, ProductAdaptorEntity)>
      get actionMap => {
            101: cancelProduct,
            102: revokeCancel,
            103: selectProduct,
            104: refund,
            105: exchange,
            106: applyForAfterSales,
            107: revokeAfterSales,
            108: afterSales
          };

  Map<int, Future Function(OrderEntity)> get orderActionMap => {
        1: cancel,
        2: pay,
        3: select,
        4: payBalance,
        9: delete,
      };

  ///取消商品
  Future<bool?> cancelProduct(
    OrderDetailEntity order,
    ProductAdaptorEntity product,
  ) {
    return _repository
        .cancelProductTip(params: {"order_goods_id": product.id}).then((value) {
      return openCancelProductDialog(Get.context!, "${value.data}")
          .then((value) {
        return value;
      }).then((value) {
        if (value == true) {
          return openCancelOrderModal(Get.context!, order.cancelOrderReason)
              .then((value) {
            if (value is String) {
              return _repository.cancelProduct(params: {
                "order_id": order.id,
                "order_goods_id": product.id,
                "refund_desc": value
              }).then((value) {
                return true;
              });
            }
          });
        }
      });
    });
  }

  ///TODO
  ///撤销取消商品
  Future revokeCancel(OrderDetailEntity order, ProductAdaptorEntity product) {
    return Future.value();
  }

  ///退款
  Future refund(OrderDetailEntity order, ProductAdaptorEntity product) {
    RefundProductParamsEntity arg =
        RefundProductParamsEntity(products: [product], order: order);
    return Get.toNamed(
            AppRoutes.orderDetail + "/${order.id}" + AppRoutes.refund,
            arguments: arg) ??
        Future.value(false);
  }

  ///TODO
  ///退换货
  Future<bool?> exchange(
      OrderDetailEntity order, ProductAdaptorEntity product) {
    return Future.value();
  }

  ///TODO
  ///申请售后
  Future<bool?> applyForAfterSales(
      OrderDetailEntity order, ProductAdaptorEntity product) {
    return Future.value();
  }

  ///TODO
  ///撤销申请售后
  Future<bool?> revokeAfterSales(
      OrderDetailEntity order, ProductAdaptorEntity product) {
    return Future.value();
  }

  ///TODO
  ///查看售后
  Future<bool?> afterSales(
      OrderDetailEntity order, ProductAdaptorEntity product) {
    return Future.value();
  }

  ///去选品
  Future<bool?> selectProduct(
      OrderDetailEntity order, ProductAdaptorEntity product) {
    if (!product.signet) {
      product.shakeAnimationController.start();
      ToastKit.warning("请先确认测装数据哦");
      return Future.value(false);
    }
    Get.toNamed(AppRoutes.selectProduct,
        parameters: {
          "order_goods_id": "${product.id}",
        },
        arguments: product.tip);
    return Future.value(false);
  }

  ///删除订单
  Future delete(OrderEntity order) {
    return _repository.deleteOrder(params: {"order_id": order.id});
  }

  ///取消订单
  Future cancel(OrderEntity order) {
    return openCancelOrderDialog(Get.context!, order.cancelOrderMessage)
        .then((value) {
      if (value == true) {
        return openCancelOrderModal(Get.context!, order.reason).then((value) {
          if (value is String) {
            return _repository.cancelOrder(
                params: {"order_id": order.id, "order_close_reason": value});
          }
        });
      }
    });
  }

  ///确认选品
  Future select(OrderEntity order) {
    return Get.toNamed(AppRoutes.orderDetail + "/${order.id}") ??
        Future.value();
  }

  ///支付尾款
  Future payBalance(OrderEntity order) {
    return Get.toNamed(AppRoutes.pay,
            arguments: CreateOrderParamsEntity(
                orderId: "${order.id}",
                totalPrice: order.amount,
                path: "/app/order/finalPay")) ??
        Future.value();
  }

  ///支付尾款
  Future pay(OrderEntity order) {
    return Get.toNamed(AppRoutes.pay,
            arguments: CreateOrderParamsEntity(
                orderId: "${order.id}",
                totalPrice: order.amount,
                path: "/app/order/orderPay")) ??
        Future.value();
  }
}
