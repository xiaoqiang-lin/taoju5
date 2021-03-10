/*
 * @Description: 订单安装象限信息提示
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:24:06
 * @LastEditTime: 2021-01-10 20:44:06
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderActionTipBar extends GetView<OrderDetailController> {
  const OrderActionTipBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.previewEditLog,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
              child: Row(
                children: [
                  Text("量尺预约时间:"),
                  Spacer(),
                  Text(
                    controller.order.measureTime,
                    style: TextStyle(color: BColors.subTitleColor),
                  ),
                  Visibility(
                      visible: controller.order.isMeasureTimeChanged,
                      child: Row(
                        children: [
                          Text(
                            "(已调整)",
                            style: TextStyle(color: BColors.subTitleColor),
                          ),
                          Icon(BIcons.next)
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
              child: Row(
                children: [
                  Text("安装预约时间"),
                  Spacer(),
                  Text(
                    controller.order.measureTime,
                    style: TextStyle(color: BColors.subTitleColor),
                  ),
                  Visibility(
                      visible: controller.order.isInstallTimeChanged,
                      child: Row(
                        children: [
                          Text(
                            "(已调整)",
                            style: TextStyle(color: BColors.subTitleColor),
                          ),
                          Icon(BIcons.next)
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
