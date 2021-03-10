/*
 * @Description: 订单详情底部
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:23:12
 * @LastEditTime: 2021-01-14 15:04:38
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_copy_button.dart';

class OrderDetailFooter extends GetView<OrderDetailController> {
  const OrderDetailFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(BDimens.gap32),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: BDimens.gap16),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: BDimens.gap16),
                  color: BColors.foregroundColor,
                  height: 32.h,
                  width: 6.w,
                ),
                Text(
                  "订单信息",
                  style: TextStyle(
                      fontSize: BDimens.sp28, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          DefaultTextStyle(
              style:
                  TextStyle(fontSize: BDimens.sp26, color: BColors.textColor),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: BDimens.gap8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("订单备注:"),
                          Text(GetUtils.isNullOrBlank(controller.order.note)
                              ? "暂无备注"
                              : "${controller.order.note}")
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: BDimens.gap8),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("订单编号:"),
                          Spacer(),
                          Container(
                              margin: EdgeInsets.only(right: BDimens.gap32),
                              child: XCopyButton(content: controller.order.no)),
                          Text("${controller.order.no}")
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: BDimens.gap8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("创建时间:"),
                          Text("${controller.order.createTime}")
                        ],
                      ),
                    ),
                    Visibility(
                      visible: controller.order.orderStatus >=
                              OrderStatus.toBeSelected &&
                          controller.order.orderStatus <
                              OrderStatus.toBeInstalled,
                      child: Container(
                          padding: EdgeInsets.only(top: BDimens.gap8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("测量时间:"),
                              Text("${controller.order.actualMeasureTime}")
                            ],
                          )),
                    ),
                    Visibility(
                      visible: controller.order.orderStatus >=
                              OrderStatus.toBeInstalled &&
                          controller.order.orderStatus <= OrderStatus.finished,
                      child: Container(
                          padding: EdgeInsets.only(top: BDimens.gap8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("安装时间:"),
                              Text("${controller.order.actualInstallTime}")
                            ],
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: BDimens.gap8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("下单人:"),
                          Text("${controller.order.username}")
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: BDimens.gap8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("客户:"),
                          Text("${controller.order.customerName}")
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: BDimens.gap8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("下单门店:"),
                          Expanded(
                              child: Text(
                            "${controller.order.shopName}",
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
