/*
 * @Description: 订单提交成功
 * @Author: iamsmiling
 * @Date: 2021-06-11 17:09:01
 * @LastEditTime: 2021-06-25 14:58:45
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:taoju5_c/ui/pages/order/commit_order_success/commit_order_success_controller.dart';

class CommitOrderSuccessPage extends GetView<CommitOrderSuccessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        onLoading: controller.loadMore,
        // onRefresh: Get.find<>(),
        controller: controller.refreshController,
        scrollController: controller.scrollController,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: R.dimen.dp20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: R.dimen.dp6),
                              child: Image.asset(R.image.checkedMid)),
                          Text(
                            "订单已支付",
                            style: TextStyle(
                                fontSize: R.dimen.sp16,
                                color: R.color.ff333333,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryButton(
                          text: "返回首页",
                          onPressed: () => Get.offAllNamed(AppRoutes.main),
                          mode: PrimaryButtonMode.inkwellButton,
                          size: PrimaryButtonSize.middle,
                          margin: EdgeInsets.only(right: R.dimen.dp20),
                          constraints: BoxConstraints(
                              maxHeight: R.dimen.dp32, maxWidth: R.dimen.dp84),
                        ),
                        PrimaryButton(
                          text: "查看订单",
                          onPressed: () {},
                          mode: PrimaryButtonMode.inkwellButton,
                          size: PrimaryButtonSize.middle,
                          constraints: BoxConstraints(
                              maxHeight: R.dimen.dp32, maxWidth: R.dimen.dp84),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(
                    top: R.dimen.dp30,
                    left: R.dimen.dp24,
                    bottom: R.dimen.dp15),
                child: Text(
                  "为你推荐",
                  style: TextStyle(
                      fontSize: R.dimen.sp15,
                      color: R.color.ff333333,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CommendationFragment(
                scrollController: controller.scrollController,
                tag: "order",
              ),
            )
          ],
        ),
      ),
    );
  }
}
