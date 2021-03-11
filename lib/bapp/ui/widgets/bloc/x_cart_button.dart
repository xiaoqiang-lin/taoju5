/*
 * @Description: 购物车按钮
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:29:34
 * @LastEditTime: 2021-02-01 11:25:24
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/utils/common_kit.dart';
import 'package:taoju5/xdio/x_dio.dart';

class XCartCountController extends GetxController {
  CustomerProviderController customerProvider =
      Get.find<CustomerProviderController>();
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
      Get.find<CustomerProviderController>()
          .updateCartCount("${response.data}");
    });
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
    return GetBuilder<XCartCountController>(
        // init: XCountController(),
        builder: (_) {
      return GestureDetector(
        onTap: _.jump,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         fit: BoxFit.cover, image: AssetImage(imageUrl))),
            child: Image.asset(imageUrl),
          ),
          Positioned(
            right: 0,
            top: 4,
            child: GetBuilder<CustomerProviderController>(
                id: "count",
                builder: (_) {
                  return Visibility(
                    visible: !CommonKit.isNullOrZero(_.customer?.cartCount),
                    child: Container(
                      width: 16,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: BColors.badgeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${_.customer?.cartCount}",
                        style: TextStyle(
                            color: BColors.primaryColor, fontSize: 12),
                      ),
                    ),
                  );
                }),
          )
        ]),
      );
    });
  }
}
