import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';

import '../order_detail_controller.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderAddressCard extends GetView<OrderDetailController> {
  const OrderAddressCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "收货人:${controller.order.receiverNameAttr}   ${controller.order.receiverTel}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: BColors.textColor,
                      fontSize: BDimens.sp28,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: EdgeInsets.only(top: BDimens.gap4),
                  child: Text("收货地址:${controller.order.receiverAddress}",
                      style: TextStyle(
                          fontSize: BDimens.sp24,
                          color: BColors.subTitleColor)),
                ),
              ],
            ),
          ),
          // Spacer(),
          // Icon(BIcons.next, size: BDimens.sp48)
        ],
      ),
    );
  }
}
