/*
 * @Description: 商品清单
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:41:12
 * @LastEditTime: 2021-06-04 10:47:48
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/mainfest/widget/order_mainfest_card.dart';

class OrderMainfestPage extends GetView<OrderMainfestController> {
  const OrderMainfestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品清单"),
      ),
      body: FutureLoadStateBuilder<OrderMainfestController>(
          controller: controller,
          loadingBuilder: (BuildContext context) => SizedBox.shrink(),
          builder: (_) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    OrderMainfestCard(mainfest: _.mainfest.customProduct),
                    Divider(
                      color: R.color.fff5f5f5,
                      height: R.dimen.dp10,
                      thickness: R.dimen.dp10,
                    ),
                    OrderMainfestCard(mainfest: _.mainfest.finishedProduct),
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              offset: Offset(0, -1),
              color: Colors.black.withAlpha(18))
        ]),
        padding: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom + R.dimen.dp20,
            top: R.dimen.dp20,
            right: R.dimen.dp24),
        child: GetBuilder<OrderMainfestController>(
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text("订单总金额：",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: R.dimen.sp14,
                          color: R.color.ff181818)),
                ),
                Text(
                  "${_.mainfest.totalPrice}",
                  style: TextStyle(
                      fontSize: R.dimen.sp14,
                      color: R.color.ffff5005,
                      fontWeight: FontWeight.w600),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
