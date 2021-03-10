/*
 * @Description: 订单列表筛选
 * @Author: iamsmiling
 * @Date: 2021-01-05 14:07:46
 * @LastEditTime: 2021-01-19 13:52:47
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';

class OrderFilterPage extends StatelessWidget {
  const OrderFilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
      color: Theme.of(context).primaryColor,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<OrderListParentController>(
              id: "time",
              builder: (_) {
                return GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 8),
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: BDimens.gap16,
                  mainAxisSpacing: BDimens.gap32,
                  childAspectRatio: 3.6,
                  children: [
                    for (OrderTimeOptionModel e in _.timeList)
                      XCheckButton(
                          isChecked: e.isChecked,
                          onPresss: () => _.selectTime(e),
                          child: Text("${e.name}"))
                  ],
                );
              },
            ),
            Container(
                margin:
                    EdgeInsets.only(top: BDimens.gap36, bottom: BDimens.gap16),
                child: Text("选择状态")),
            GetBuilder<OrderListParentController>(
              id: "status",
              builder: (_) {
                return GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: BDimens.gap16,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3.6,
                  children: [
                    for (OrderStatusTabModel tab in _.tabList)
                      XCheckButton(
                          isChecked: tab.isChecked,
                          onPresss: () => _.selectStatus(tab),
                          child: Text("${tab.name}(${tab.count})"))
                  ],
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: BDimens.gap24),
              width: Get.width,
              child: ElevatedButton(
                  onPressed: Get.find<OrderListParentController>().refreshData,
                  child: Text("确定")),
            )
          ],
        ),
      ),
    );
  }
}
