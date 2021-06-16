/*
 * @Description: 订单详情头部
 * @Author: iamsmiling
 * @Date: 2021-05-18 09:26:35
 * @LastEditTime: 2021-05-20 16:57:18
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class OrderDetailHeader extends StatelessWidget {
  final OrderDetailEntity order;
  const OrderDetailHeader({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ///头部订单信息
          Container(
            // height: R.dimen.dp100,
            width: R.dimen.width,
            color: R.color.ffee9b5f,
            padding: EdgeInsets.only(
                left: R.dimen.dp45, top: R.dimen.dp24, bottom: R.dimen.dp24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.statusTip.title,
                  style: TextStyle(
                      color: R.color.ffffffff,
                      fontSize: R.dimen.sp16,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp12),
                  child: Text(
                    order.statusTip.description,
                    style: TextStyle(
                        color: R.color.ffffffff,
                        fontSize: R.dimen.sp13,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),

          /// 收货人信息
          Container(
            padding: EdgeInsets.only(
                left: R.dimen.dp24,
                right: R.dimen.dp18,
                top: R.dimen.dp16,
                bottom: R.dimen.dp16),
            child: Row(
              children: [
                Image.asset(R.image.fillAddress),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: R.dimen.dp10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            order.receiver.name,
                            style: TextStyle(
                                fontSize: R.dimen.sp13,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: R.dimen.dp10),
                            child: Text(
                              order.receiver.telephone,
                              style: TextStyle(
                                  fontSize: R.dimen.sp13,
                                  color: R.color.ff999999),
                            ),
                          )
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: R.dimen.dp10),
                          child: Text(
                            order.receiver.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: R.dimen.sp13),
                          ))
                    ],
                  ),
                ))
              ],
            ),
          ),

          /// 测量安装信息
          Visibility(
            visible: order.logs.isNotEmpty,
            child: Container(
              padding: EdgeInsets.only(
                  left: R.dimen.dp24,
                  right: R.dimen.dp24,
                  bottom: R.dimen.dp18 - R.dimen.dp7),
              child: Column(
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(bottom: R.dimen.dp18 - R.dimen.dp7),
                      child: Divider()),
                  for (OrderActionLogEntity o in order.logs)
                    GestureDetector(
                      onTap: o.hasModified
                          ? () =>
                              Get.toNamed(Get.currentRoute + AppRoutes.editLog)
                          : () =>
                              Get.toNamed(Get.currentRoute + AppRoutes.editLog),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: R.dimen.dp7),
                        child: Row(
                          children: [
                            Text(
                              o.label,
                              style: TextStyle(fontSize: R.dimen.sp13),
                            ),
                            Spacer(),
                            Text(
                              o.date,
                              style: TextStyle(
                                  fontSize: R.dimen.sp13,
                                  color: R.color.ff999999),
                            ),
                            Visibility(
                                visible: o.hasModified,
                                child: Row(
                                  children: [
                                    Text(
                                      "已调整",
                                      style: TextStyle(
                                          fontSize: R.dimen.sp13,
                                          color: R.color.ff999999),
                                    ),
                                    Image.asset(R.image.next,
                                        color: R.color.ff999999)
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
