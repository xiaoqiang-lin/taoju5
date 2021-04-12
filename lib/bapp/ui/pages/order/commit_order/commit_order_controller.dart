/*
 * @Description: 提交订单
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:49:00
 * @LastEditTime: 2021-01-22 23:46:32
 */
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/domain/model/product/product_adapter_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/domain/model/user/user_info_model.dart';
import 'package:taoju5/bapp/domain/repository/order/order_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/product_share/product_share_controller.dart';
import 'package:taoju5/validator/params_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CommitOrderEvent {
  List<ProductAdapterModel> productList;
  OrderType orderType;

  CommitOrderEvent({@required this.productList, @required this.orderType});
}

///测量单参数模型
class OptionalOrderParamsModel {
  DateTime measureTime;
  DateTime installTime;
  String deposit;
  String note;
  String windowCount;

  OptionalOrderParamsModel(
      {this.measureTime,
      this.installTime,
      this.deposit,
      this.note = "",
      this.windowCount = ""});

  Map get params => {
        "order_earnest_money": deposit ?? '',
        "measure_time": measureTime ?? '',
        "install_time": installTime ?? '',
        "order_remark": note ?? '',
        "order_window_num": windowCount ?? '',
      };
}

///选品单参数模型
class CommitOrderParamsModel extends ParamsValidator {
  List<ProductAdapterModel> productList;
  OptionalOrderParamsModel optionalParams;
  CustomerDetailModel get customer =>
      Get.find<CustomerProviderController>().customer;
  CommitOrderParamsModel(
      {@required this.optionalParams, @required this.productList});
  String get measureId =>
      productList
          ?.map((e) => (e.productType is CurtainProductType ? e.measureId : 0))
          ?.join(",") ??
      "";
  String get productSku => productList
      .map((e) =>
          "${e?.skuId ?? 0}:${e.count ?? 1}:${e?.length ?? 0}:${e?.totalPrice}")
      .join(",");

  String get cartId => productList.map((e) => "${e.cartId}").join(",");

  String get attribute =>
      jsonEncode(productList.map((e) => "${e?.attribute}")?.toList() ?? []);

  String get shopId => "${Get.find<UserProviderController>().user.shopId}";
  Map get params {
    Map map = optionalParams.params;
    map.addAll({
      'measure_id': measureId,
      "client_uid": customer?.id,
      "cart_id": cartId,
      "shop_id": shopId,
      "wc_attr": attribute,
      "client_info": customer?.toJson(),
      "data": """{
        "order_type": "1",
        "point": "0",
        "pay_type": "10",
        "shipping_info": {"shipping_type": "1", "shipping_company_id": "0"},
        "coupon_id": "0",
        "order_tag": "2",
        "address_id": "${customer?.address?.addressId}",
        "goods_sku_list": "$productSku"
      }"""
    });
    return map;
  }

  @override
  bool validate({flag}) {
    return isNullOrBlank(customer?.addressId, message: "收货地址不能为空哦");
  }

  bool isAddressNull() {
    return isNullOrBlank(customer?.addressId, message: "收货地址不能为空哦");
  }

  bool isOrderDepositNullOrBlank() {
    return isNullOrBlank(optionalParams?.deposit, message: "请填写定金");
  }
}

class CommitOrderController extends GetxController {
  OrderRepository _repository = OrderRepository();
  List<ProductAdapterModel> productList;

  CommitOrderParamsModel params;

  OrderType orderType;

  ScrollController scrollController;

  @override
  void onInit() {
    CommitOrderEvent event = Get.arguments;
    productList = event.productList;
    orderType = event.orderType;
    params = CommitOrderParamsModel(
        optionalParams: OptionalOrderParamsModel(), productList: productList);
    scrollController = ScrollController();
    super.onInit();
  }

  bool get isFromShare => Get.isRegistered<ProductShareController>();

  UserProviderController get userProviderController =>
      Get.find<UserProviderController>();
  double get totalPrice {
    if (GetUtils.isNullOrBlank(productList)) return 0;
    double total = 0;
    for (ProductAdapterModel prodcut in productList) {
      total += prodcut.totalPrice;
    }
    return total;
  }

  UserInfoModel get user => userProviderController.user;

  CustomerProviderController get customerProviderController =>
      Get.find<CustomerProviderController>();

  CustomerDetailModel get customer => customerProviderController.customer;

  void scrollToBottom() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //build完成后的回调
      scrollController.animateTo(
        scrollController.position.maxScrollExtent, //滚动到底部
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void scrollToTop() {
    scrollController.animateTo(
      0, //滚动到底部
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future submitOrder() {
    if (!params.isAddressNull()) {
      scrollToTop();
      throw Future.value(false);
    }

    if (productList.any((e) => e.productType is CurtainProductType) ||
        orderType == OrderType.measureOrder) {
      if (!params.isOrderDepositNullOrBlank()) {
        ///滚动到底部
        scrollToBottom();
        throw Future.value(false);
      }
    }

    return _repository
        .submitOrder(
            params: params.params,
            isMeasureOrder: orderType == OrderType.measureOrder,
            isWeb: GetPlatform.isWeb)
        .then((value) {
      onSubmitSuceess();
    });
  }

  Future onSubmitSuceess() async {
    return Get.toNamed(BAppRoutes.commitOrderSuccess);
  }

  @override
  void onClose() {
    scrollController?.dispose();
    super.onClose();
  }

  Future editAddress() {
    if (!isFromShare && GetUtils.isNullOrBlank(customer?.id)) {
      EasyLoading.showInfo("请先选择客户哦");
      return Future.error(false);
    }
    return Get.toNamed(BAppRoutes.customerAddressEdit + "/${customer?.id}",
        arguments: customer);
  }
}
