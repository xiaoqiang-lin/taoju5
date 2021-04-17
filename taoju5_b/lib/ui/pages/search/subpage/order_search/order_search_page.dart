import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/order/order_list/fragement/order_tab_view.dart';
import 'package:taoju5_b/ui/pages/order/order_list/order_list_skeleton.dart';
import 'package:taoju5_b/ui/pages/search/subpage/order_search/order_search_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_loadstate_builder.dart';

class OrderSearchPage extends StatelessWidget {
  const OrderSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单搜索结果"),
      ),
      body: GetBuilder<OrderSearchController>(
        builder: (_) {
          return XLoadStateBuilder(
            loadState: _.loadState,
            loadingWidget: OrderListSkeleton(),
            retry: _.loadData,
            builder: (BuildContext context) {
              return OrderTabView(
                  refreshController: _.refreshController,
                  orderList: _.orderList);
            },
          );
        },
      ),
    );
  }
}
