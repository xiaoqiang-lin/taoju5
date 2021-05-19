/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:43:30
 * @LastEditTime: 2021-05-18 15:36:16
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_list/widget/order_card.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的订单"),
      ),
      body: FutureLoadStateBuilder(
          controller: controller,
          builder: (OrderListController _) {
            return Column(children: [
              TabBar(isScrollable: true, controller: _.tabController, tabs: [
                for (OrderTabEntity item in _.tabs) Tab(child: Text(item.label))
              ]),
              Expanded(
                  child: TabBarView(
                controller: _.tabController,
                children: [
                  for (OrderTabEntity item in _.tabs)
                    ListView.separated(
                        itemCount: _.orders.length,
                        shrinkWrap: true,
                        separatorBuilder: (BuildContext context, int i) {
                          return Container(
                            height: R.dimen.dp10,
                            width: R.dimen.width,
                            color: R.color.fff5f5f5,
                          );
                        },
                        itemBuilder: (BuildContext context, int i) {
                          return OrderCard(order: _.orders[i]);
                        })
                ],
              ))
            ]);
          }),
    );
  }
}
