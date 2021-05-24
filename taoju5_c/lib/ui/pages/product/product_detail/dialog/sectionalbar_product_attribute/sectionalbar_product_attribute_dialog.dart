/*
 * @Description: 型材属性弹窗
 * @Author: iamsmiling
 * @Date: 2021-05-24 11:15:20
 * @LastEditTime: 2021-05-24 13:43:47
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/step_counter/step_counter.dart';
import 'package:taoju5_c/component/textfield/sized_text_field.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

Future openSectionalbarProductAttributeDialog(
  BuildContext context, {
  required ProductDetailEntity product,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: R.dimen.dp48),
          child: SectionalbarProductAttributeDialog(
            product: product,
          ),
        );
      });
}

class SectionalbarProductAttributeDialog extends StatelessWidget {
  final ProductDetailEntity product;
  const SectionalbarProductAttributeDialog({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: R.dimen.dp280,
      padding: EdgeInsets.all(R.dimen.dp20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp48),
            alignment: Alignment.center,
            child: Text(
              "请输入型材长度",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: R.color.ff1b1b1b,
                  fontSize: R.dimen.sp15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: R.dimen.dp15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: R.dimen.dp15),
                      alignment: Alignment.center,
                      child: Text("长度(CM):",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: R.dimen.sp14, color: R.color.ff333333)),
                    ),
                    Expanded(
                      child: SizedTextField(
                        constraints: BoxConstraints(
                            maxHeight: R.dimen.dp32, maxWidth: R.dimen.dp100),
                        padding: EdgeInsets.only(left: R.dimen.dp10),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "请输入长度",
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: R.dimen.dp16),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: R.dimen.dp15),
                        alignment: Alignment.center,
                        child: Text("型材数量:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: R.dimen.sp14,
                                color: R.color.ff333333)),
                      ),
                      StepCounter(onChanged: (_) {}),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: R.dimen.dp14, bottom: R.dimen.dp10),
                  child: Text.rich(TextSpan(
                      text: "预计：",
                      style: TextStyle(fontSize: R.dimen.sp12),
                      children: [
                        TextSpan(
                            text: "¥1999.00",
                            style: TextStyle(
                                fontSize: R.dimen.sp15,
                                color: R.color.ffff5005))
                      ])),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                text: "加入购物车",
                onPressed: () {},
                size: PrimaryButtonSize.middle,
                mode: PrimaryButtonMode.outlinedButton,
                margin: EdgeInsets.only(right: R.dimen.dp10),
              ),
              PrimaryButton(
                text: "立即购买",
                onPressed: () {},
                size: PrimaryButtonSize.middle,
              )
            ],
          )
        ],
      ),
    );
  }
}
