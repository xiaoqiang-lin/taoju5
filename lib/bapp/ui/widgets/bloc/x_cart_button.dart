/*
 * @Description: 购物车按钮
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:29:34
 * @LastEditTime: 2021-02-01 11:25:24
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/xdio/x_dio.dart';

class XCountController extends GetxController {
  CustomerProviderController customerProvider =
      Get.find<CustomerProviderController>();
  int count = 0;
  jump() {
    if (customerProvider.isCustomerNull) {
      return EasyLoading.showError("请先选择客户哦");
    }
    return Get.toNamed(BAppRoutes.cart + "/${customerProvider.id}");
  }

  Future loadData() {
    if (customerProvider.isCustomerNull) {
      return Future.value(false);
    }
    ProductRepository repository = ProductRepository();
    return repository
        .cartCount(params: {"client_uid": customerProvider.id}).then(
            (BaseResponse response) {
      print("获取购物车数量");
      print(response.data);
      count = response.data;
      update();
    });
  }

  void setCount(int number) {
    count = number;
    update();
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}

class XCartButton extends StatelessWidget {
  final String imageUrl;
  const XCartButton(
      {Key key, this.imageUrl = "assets/images/product_detail_cart.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<XCountController>(
        // init: XCountController(),
        builder: (_) {
      return GestureDetector(
          onTap: _.jump,
          child: Column(
            children: [
              Text("${_.count}"),
              Image.asset(imageUrl),
            ],
          ));
    });
  }
}
