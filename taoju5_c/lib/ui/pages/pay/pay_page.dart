/*
 * @Description: 支付页面
 * @Author: iamsmiling
 * @Date: 2021-04-30 11:02:54
 * @LastEditTime: 2021-06-04 10:37:07
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/checkbox/round_checked_box.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/pay/pay_controller.dart';
import 'package:get/get.dart';

class PayPage extends GetView<PayController> {
  const PayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("确认支付"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: R.dimen.dp75,
              child: Text.rich(TextSpan(
                  text: "¥",
                  style: TextStyle(
                      fontSize: R.dimen.sp20, color: R.color.ffee9b5f),
                  children: [
                    TextSpan(
                      text: "${controller.integerPrice}",
                      style: TextStyle(fontSize: R.dimen.sp32),
                    ),
                    TextSpan(text: "${controller.decimalPrice}")
                  ])),
            ),
            Container(
              height: R.dimen.dp45,
              width: R.dimen.width,
              color: R.color.ffee9b5f,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: R.dimen.dp24),
              child: Text(
                "请选择支付方式",
                style: TextStyle(
                    fontSize: R.dimen.sp14,
                    color: R.color.ff333333,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GetBuilder<PayController>(
              id: "pay",
              builder: (_) {
                return Column(
                  children: [
                    for (PayEntity item in controller.options)
                      Container(
                        key: ObjectKey(item),
                        margin: EdgeInsets.symmetric(horizontal: R.dimen.dp24),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: R.dimen.dp22),
                              child: Row(
                                children: [
                                  Image.asset(item.icon),
                                  Container(
                                    margin: EdgeInsets.only(left: R.dimen.dp14),
                                    child: Text(
                                      item.label,
                                      style: TextStyle(
                                          fontSize: R.dimen.sp14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  RoundCheckbox(
                                      key: ValueKey(
                                          "${item.label}${item.selected}"),
                                      value: item.selected,
                                      onChanged: (bool flag) =>
                                          _.selectPayStrategy(item,flag))
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                  ],
                );
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // height: kBottomNavigationBarHeight,
        margin: EdgeInsets.only(
            // bottom: Get.mediaQuery.padding.bottom,
            left: R.dimen.dp20,
            right: R.dimen.dp20),
        child: PrimaryButton(
          text: "确认支付",
          onPressed: controller.pay,
          margin: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom + R.dimen.dp8,
          ),
          padding: EdgeInsets.symmetric(vertical: R.dimen.dp13),
        ),
      ),
    );
  }
}
