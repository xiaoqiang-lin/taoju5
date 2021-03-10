/*
 * @Description: 修改价格
 * @Author: iamsmiling
 * @Date: 2021-01-13 15:47:16
 * @LastEditTime: 2021-01-17 23:18:29
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/modal/base/x_base_modal.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_submit_button.dart';
import 'package:taoju5/bapp/ui/widgets/common/textfield/x_sized_text_field.dart';

Future showModifyPriceModal() {
  return showCupertinoModalPopup<String>(
      context: Get.context,
      builder: (BuildContext context) {
        return _ModifyOrderPriceModal();
      });
}

class _ModifyOrderPriceModal extends StatelessWidget {
  const _ModifyOrderPriceModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      builder: (_) {
        ModifyPriceParamsModel params = ModifyPriceParamsModel(
            orderId: "${_.order.id}",
            amount: "${_.order.payAmount}",
            originPrice: "${_.order.originalPrice}");
        return XBaseModal(
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Get.theme.primaryColor,
              body: SizedBox.expand(
                child: Container(
                  color: Get.theme.primaryColor,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: BDimens.gap24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: BDimens.gap24),
                        child: Text(
                          "修改价格",
                          style: TextStyle(
                              fontSize: BDimens.sp36,
                              color: BColors.titleColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: BDimens.gap32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "原订单总价",
                              style: TextStyle(
                                  fontSize: BDimens.sp32,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "¥${_.order.originalPrice}",
                              style: TextStyle(
                                  fontSize: BDimens.sp32,
                                  fontWeight: FontWeight.w500,
                                  color: BColors.highLightColor),
                            )
                          ],
                        ),
                      ),
                      GetBuilder<OrderDetailController>(
                        id: "modifyPriceMode",
                        builder: (_) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "改价方式",
                                    style: TextStyle(
                                        fontSize: BDimens.sp32,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: params.modifyPriceMode ==
                                              ModifyPriceMode.amount,
                                          onChanged: (bool flag) {
                                            params.modifyPriceMode =
                                                ModifyPriceMode.amount;
                                            _.update(["modifyPriceMode"]);
                                          }),
                                      Text(
                                        "按金额",
                                        style: TextStyle(
                                            fontSize: BDimens.sp32,
                                            color: params.modifyPriceMode ==
                                                    ModifyPriceMode.amount
                                                ? null
                                                : BColors.greyTextColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: params.modifyPriceMode ==
                                              ModifyPriceMode.discount,
                                          onChanged: (bool flag) {
                                            params.modifyPriceMode =
                                                ModifyPriceMode.discount;
                                            _.update(["modifyPriceMode"]);
                                          }),
                                      Text(
                                        "按折扣",
                                        style: TextStyle(
                                            fontSize: BDimens.sp32,
                                            color: params.modifyPriceMode ==
                                                    ModifyPriceMode.discount
                                                ? null
                                                : BColors.greyTextColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: params.modifyPriceMode ==
                                    ModifyPriceMode.amount,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: BDimens.gap24),
                                  child: Row(
                                    children: [
                                      Text(
                                        "改后总价",
                                        style: TextStyle(
                                            fontSize: BDimens.sp32,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Flexible(
                                          child: XSizedTextField(
                                        hintText: "请输入",
                                        initialValue: _.order.originalPrice,
                                        onChanged: (String text) {
                                          params.amount = text;
                                        },
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: params.modifyPriceMode ==
                                    ModifyPriceMode.discount,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: BDimens.gap24),
                                  child: Row(
                                    children: [
                                      Text(
                                        "折扣系数",
                                        style: TextStyle(
                                            fontSize: BDimens.sp32,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Flexible(
                                          child: XSizedTextField(
                                        hintText: "请输入",
                                        initialValue: params.discount,
                                        onChanged: (String text) {
                                          params.discount = text;
                                          _.update(["currentPrice"]);
                                        },
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                              XSizedTextField(
                                hintText: "改价备注说明（非必填）",
                                initialValue: params.note,
                                onChanged: (String text) {
                                  params.note = text;
                                },
                              ),
                              Visibility(
                                  visible: params.modifyPriceMode ==
                                      ModifyPriceMode.discount,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: BDimens.gap32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "改后总价",
                                          style: TextStyle(
                                              fontSize: BDimens.sp32,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        GetBuilder<OrderDetailController>(
                                            id: "currentPrice",
                                            builder: (_) {
                                              return Text(
                                                "¥${params.currentPrice}",
                                                style: TextStyle(
                                                    fontSize: BDimens.gap36,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              );
                                            })
                                      ],
                                    ),
                                  ))
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: XSubmitButton(
                child: Text("确定"),
                onFuture: () => _.modifyPrice(params),
                onSuccess: Get.back,
              ),
            );
          },
        );
      },
    );
  }
}
