/*
 * @Description: 订单工程部编辑记录
 * @Author: iamsmiling
 * @Date: 2021-05-20 16:49:38
 * @LastEditTime: 2021-05-20 17:24:42
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/order/order_edit_log_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/edit_log/order_edit_log_controller.dart';

class OrderEditLogPage extends GetView<OrderEditLogController> {
  const OrderEditLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("预约时间记录"),
      ),
      body: FutureLoadStateBuilder<OrderEditLogController>(
          controller: controller,
          builder: (OrderEditLogController _) {
            return ListView.builder(
                padding: EdgeInsets.only(
                  left: R.dimen.dp24,
                  right: R.dimen.dp24,
                ),
                itemCount: _.logs.length,
                itemBuilder: (BuildContext context, int i) {
                  OrderEditLogEntity item = _.logs[i];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: R.dimen.dp20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.content,
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ff333333,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.date,
                              style: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: R.color.ff333333,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: R.dimen.dp15, top: R.dimen.dp5),
                        child: Text(
                          item.createAt,
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff999999),
                        ),
                      ),
                      Divider()
                    ],
                  );
                });
          }),
    );
  }
}
