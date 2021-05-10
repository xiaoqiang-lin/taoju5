/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:15:54
 * @LastEditTime: 2021-05-07 16:48:03
 */
import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/params/order/create_order_params.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';

import 'package:taoju5_c/local_storage/local_storage.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/utils/toast.dart';

class CommitOrderController extends GetxController {
  AddressEntity? defaultAddress;
  late CreateOrderParamsEntity args;
  loadData() {
    LocalStorage.get("defaultAddress").then((val) {
      if (val != null) {
        defaultAddress = AddressEntity.fromJson(jsonDecode(val));
        args = CreateOrderParamsEntity(addressId: defaultAddress!.id);
      }
    }).whenComplete(() {
      update(["defaultAddress"]);
    });
  }

  Future? selectAddress() {
    return Get.toNamed(AppRoutes.mine + AppRoutes.addressList)?.then((value) {
      defaultAddress = value;
      update(["defaultAddress"]);
    });
  }

  setMeasureTime(String? val) {
    args.extra.measureTime = val;
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

  Future submit() {
    OrderRepository repository = OrderRepository();
    ToastKit.loading();
    return repository.createMeasureOrder(args.params).then((value) {
      Get.toNamed(AppRoutes.pay);
    }).whenComplete(ToastKit.dismiss);
  }
}
