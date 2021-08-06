/*
 * @Description: 订单搜索
 * @Author: iamsmiling
 * @Date: 2021-07-28 14:48:58
 * @LastEditTime: 2021-07-28 16:02:57
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/net/pull_to_refresh_list_view_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_skeleton.dart';
import 'package:taoju5_c/ui/pages/order/order_list/widget/order_card.dart';
import 'package:taoju5_c/ui/pages/search/subpage/order_search_list/search_order_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchOrderPage extends StatelessWidget {
  const SearchOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchOrderController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
              title: GestureDetector(
            onTap: _.search,
            child: Container(
              margin: EdgeInsets.only(right: R.dimen.dp20),
              padding: EdgeInsets.symmetric(
                  horizontal: R.dimen.dp15, vertical: R.dimen.dp8),
              width: R.dimen.width,
              decoration: BoxDecoration(
                  color: R.color.fff5f5f5,
                  borderRadius: BorderRadius.circular(R.dimen.sp30)),
              child: Text(
                _.keyword,
                key: ValueKey(_.keyword),
                style: TextStyle(
                    fontSize: R.dimen.sp12,
                    color: R.color.ff333333,
                    fontWeight: FontWeight.normal),
              ),
            ),
          )),
          body: PullToRefreshListViewBuilder<OrderListController, OrderEntity>(
            tag: "-1",
            loadingBuilder: (BuildContext context) => OrderListSkeleton(),
            itemBuilder: (OrderEntity o) => OrderCard(order: o),
            emptyBuilder: (BuildContext context) {
              return SmartRefresher(
                controller: _.refreshController,
                enablePullDown: true,
                enablePullUp: true,
                onRefresh: _.refreshData,
                onLoading: _.loadMore,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: R.dimen.dp36),
                              child: Image.asset(R.image.empty),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: R.dimen.dp30),
                              child: Text(
                                "这里暂时是空的哦~",
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    color: R.color.ff666666),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CommendationFragment(
                        scrollController: _.scrollController,
                        tag: "searchOrderList-${_.keyword}",
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
                    )
                  ],
                ),
              );
            },
          ));
    });
  }
}
