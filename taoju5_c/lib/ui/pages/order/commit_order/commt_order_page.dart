/*
 * @Description: 提交订单ui
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:16:33
 * @LastEditTime: 2021-07-20 17:38:38
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/component/noripple_scroll_behavior/noripple_scroll_behavior.dart';
// ignore: unused_import
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
// ignore: unused_import
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/section/measure_order_section.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/section/select_order_section.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_fulfillment_chart.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_term_of_service.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureLoadStateBuilder<CommitOrderController>(
        controller: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(controller.products.isNotEmpty ? "确认订单" : "下测量单"),
            ),
            body: Container(
              margin: EdgeInsets.only(top: R.dimen.dp24),
              child: ScrollConfiguration(
                behavior: NoRippleScrollBehavior(),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                        child: Column(
                          children: [
                            GetBuilder<CommitOrderController>(
                              id: "defaultAddress",
                              builder: (_) {
                                return GestureDetector(
                                  onTap: _.selectAddress,
                                  child: Row(
                                    children: [
                                      Image.asset(R.image.fillAddress),
                                      Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(
                                                left: R.dimen.dp10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (_.defaultAddress == null)
                                                  Text(
                                                    "请前往选择/添加收货地址",
                                                    style: TextStyle(
                                                        color: R.color.ffff5005,
                                                        fontSize: R.dimen.sp13,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                else
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            _.defaultAddress!
                                                                .receiverName,
                                                            style: TextStyle(
                                                                fontSize: R
                                                                    .dimen.sp13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: R
                                                                        .dimen
                                                                        .dp10),
                                                            child: Text(
                                                              _.defaultAddress!
                                                                  .telephone,
                                                              style: TextStyle(
                                                                  fontSize: R
                                                                      .dimen
                                                                      .sp13,
                                                                  color: R.color
                                                                      .ff999999),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: R.dimen
                                                                      .dp10),
                                                          child: Text(
                                                            _.defaultAddress!
                                                                .description
                                                                .replaceAll(
                                                                    " ", ""),
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              fontSize:
                                                                  R.dimen.sp13,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ))
                                                    ],
                                                  )
                                              ],
                                            )),
                                      ),
                                      Image.asset(R.image.next)
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      if (controller.orderType == OrderType.measureOrder)
                        MeasureOrderSection(controller: controller)
                      else
                        SelectOrderSection(controller: controller),
                      Container(
                        height: R.dimen.dp10,
                        color: R.color.fff5f5f5,
                        width: R.dimen.width,
                      ),
                      OrderFulfillmentProcessChart(order: _.order!),
                      OrderTermOfServiceSheet(order: _.order!)
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(0, -1),
                    color: Colors.black.withAlpha(18))
              ]),
              margin: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
              padding: EdgeInsets.symmetric(
                  horizontal: R.dimen.dp20, vertical: R.dimen.dp8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(TextSpan(
                      text: "合计:",
                      style: TextStyle(fontSize: R.dimen.sp14),
                      children: [
                        TextSpan(
                            text: "￥${_.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(color: R.color.ffff5005))
                      ])),
                  PrimaryButton(
                    text: "提交订单",
                    onPressed: _.defaultAddress == null ? null : _.submit,
                    margin: EdgeInsets.only(left: R.dimen.dp12),
                    padding: EdgeInsets.symmetric(
                        vertical: R.dimen.dp10, horizontal: R.dimen.dp22),
                  )
                ],
              ),
            ),
          );
        });
  }
}
