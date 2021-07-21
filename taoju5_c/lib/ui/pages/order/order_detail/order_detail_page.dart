/*
 * @Description: 订单详情页面
 * @Author: iamsmiling
 * @Date: 2021-05-17 18:24:40
 * @LastEditTime: 2021-07-19 17:41:16
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/noripple_scroll_behavior/noripple_scroll_behavior.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_skeleton.dart';
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
          loadingBuilder: (BuildContext context) => OrderDetailSkeleton(),
          builder: (OrderDetailController _) {
            return ScrollConfiguration(
              behavior: NoRippleScrollBehavior(),
              child: SingleChildScrollView(
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
              ),
            );
          }),
      bottomNavigationBar: GetBuilder<OrderDetailController>(builder: (_) {
        return Visibility(
          visible: _.actions.isNotEmpty,
          child: Container(
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
                for (OrderActionButtonEntity a in _.actions.reversed)
                  PrimaryButton(
                    text: a.text,
                    onPressed: () {
                      _.operate(a);
                    },
                    margin: EdgeInsets.only(left: R.dimen.dp10),
                    size: PrimaryButtonSize.custom,
                    textStyle: TextStyle(
                        fontSize: R.dimen.sp13, fontWeight: FontWeight.normal),
                    constraints: BoxConstraints(maxHeight: R.dimen.dp32),
                    mode: a.mode,
                    padding: EdgeInsets.symmetric(
                        horizontal: R.dimen.dp16, vertical: R.dimen.dp7),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
