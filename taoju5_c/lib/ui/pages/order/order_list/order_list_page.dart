/*
 * @Description: 订单列表
 * @Author: iamsmiling
 * @Date: 2021-05-13 15:43:30
 * @LastEditTime: 2021-05-20 14:29:16
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/rotate_button.dart';
import 'package:taoju5_c/component/dropdown_menu/drop_select_menu.dart';
import 'package:taoju5_c/component/dropdown_menu/dropdown_menu.dart';
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
            // return DropSelectMenuContainer(
            //   child: Column(children: [
            //     Stack(
            //       alignment: AlignmentDirectional.center,
            //       children: [
            //         Container(
            //           padding: EdgeInsets.symmetric(horizontal: R.dimen.dp10),
            //           child: TabBar(
            //               isScrollable: true,
            //               controller: _.tabController,
            //               tabs: [
            //                 for (OrderTabEntity item in _.tabs)
            //                   Tab(child: Text(item.label))
            //               ]),
            //         ),
            //         Positioned(
            //             right: R.dimen.dp8, child: Image.asset(R.image.mask)),
            //         Positioned(
            //             right: R.dimen.dp10,
            //             child: RotateButton(
            //                 onPressed: () =>
            //                     Future.delayed(Duration(seconds: 1))))
            //       ],
            //     ),
            //     Expanded(
            //         child: Stack(
            //       children: [
            //         TabBarView(
            //           controller: _.tabController,
            //           children: [
            //             for (OrderTabEntity item in _.tabs)
            //               ListView.separated(
            //                   itemCount: _.orders.length,
            //                   shrinkWrap: true,
            //                   separatorBuilder: (BuildContext context, int i) {
            //                     return Container(
            //                       height: R.dimen.dp10,
            //                       width: R.dimen.width,
            //                       color: R.color.fff5f5f5,
            //                     );
            //                   },
            //                   itemBuilder: (BuildContext context, int i) {
            //                     return OrderCard(order: _.orders[i]);
            //                   })
            //           ],
            //         ),
            //         DropSelectMenu(
            //           maxMenuHeight: MediaQuery.of(context).size.height * .5,
            //           controller: null,
            //         )
            //       ],
            //     ))
            //   ]),
            // );
            return Column(children: [
              Stack(
                alignment: AlignmentDirectional.center,
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
                      right: R.dimen.dp8, child: Image.asset(R.image.mask)),
                  Positioned(
                      right: R.dimen.dp10,
                      child: RotateButton(
                          onPressed: () =>
                              Future.delayed(Duration(seconds: 1))))
                ],
              ),
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
