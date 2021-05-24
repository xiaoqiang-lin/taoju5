/*
 * @Description: 订单详情页面
 * @Author: iamsmiling
 * @Date: 2021-05-17 18:24:40
 * @LastEditTime: 2021-05-24 15:04:44
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/section/order_detail_body.dart';

import 'section/order_detail_footer.dart';
import 'section/order_detail_header.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单详情"),
      ),
      body: FutureLoadStateBuilder(
          controller: controller,
          builder: (OrderDetailController _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  OrderDetailHeader(order: controller.order),
                  Divider(
                      thickness: R.dimen.dp10,
                      color: R.color.fff5f5f5,
                      height: R.dimen.dp10),
                  OrderDetailBody(order: controller.order),
                  Divider(
                      thickness: R.dimen.dp10,
                      color: R.color.fff5f5f5,
                      height: R.dimen.dp10),
                  OrderDetailFooter(order: controller.order),
                ],
              ),
            );
          }),
      bottomNavigationBar: GetBuilder<OrderDetailController>(builder: (_) {
        return Container(
          decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, -1),
                color: Colors.black.withAlpha(18))
          ]),
          padding: EdgeInsets.symmetric(
              vertical: R.dimen.dp14, horizontal: R.dimen.dp20),
          margin: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (OrderActionButtonEntity a in _.actions)
                PrimaryButton(
                  text: a.text,
                  onPressed: _.actionMap[a.action],
                  margin: EdgeInsets.only(left: R.dimen.dp10),
                  size: PrimaryButtonSize.middle,
                  mode: a.mode,
                ),
              PrimaryButton(
                text: "售后维权",
                onPressed: () => Get.toNamed(
                    Get.currentRoute + AppRoutes.afterSell,
                    arguments: _.order),
                margin: EdgeInsets.only(left: R.dimen.dp10),
                size: PrimaryButtonSize.middle,
                mode: PrimaryButtonMode.elevatedButton,
              )
            ],
          ),
        );
      }),
    );
  }
}
