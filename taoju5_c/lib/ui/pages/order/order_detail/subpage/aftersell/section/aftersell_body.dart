/*
 * @Description: 售后
 * @Author: iamsmiling
 * @Date: 2021-05-24 15:16:40
 * @LastEditTime: 2021-05-24 15:27:01
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/checkbox/round_checked_box.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class AfterSellBody extends StatelessWidget {
  final OrderDetailEntity order;
  const AfterSellBody({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: R.dimen.dp13,
        left: R.dimen.dp24,
        right: R.dimen.dp24,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp12),
            child: Row(
              children: [
                Text(
                  "售后订单",
                  style: TextStyle(
                      fontSize: R.dimen.sp14,
                      color: R.color.ff181818,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp10),
                  child: Text(
                    "请选择",
                    style: TextStyle(
                        fontSize: R.dimen.sp12, color: R.color.ff999999),
                  ),
                )
              ],
            ),
          ),
          for (String v in order.cancelOrderReason.options)
            Container(
              padding: EdgeInsets.only(bottom: R.dimen.dp18),
              child: Row(
                children: [
                  Text(
                    v,
                    style: TextStyle(fontSize: R.dimen.sp12),
                  ),
                  Spacer(),
                  RoundCheckbox(
                      key: ObjectKey(v), value: false, onChanged: (_) {})
                ],
              ),
            ),
        ],
      ),
    );
  }
}
