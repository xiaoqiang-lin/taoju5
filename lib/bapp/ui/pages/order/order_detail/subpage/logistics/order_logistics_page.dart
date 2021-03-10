import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/order_logistics_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';

import 'widget/packet_logistics_card.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';

class OrderLogisticsPage extends StatelessWidget {
  const OrderLogisticsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        appBar: AppBar(
          title: Text("订单跟踪"),
        ),
        body: GetBuilder<OrderLogisticsController>(
          builder: (_) {
            return XLoadStateBuilder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Visibility(
                      visible: _.logistics.packetList.length > 1,
                      child: Container(
                        width: Get.width,
                        color: BColors.lightBlueColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: BDimens.gap16, vertical: BDimens.gap16),
                        child: Text(
                          "订单分包裹邮寄，其中${_.logistics.hasSendCount}个已寄出",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: BColors.blueTextColor),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemCount: _.logistics.packetList.length,
                            separatorBuilder: (BuildContext context, int i) {
                              return Divider();
                            },
                            itemBuilder: (BuildContext context, int i) {
                              return PacketLogisticsCard(
                                packet: _.logistics.packetList[i],
                              );
                            }))
                  ],
                );
              },
              loadState: _.loadState,
              retry: _.loadData,
            );
          },
        ));
  }
}
