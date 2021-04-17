/*
 * @Description: 提交订单页面
 * @Author: iamsmiling
 * @Date: 2020-12-22 15:46:52
 * @LastEditTime: 2021-01-22 16:23:50
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taoju5_b/domain/model/order/order_type.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5_b/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5_b/ui/pages/order/commit_order/fragment/commit_order_body.dart';
import 'package:taoju5_b/ui/widgets/bloc/x_customer_choose_button.dart';
import 'package:taoju5_b/ui/widgets/common/button/x_future_button.dart';

import 'fragment/commit_order_footer.dart';
import 'fragment/commit_order_header.dart';
import 'fragment/commit_order_tip.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
            "${controller.orderType == OrderType.measureOrder ? '预约测量' : '提交订单'}"),
        actions: [
          Visibility(
              visible: !controller.isFromShare,
              child: XCustomerChooseButton(
                event: ChooseCustomerEventModel(
                    canChoose: true, fromUrl: Get.currentRoute),
              ))
        ],
      ),
      body: GetBuilder<CommitOrderController>(
        builder: (_) {
          return SingleChildScrollView(
            controller: _.scrollController,
            child: Column(
              children: [
                CommitOrderHeader(),
                CommitOrderBody(),
                CommitOrderFooter(),
                CommitOrderTip()
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        color: BColors.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: controller.orderType != OrderType.measureOrder,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "共${controller.productList.length}件",
                    style: TextStyle(fontSize: BDimens.sp24),
                  ),
                  Row(
                    children: [
                      Text(
                        "¥${controller.totalPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: BColors.highLightColor,
                            fontSize: BDimens.sp36,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "(具体金额以门店为准)",
                        style: TextStyle(
                            fontSize: BDimens.sp20,
                            color: BColors.greyTextColor),
                      )
                    ],
                  )
                ],
              ),
            ),
            XFutureButton(
              onFuture: controller.submitOrder,
              // onSuccess: controller.onSubmitSuceess,
              child: Text("提交订单"),
            ),
          ],
        ),
      ),
    );
  }
}
