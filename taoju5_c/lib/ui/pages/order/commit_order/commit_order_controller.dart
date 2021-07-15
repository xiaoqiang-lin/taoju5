/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:15:54
 * @LastEditTime: 2021-07-14 14:43:23
 */
import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';

import 'package:taoju5_c/local_storage/local_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class CommitOrderController
    extends BaseFutureLoadStateController<PreOrderInfoEntity> {
  AddressEntity? defaultAddress;

  CreateOrderParamsEntity args = CreateOrderParamsEntity(
    products: Get.arguments ?? [],
  );

  List<ProductAdaptorEntity> products = Get.arguments ?? [];

  late PreOrderInfoEntity? order;

  double get totalPrice {
    if (order == null) return 0;
    double s = 0;
    products.forEach((e) {
      s += e.totalPrice;
    });

    ///运费
    s += order?.freightFee ?? 0;

    ///定金
    s += order?.deposit ?? 0;
    return s;
  }

  List<ProductAdaptorEntity> get finishedProducts =>
      products.where((e) => e.productType is FinishedProductType).toList();
  List<ProductAdaptorEntity> get customProducts =>
      products.where((e) => e.productType is! FinishedProductType).toList();

  ///成品总价
  double get finishedProductTotalPrice {
    double t = 0;
    for (ProductAdaptorEntity e in finishedProducts) {
      t += e.unitPrice;
    }
    return t;
  }

  ///定制品总价
  double get customProductTotalPrice {
    double t = 0;
    for (ProductAdaptorEntity e in customProducts) {
      t += e.totalPrice;
    }
    return t;
  }

  Future<PreOrderInfoEntity> loadData({Map? params}) {
    LocalStorage.get("defaultAddress").then((val) {
      if (val != null) {
        defaultAddress = AddressEntity.fromJson(jsonDecode(val));
        args.addressId = defaultAddress!.id;
      }
    }).whenComplete(() {
      update(["defaultAddress"]);
    });
    OrderRepository repository = OrderRepository();
    return repository.orderInfo(
        {"goods_ids": products.map((e) => e.id).join(",")}).then((value) {
      order = value;
      return value;
    });
  }

  Future? selectAddress() {
    return Get.toNamed(AppRoutes.mine + AppRoutes.addressList)?.then((value) {
      defaultAddress = value;
      update(["defaultAddress"]);
      args.addressId = defaultAddress!.id;
    });
  }

  setMeasureTime(String? val) {
    args.extra.measureTime = val;
  }

  setNeedMeasure(bool flag) {
    args.needMeasure = flag;
  }

  setInstallTime(String? val) {
    args.extra.installTime = val;
  }

  setWindowCount(String? val) {
    args.extra.windowCount = val;
  }

  setOrderRemark(String val) {
    args.orderRemark = val;
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future? submit() {
    args.totalPrice = totalPrice;

    /// 如果商品的数量是0 说明是测量单 如果大于0 说明是选品单
    args.path = products.length > 0
        ? "/app/order/orderCreate"
        : "/app/order/orderMeasureCreate";
    return Get.toNamed(AppRoutes.pay, arguments: args);
  }
}
