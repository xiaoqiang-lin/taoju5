/*
 * @Description: 提交订单成功的页面
 * @Author: iamsmiling
 * @Date: 2021-01-08 10:28:55
 * @LastEditTime: 2021-01-25 10:10:22
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/product_share/product_share_controller.dart';

class CommitOrderSuccessPage extends GetView<CustomerProviderController> {
  const CommitOrderSuccessPage({Key key}) : super(key: key);

  bool get isFromShare => Get.isRegistered<ProductShareController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (isFromShare) {
          Get.until((route) =>
              RegExp(BAppRoutes.productShare).hasMatch(Get.currentRoute));
        } else {
          Get.offAllNamed(BAppRoutes.home);
          controller.clear();
        }
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: BColors.primaryColor,
        appBar: AppBar(
          title: Text("提交成功"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/" + "success.png"),
              Container(
                margin: EdgeInsets.only(top: BDimens.gap32),
                child: Text(
                  "等待师傅上门测量尺寸~\n请在测量完成后支付尾款",
                  style: TextStyle(color: BColors.greyTextColor),
                ),
              ),
              Visibility(
                  visible: !isFromShare,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: BDimens.gap32),
                        child: OutlinedButton(
                          onPressed: () {
                            Get.until((route) => (RegExp(BAppRoutes.productList)
                                    .hasMatch(Get.currentRoute) ||
                                RegExp(BAppRoutes.selectableProductList)
                                    .hasMatch(Get.currentRoute)));
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: BDimens.gap16),
                            child: Text("继续挑选"),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: BDimens.gap16),
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(BAppRoutes.orderList +
                                  "?customerId=${controller.id}")
                              .then((value) {
                            controller.clear();
                          }),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: BDimens.gap16),
                            child: Text("查看订单"),
                          ),
                        ),
                      ),
                    ],
                  )),
              Visibility(
                visible: isFromShare,
                child: Container(
                  margin: EdgeInsets.only(top: 48),
                  child: ElevatedButton(
                    onPressed: () => Get.until((route) =>
                        RegExp(BAppRoutes.productShare)
                            .hasMatch(Get.currentRoute)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Text("返回商品"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
