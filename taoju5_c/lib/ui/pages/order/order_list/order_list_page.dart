/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:43:30
 * @LastEditTime: 2021-07-15 11:20:10
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_list/widget/order_card.dart';

import 'order_list_skeleton.dart';

class OrderListPage extends GetView<OrderListParentController> {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的订单"),
        actions: [
          IconButton(
              icon: Image.asset(R.image.find),
              onPressed: () => Get.toNamed(AppRoutes.search,
                  parameters: {"search_type": '2'}))
        ],
      ),
      body: Column(
        children: [
          GetBuilder<OrderListParentController>(builder: (_) {
            return Container(
              color: R.color.ffffffff,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  IndexedStack(
                    alignment: AlignmentDirectional.center,
                    index: _.open ? 1 : 0,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
                        child: TabBar(
                            isScrollable: true,
                            controller: _.tabController,
                            tabs: [
                              for (OrderTabEntity item in _.tabs)
                                Tab(child: Text(item.label))
                            ]),
                      ),
                      Positioned(
                          left: R.dimen.dp24,
                          child: Text(
                            "选择订单状态",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: R.dimen.sp13,
                                color: R.color.ff999999),
                          ))
                    ],
                  ),
                  Positioned(
                      right: R.dimen.dp8, child: Image.asset(R.image.mask)),
                  Positioned(
                      right: R.dimen.dp10,
                      child: Builder(
                        builder: (BuildContext context) {
                          return RotateButton(
                              onPressed: () => _.filter(context));
                        },
                      )),
                ],
              ),
            );
          }),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: [
              for (OrderTabEntity item in controller.tabs)
                PullToRefreshListViewBuilder<OrderListController, OrderEntity>(
                  tag: item.status,
                  loadingBuilder: (BuildContext context) => OrderListSkeleton(),
                  itemBuilder: (OrderEntity o) => OrderCard(order: o),
                )
            ],
          ))
        ],
      ),
    );
  }
}