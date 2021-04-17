/*
 * @Description: OrderDetailController
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:35:30
 * @LastEditTime: 2021-01-28 14:01:08
 */

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/customer/customer_model.dart';
import 'package:taoju5_b/domain/model/order/order_detail_model.dart';
import 'package:taoju5_b/domain/model/order/order_detail_product_model.dart';
import 'package:taoju5_b/domain/model/order/order_price_model.dart';
// import 'package:taoju5_b/domain/model/order/order_status.dart';
import 'package:taoju5_b/domain/repository/order/order_repository.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/dialog/order/cancel_order.dart';
import 'package:taoju5_b/ui/dialog/order/cancel_product.dart';
import 'package:taoju5_b/ui/dialog/order/order_remind.dart';
import 'package:taoju5_b/ui/dialog/order/select_product.dart';
import 'package:taoju5_b/ui/modal/order/modify_price.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_controller.dart';
// import 'package:taoju5_b/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5_b/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

enum ModifyPriceMode { amount, discount }

class SelectProductParamsModel {
  int count;

  String productId;

  int orderProductId;

  OrderMeasureDataModel measureData;

  String _tag;

  CurtainProductAtrrParamsModel _attribute;

  SelectProductParamsModel(
      {this.productId,
      this.count = 1,
      @required this.orderProductId,
      @required this.measureData}) {
    this._tag = "$productId";
    this._attribute = CurtainProductAtrrParamsModel(tag: _tag);
  }

  Map get params {
    return {
      "vertical_ground_height": measureData.newDeltaY,
      "data": jsonEncode(measureData.data),
      "order_goods_id": orderProductId,
      "wc_attr": jsonEncode(_attribute.params)
    };
  }
}

///修改价格参数模型
class ModifyPriceParamsModel {
  String amount;
  String note;
  String orderId;
  ModifyPriceMode modifyPriceMode;
  String originPrice;
  String discount = "10";
  ModifyPriceParamsModel(
      {this.amount,
      this.note,
      this.orderId,
      this.originPrice = "0",
      this.modifyPriceMode = ModifyPriceMode.amount});

  Map get params => {
        "adjust_money": deltaPrice,
        "adjust_money_remark": note,
        "order_id": orderId
      };

  String get currentPrice {
    double initialPrice = double.tryParse(originPrice) ?? 0;
    double inputDiscount = double.tryParse(discount) ?? 0;
    return (initialPrice * (inputDiscount / 10))?.toStringAsFixed(2) ?? "";
  }

  ///计算差价
  String get deltaPrice {
    double initialPrice = double.tryParse(originPrice) ?? 0;
    if (modifyPriceMode == ModifyPriceMode.amount) {
      double inputPrice = double.tryParse(amount) ?? 0;
      return (inputPrice - initialPrice).toStringAsFixed(2);
    }
    double inputDiscount = double.tryParse(discount) ?? 0;
    return (initialPrice * (inputDiscount / 10)).toStringAsFixed(2);
  }

  set isAmountMode(bool flag) {
    modifyPriceMode = flag ? ModifyPriceMode.amount : ModifyPriceMode.discount;
  }
}

class CancelOrderParamsModel {
  String orderId;
  String reason;
  CancelOrderParamsModel({@required this.orderId, this.reason = ""});

  Map get params => {"order_id": orderId, "order_close_reason": reason};
}

class CancelProductParamsModel {
  String orderId;
  String productId;
  CancelProductParamsModel({@required this.orderId, @required this.productId});
  Map get params => {"order_id": orderId, "order_goods_id": productId};
}

class RemindOrderParamsModel {
  String orderId;
  String status;
  RemindOrderParamsModel({@required this.orderId, @required this.status});
  Map get params => {"order_id": orderId, "status": status};
}

class OrderDetailController extends GetxController {
  OrderRepository _repository = OrderRepository();

  OrderDetailModel order;
  XLoadState loadState = XLoadState.busy;
  final id = Get.parameters["id"];

