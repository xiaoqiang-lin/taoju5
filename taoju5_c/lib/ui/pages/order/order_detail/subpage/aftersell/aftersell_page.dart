/*
 * @Description: 售后页面
 * @Author: iamsmiling
 * @Date: 2021-05-20 14:57:39
 * @LastEditTime: 2021-05-24 15:53:46
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/aftersell_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/section/aftersell_footer.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/aftersell/section/aftersell_header.dart';

import 'section/aftersell_body.dart';

class AfterSellPage extends GetView<AftersellController> {
  const AfterSellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("申请售后"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AfterSellHeader(order: controller.order),
          Divider(
            height: R.dimen.dp10,
            thickness: R.dimen.dp10,
            color: R.color.fff5f5f5,
          ),
          AfterSellBody(order: controller.order),
          Divider(
            height: R.dimen.dp10,
            thickness: R.dimen.dp10,
            color: R.color.fff5f5f5,
          ),
          AfterSellFooter(controller: controller)
        ]),
      ),
      bottomNavigationBar: Container(
        // height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom,
            left: R.dimen.dp20,
            right: R.dimen.dp20),
        child: PrimaryButton(
          text: "提交",
          onPressed: controller.submit,
          padding: EdgeInsets.symmetric(vertical: R.dimen.dp13),
        ),
      ),
    );
  }
}
