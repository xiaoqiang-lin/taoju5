/*
 * @Description: 物流
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:06:56
 * @LastEditTime: 2021-01-10 20:34:33
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderLogisticsCard extends GetView<OrderDetailController> {
  const OrderLogisticsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.order.orderStatus > OrderStatus.toBeDelivered,
      child: GestureDetector(
        onTap: () =>
            Get.toNamed(BAppRoutes.orderLogistics + "/${controller.order.id}"),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: BDimens.gap36, horizontal: BDimens.gap32),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: BDimens.gap24),
                child: Icon(
                  BIcons.add,
                  color: BColors.foregroundColor,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.order.station}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: BColors.textColor,
                          fontSize: BDimens.sp28,
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: BDimens.gap4),
                      child: Text("${controller.order.arriveAt}",
                          style: TextStyle(
                              fontSize: BDimens.sp24,
                              color: BColors.subTitleColor)),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Icon(BIcons.next, size: BDimens.sp48)
            ],
          ),
        ),
      ),
    );
  }
}
