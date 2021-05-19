/*
 * @Description: 提交订单ui
 * @Author: iamsmiling
 * @Date: 2021-04-28 11:16:33
 * @LastEditTime: 2021-05-18 10:38:40
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
// ignore: unused_import
import 'package:taoju5_c/domain/entity/address/address_entity.dart';
// ignore: unused_import
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/section/custom_product_section.dart';
import 'package:taoju5_c/ui/pages/order/commit_order/section/finished_product_section.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_fulfillment_chart.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_note_fill_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_term_of_service.dart';

class CommitOrderPage extends GetView<CommitOrderController> {
  const CommitOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("确认订单"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: R.dimen.dp24),
        child: SingleChildScrollView(
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
                              Container(
                                  margin: EdgeInsets.only(left: R.dimen.dp10),
                                  child: Column(
                                    children: [
                                      if (_.defaultAddress == null)
                                        Text(
                                          "请前往选择/添加收货地址",
                                          style: TextStyle(
                                              color: R.color.ffff5005,
                                              fontSize: R.dimen.sp13,
                                              fontWeight: FontWeight.bold),
                                        )
                                      else
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  _.defaultAddress!
                                                      .receiverName,
                                                  style: TextStyle(
                                                      fontSize: R.dimen.sp13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: R.dimen.dp10),
                                                  child: Text(
                                                    _.defaultAddress!.telephone,
                                                    style: TextStyle(
                                                        fontSize: R.dimen.sp13,
                                                        color:
                                                            R.color.ff999999),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: R.dimen.dp10),
                                                child: Text(_
                                                    .defaultAddress!.description
                                                    .replaceAll(" ", "")))
                                          ],
                                        )
                                    ],
                                  )),
                              Spacer(),
                              Image.asset(R.image.next)
                            ],
                          ),
                        );
                      },
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(
                    //       top: R.dimen.dp16, bottom: R.dimen.dp10),
                    //   child: Divider(),
                    // ),
                    // MeasureOrderSheet(
                    //   onMeasureTimeChange: controller.setMeasureTime,
                    //   onInstallTimeChange: controller.setInstallTime,
                    //   onWindowCountChange: controller.setWindowCount,
                    //   onOrderRemarkChange: controller.setOrderRemark,
                    // ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                  child: CustomProductSection(
                      products: controller.customProducts)),
              Container(
                height: R.dimen.dp10,
                color: R.color.fff5f5f5,
                width: R.dimen.width,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                  child: FinishedProductSection(
                      products: controller.finishedProducts)),
              Container(
                height: R.dimen.dp10,
                color: R.color.fff5f5f5,
                width: R.dimen.width,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                  child: OrderNoteFillBar()),
              Container(
                height: R.dimen.dp10,
                color: R.color.fff5f5f5,
                width: R.dimen.width,
              ),
              OrderFulfillmentProcessChart(),
              OrderTermOfServiceSheet()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                      text: "￥400.0", style: TextStyle(color: R.color.ffff5005))
                ])),
            PrimaryButton(
              text: "提交订单",
              onPressed: controller.submit,
              margin: EdgeInsets.only(left: R.dimen.dp12),
              padding: EdgeInsets.symmetric(
                  vertical: R.dimen.dp13, horizontal: R.dimen.dp22),
            )
          ],
        ),
      ),
    );
  }
}
