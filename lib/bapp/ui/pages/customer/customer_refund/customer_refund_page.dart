import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_refund/customer_refund_controller.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/fragement/order_tab_view.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/order_list_skeleton.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:get/get.dart';

class CustomerRefundPage extends StatelessWidget {
  const CustomerRefundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("退单/售后"),
      ),
      body: GetBuilder<CustomerRefundController>(builder: (_) {
        return XLoadStateBuilder(
            loadState: _.loadState,
            retry: _.loadData,
            loadingWidget: OrderListSkeleton(),
            builder: (BuildContext context) {
              return OrderTabView(
                  orderList: _.orderList,
                  refreshController: _.refreshController);
            });
      }),
    );
  }
}
