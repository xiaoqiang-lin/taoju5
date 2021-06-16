/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:15:54
 * @LastEditTime: 2021-06-03 16:21:53
 */
import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';

import 'package:taoju5_c/local_storage/local_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class CommitOrderController extends GetxController {
  AddressEntity? defaultAddress;

  CreateOrderParamsEntity args =
      CreateOrderParamsEntity(products: Get.arguments ?? []);

  List<ProductAdaptorEntity> products = Get.arguments ?? [];

  List<ProductAdaptorEntity> get finishedProducts =>
      products.where((e) => e.productType is FinishedProductType).toList();
  List<ProductAdaptorEntity> get customProducts =>
      products.where((e) => e.productType is! FinishedProductType).toList();

  ///订单总价
  double get totalPrice => finishedProductTotalPrice + customProductTotalPrice;

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

  loadData() {
    LocalStorage.get("defaultAddress").then((val) {
      if (val != null) {
        defaultAddress = AddressEntity.fromJson(jsonDecode(val));
        args.addressId = defaultAddress!.id;
      }
    }).whenComplete(() {
      update(["defaultAddress"]);
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
    return Get.toNamed(AppRoutes.pay, arguments: args);
  }
}
