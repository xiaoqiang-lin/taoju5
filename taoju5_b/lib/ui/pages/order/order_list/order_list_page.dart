/*
 * @Description: 订单列表页面
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:24:06
 * @LastEditTime: 2021-02-02 17:21:32
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/res/b_icons.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_skeleton.dart';
import 'package:taoju5_b/ui/pages/search/search_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5_b/ui/widgets/common/button/x_rotation_arrow.dart';

import 'fragement/order_tab_view.dart';

class OrderListPage extends GetView<OrderListParentController> {
  const OrderListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.back,
      child: Scaffold(
        appBar: AppBar(
          title: Text("订单列表"),
          actions: [
            IconButton(
                icon: Icon(BIcons.search),
                onPressed: () => Get.toNamed(
                    BAppRoutes.search + "?searchType=${SearchType.order.index}",
                    arguments: SearchType.order))
          ],
          bottom: PreferredSize(
              child: Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      GetBuilder<OrderListParentController>(
                          id: "tab",
                          builder: (_) {
                            return IndexedStack(
                              index: controller.showFilterPanel ? 0 : 1,
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: BDimens.gap16),
                                    child: Text("请选择订单时间")),
                                Container(
                                  margin: EdgeInsets.only(right: 36),
                                  child: TabBar(
                                      controller: controller.tabController,
                                      isScrollable: true,
                                      tabs: [
                                        for (OrderStatusTabModel tab
                                            in controller.tabList)
                                          Obx(() => Text(
                                              "${tab.name}(${tab.count.value})"))
                                      ]),
                                ),
                              ],
                            );
                          }),
                      Positioned(
                          right: 0,
                          child: Container(
                            color: Get.theme.primaryColor,
                            padding:
                                EdgeInsets.symmetric(horizontal: BDimens.gap16),
                            child: Row(
                              children: [
                                Container(
                                    width: 1.2,
                                    height: 18,
                                    color: Color(0xFFD4D4D4)),
                                XRotationArrow(
                                    onTap: () => controller.filter(context))
                              ],
                            ),
                          ))
                    ],
                  );
                },
              ),
              preferredSize: Size.fromHeight(36.0)),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [
            for (OrderStatusTabModel tab in controller.tabList)
              Container(
                key: ValueKey(tab.name),
                child: GetBuilder<OrderListController>(
                  init: OrderListController(status: tab.status),
                  tag: tab.name,
                  autoRemove: false,
                  builder: (_) {
                    return XLoadStateBuilder(
                        loadState: _.loadState,

                        // retry: _.l,
                        loadingWidget: OrderListSkeleton(),
                        builder: (BuildContext context) {
                          return OrderTabView(
                            refreshController: _.refreshController,
                            onRefresh: _.refreshData,
                            onLoading: _.loadMore,
                            enablePullDown: true,
                            enablePullUp: true,
                            orderList: _.orderList,
                          );
                          // return SmartRefresher(
                          //   controller: _.refreshController,
                          //   onRefresh: _.refreshData,
                          //   onLoading: _.loadMore,
                          //   enablePullDown: true,
                          //   enablePullUp: true,
                          //   child: ListView.separated(
                          //       separatorBuilder: (BuildContext context, int i) {
                          //         return Divider(
                          //           height: BDimens.gap16,
                          //         );
                          //       },
                          //       itemCount: _.orderList.length,
                          //       itemBuilder: (BuildContext context, int i) {
                          //         OrderModel e = _.orderList[i];
                          //         return OrderCard(order: e);
                          //       }),
                          // );
                        });
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
