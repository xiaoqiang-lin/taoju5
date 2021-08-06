/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:43:30
 * @LastEditTime: 2021-07-30 15:45:04
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_list/widget/order_card.dart';

import 'order_list_skeleton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderListParentController>(
        autoRemove: true,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("我的订单"),
              actions: [
                IconButton(
                    icon: Image.asset(R.image.find),
                    onPressed: () => Get.toNamed(AppRoutes.search,
                        parameters: {"search_type": '2'}))
              ],
              bottom: PreferredSize(
                  child: GetBuilder<OrderListParentController>(builder: (_) {
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: R.dimen.dp10),
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
                              right: R.dimen.dp8,
                              child: Image.asset(R.image.mask)),
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
                  preferredSize: Size.fromHeight(kTextTabBarHeight)),
            ),
            body: TabBarView(
              controller: _.tabController,
              children: [
                for (OrderTabEntity item in _.tabs)
                  GetBuilder<OrderListController>(
                      tag: item.status,
                      autoRemove: false,
                      builder: (_) {
                        return FutureLoadStateBuilder<OrderListController>(
                            controller: _,
                            loadingBuilder: (_) => OrderListSkeleton(),
                            emptyBuilder: (ctx) => Container(
                                  child: SmartRefresher(
                                    controller: _.refreshController!,
                                    enablePullDown: true,
                                    enablePullUp: true,
                                    onRefresh: _.refreshData,
                                    onLoading: _.loadMore,
                                    child: SingleChildScrollView(
                                      controller: _.scrollController,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: R.dimen.dp48),
                                            child: Image.asset(R.image.empty),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: R.dimen.dp30,
                                                bottom: R.dimen.dp10),
                                            child: Text(
                                              "这里暂时是空的哦~",
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp14,
                                                  color: R.color.ff666666),
                                            ),
                                          ),
                                          Divider(
                                            height: R.dimen.dp10,
                                            thickness: R.dimen.dp10,
                                            color: R.color.fff5f5f5,
                                          ),
                                          CommendationFragment(
                                            scrollController:
                                                _.scrollController,
                                            tag:
                                                "orderList-${_.category.status}",
                                            header: Container(
                                              margin: EdgeInsets.only(
                                                  left: R.dimen.dp24,
                                                  top: R.dimen.dp24,
                                                  bottom: R.dimen.dp15),
                                              child: Text(
                                                "为你推荐",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: R.dimen.sp15,
                                                    color: R.color.ff333333),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            builder: (_) {
                              return SmartRefresher(
                                controller: _.refreshController!,
                                enablePullDown: true,
                                enablePullUp: true,
                                onRefresh: _.refreshData,
                                onLoading: _.loadMore,
                                child: CustomScrollView(
                                  controller: _.scrollController,
                                  slivers: [
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int i) {
                                      return OrderCard(order: _.orders[i]);
                                    }, childCount: _.orders.length)),
                                    SliverToBoxAdapter(
                                      child: GetBuilder<OrderListController>(
                                          tag: item.status,
                                          id: "recommend",
                                          builder: (_) {
                                            return Visibility(
                                              visible: _.recommend,
                                              child: CommendationFragment(
                                                scrollController:
                                                    _.scrollController,
                                                tag:
                                                    "orderList-${_.category.status}",
                                                header: Container(
                                                  margin: EdgeInsets.only(
                                                      left: R.dimen.dp24,
                                                      top: R.dimen.dp24,
                                                      bottom: R.dimen.dp15),
                                                  child: Text(
                                                    "为你推荐",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: R.dimen.sp15,
                                                        color:
                                                            R.color.ff333333),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                    // SliverToBoxAdapter(
                                    //   child: PullToRefreshListViewBuilder<OrderListController,
                                    //       OrderEntity>(
                                    //     tag: item.status,
                                    // loadingBuilder: (BuildContext context) =>
                                    //     OrderListSkeleton(),
                                    //     itemBuilder: (OrderEntity o) => OrderCard(order: o),
                                    //   ),
                                    // )
                                  ],
                                ),
                              );
                            });
                      })
              ],
            ),
            // body: CustomScrollView(
            //   slivers: [
            //     // SliverToBoxAdapter(
            //     //   child: GetBuilder<OrderListParentController>(builder: (_) {
            //     //     return Container(
            //     //       color: R.color.ffffffff,
            //     //       child: Stack(
            //     //         alignment: AlignmentDirectional.center,
            //     //         children: [
            //     //           IndexedStack(
            //     //             alignment: AlignmentDirectional.center,
            //     //             index: _.open ? 1 : 0,
            //     //             children: [
            //     //               Container(
            //     //                 padding:
            //     //                     EdgeInsets.symmetric(horizontal: R.dimen.dp10),
            //     //                 child: TabBar(
            //     //                     isScrollable: true,
            //     //                     controller: _.tabController,
            //     //                     tabs: [
            //     //                       for (OrderTabEntity item in _.tabs)
            //     //                         Tab(child: Text(item.label))
            //     //                     ]),
            //     //               ),
            //     //               Positioned(
            //     //                   left: R.dimen.dp24,
            //     //                   child: Text(
            //     //                     "选择订单状态",
            //     //                     style: TextStyle(
            //     //                         fontWeight: FontWeight.w500,
            //     //                         fontSize: R.dimen.sp13,
            //     //                         color: R.color.ff999999),
            //     //                   ))
            //     //             ],
            //     //           ),
            //     //           Positioned(
            //     //               right: R.dimen.dp8, child: Image.asset(R.image.mask)),
            //     //           Positioned(
            //     //               right: R.dimen.dp10,
            //     //               child: Builder(
            //     //                 builder: (BuildContext context) {
            //     //                   return RotateButton(
            //     //                       onPressed: () => _.filter(context));
            //     //                 },
            //     //               )),
            //     //         ],
            //     //       ),
            //     //     );
            //     //   }),
            //     // ),
            //     // SliverToBoxAdapter(
            //       // child: TabBarView(
            //       //   controller: controller.tabController,
            //       //   children: [
            //       //     for (OrderTabEntity item in controller.tabs)
            //       //       PullToRefreshListViewBuilder<OrderListController,
            //       //           OrderEntity>(
            //       //         tag: item.status,
            //       //         loadingBuilder: (BuildContext context) =>
            //       //             OrderListSkeleton(),
            //       //         itemBuilder: (OrderEntity o) => OrderCard(order: o),
            //       //       )
            //       //   ],
            //       // ),
            //     // ),
            //     // SliverToBoxAdapter(
            //     //   child: CommendationFragment(
            //     //     tag: "orderList",
            //     //     header: Container(
            //     //       margin: EdgeInsets.only(
            //     //           left: R.dimen.dp24,
            //     //           top: R.dimen.dp24,
            //     //           bottom: R.dimen.dp15),
            //     //       child: Text(
            //     //         "为你推荐",
            //     //         style: TextStyle(
            //     //             fontWeight: FontWeight.w600,
            //     //             fontSize: R.dimen.sp15,
            //     //             color: R.color.ff333333),
            //     //       ),
            //     //     ),
            //     //   ),
            //     // )
            //   ],
            // ),
          );
        });
  }
}
