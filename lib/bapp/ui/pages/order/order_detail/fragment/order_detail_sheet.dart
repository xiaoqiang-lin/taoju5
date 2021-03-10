/*
 * @Description: 修改价格相关
 * @Author: iamsmiling
 * @Date: 2021-01-13 15:48:35
 * @LastEditTime: 2021-01-15 09:10:39
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderDetailSheet extends GetView<OrderDetailController> {
  const OrderDetailSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap32),
      child: Column(
        children: [
          if (controller.order.orderType == OrderType.endProductOrder)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("总价:"), Text("¥${controller.order.deposit}")],
            )
          else
            DefaultTextStyle(
              style:
                  TextStyle(color: BColors.textColor, fontSize: BDimens.sp28),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "定金:",
                        ),
                        Text(
                          "¥${controller.order.deposit}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
                    child: GetBuilder<OrderDetailController>(
                      id: "modifyPrice",
                      builder: (_) {
                        return Visibility(
                            visible: controller.order.isPriceModified,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: BDimens.gap8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("原价:",
                                          style: TextStyle(
                                            fontSize: BDimens.sp28,
                                          )),
                                      Text(
                                        "¥${controller.order.originalPrice}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: BDimens.gap8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("修改:"),
                                      Spacer(),
                                      Text(
                                        "¥${controller.order.deltaPrice}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Visibility(
                                        child: Text(
                                          "(${controller.order.modifyPriceNote})",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        visible: !GetUtils.isNullOrBlank(
                                            controller.order.modifyPriceNote),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.openModifyPriceModal,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("尾款:"),
                          GetBuilder<OrderDetailController>(
                              id: "modifyPrice",
                              builder: (_) {
                                return Text(
                                  "¥${controller.order.balance}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("合计:"),
                        GetBuilder<OrderDetailController>(
                            id: "modifyPrice",
                            builder: (_) {
                              return Text(
                                "¥${controller.order.payAmount}",
                                style: TextStyle(
                                    color: BColors.pinkColor,
                                    fontSize: BDimens.sp36,
                                    fontWeight: FontWeight.w500),
                              );
                            })
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(
                        BAppRoutes.orderMainfest + "/${controller.order.id}"),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "共1件,",
                            style: TextStyle(
                                fontSize: BDimens.sp26,
                                color: BColors.tipColor),
                          ),
                          Text(
                            "查看商品清单",
                            style: TextStyle(fontSize: BDimens.sp26),
                          ),
                          Icon(BIcons.next)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