  ///加载数据
  Future<OrderDetailModelWrapper> loadData({bool showLoading = true}) {
    loadState = XLoadState.busy;
    if (showLoading) {
      update();
    }
    return _repository.orderDetail(params: {"order_id": id}).then((value) {
      order = value.orderDetailModel;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  Future select(
      {@required String productId,
      @required int orderProductId,
      @required OrderMeasureDataModel measureData}) {
    SelectProductParamsModel selectProductArgs = SelectProductParamsModel(
        orderProductId: orderProductId,
        productId: productId,
        measureData: measureData);
    print(selectProductArgs?.params);
    return _repository
        .selectProduct(params: selectProductArgs?.params)
        .then((value) {
          refreshOrderListData();
        })
        .catchError((err) {})
        .whenComplete(() {
          Get.until((route) =>
              RegExp(BAppRoutes.orderDetail).hasMatch(Get.currentRoute));
          loadData();
        });
  }

  Future openSelectProductDialog() {
    if (order.unselectedCount > 0) {
      return showSelectProductDialog();
    }
    return submitSelectedProduct();
  }

  Future submitSelectedProduct() {
    return _repository
        .submitSelectedProduct(params: {"order_id": id}).then((value) {
      loadData(showLoading: false);
      // Get.find<OrderListController>(tag: "${order.orderStatusCode}")
      //     .refreshData();
      // Get.back(result: true);
      refreshOrderListData();
    });
  }

  Future refreshOrderListData() async {
    loadData(showLoading: false);
    OrderListParentController parentController =
        Get.find<OrderListParentController>();
    parentController.refreshData();
    Get.find<OrderListController>(tag: parentController.tag).refreshData();
  }

  Future goToSelect(OrderDetailProductModel product) {
    SelectProductEvent event = SelectProductEvent(
        customer: CustomerModel(name: order.customerName, id: order.customerId),
        orderProduct: product);
    return Get.toNamed(BAppRoutes.selectableProductList, arguments: event);
  }

  ///打开修改价格弹窗
  Future openModifyPriceModal() {
    ModifyPriceParamsModel params = ModifyPriceParamsModel(
        orderId: "${order.id}",
        amount: "${order.payAmount}",
        originPrice: "${order.originalPrice}");
    return showModifyPriceModal(params);
  }

  ///发起修改价格请求
  Future modifyPrice(ModifyPriceParamsModel model) {
    return _repository
        .modifyPrice(params: model.params)
        .then((OrderPriceModel model) {
      // order.balance = model.balance;
      // order.modifyPriceNote = model.modifyPriceNote;
      // order.payAmount = model.payAmount;
      // order.deltaPrice = model.deltaPrice;
      // update(["modifyPrice"]);
      loadData(showLoading: false);
    });
  }

  void switchModifyPriceMode() {
    update(["modifyPriceMode"]);
  }

  Future openCancelOrderDialog() {
    return showCancelOrderDialog(Get.context);
  }

  Future cancelOrder(CancelOrderParamsModel model) {
    return _repository.cancelOrder(params: model.params).then((_) {
      loadData(showLoading: false);
      // order.refundStatus = RefundStatus.toBeAuthed;
      // update(["buttonState"]);
    });
  }

  Future openCancelProductDialog(OrderDetailProductModel product) {
    return showCancelProductDialog(product: product);
  }

  Future cancelProduct(CancelProductParamsModel model,
      {@required OrderDetailProductModel product}) {
    return _repository.cancelProduct(params: model.params).then((_) {
      loadData(showLoading: false);
    });
  }

  Future openRemindOrderDialog(String title) {
    return showOrderRemindDialog(title).then((value) {
      loadData(showLoading: false);
    });
  }

  Future remind(RemindOrderParamsModel model) {
    return _repository.remind(params: model.params).then((_) {});
  }

  previewEditLog() {
    if (order.isInstallTimeChanged || order.isMeasureTimeChanged) {
      return Get.toNamed(BAppRoutes.orderLog + "/${order.id}");
    }
  }

  @override
  void onInit() {
    loadData();

    super.onInit();
  }
}
