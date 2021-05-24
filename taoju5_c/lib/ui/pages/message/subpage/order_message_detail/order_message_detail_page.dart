/*
 * @Description:订单消息详情
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:10:35
 * @LastEditTime: 2021-05-19 16:45:52
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/message/order_message_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/message/subpage/order_message_detail/order_message_detail_controller.dart';

class OrderMessageDetailPage extends GetView<OrderMessageDetailController> {
  const OrderMessageDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单进度通知"),
      ),
      body: FutureLoadStateBuilder(
          controller: controller,
          builder: (OrderMessageDetailController _) {
            return ListView.builder(
                itemCount: _.messages.length,
                itemBuilder: (BuildContext context, int i) {
                  OrderMessageEntity item = _.messages[i];
                  return Container(
                    decoration: BoxDecoration(
                        color: R.color.fff5f5f5,
                        borderRadius: BorderRadius.circular(R.dimen.sp7)),
                    margin: EdgeInsets.symmetric(
                        vertical: R.dimen.dp15, horizontal: R.dimen.dp20),
                    padding: EdgeInsets.all(R.dimen.dp15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.status,
                              style: TextStyle(
                                  fontSize: R.dimen.sp14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.date,
                              style: TextStyle(
                                  fontSize: R.dimen.sp12,
                                  color: R.color.ffb4b4b4),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            ChimeraImage(
                              imageUrl: item.image,
                              width: R.dimen.dp50,
                              height: R.dimen.dp50,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: R.dimen.dp8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      for (OrderMessageDescriptionEntity d
                                          in item.desc)
                                        Text(
                                          d.text,
                                          style: TextStyle(
                                              fontSize: R.dimen.sp12,
                                              color: d.highlighted
                                                  ? R.color.ffff5005
                                                  : R.color.ff333333),
                                        )
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: R.dimen.dp8),
                                      child: Text(
                                        "订单编号：${item.no}",
                                        style: TextStyle(
                                            fontSize: R.dimen.sp12,
                                            color: R.color.ff333333),
                                      ))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
