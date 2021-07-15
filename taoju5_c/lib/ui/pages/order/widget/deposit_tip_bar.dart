/*
 * @Description: 定金
 * @Author: iamsmiling
 * @Date: 2021-05-06 16:10:03
 * @LastEditTime: 2021-07-14 15:11:07
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/res/R.dart';

class DepositTipBar extends StatelessWidget {
  final PreOrderInfoEntity order;
  const DepositTipBar({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: R.dimen.dp5),
            child: Text(
              "定金",
              style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 32,
            child: TextFormField(
              readOnly: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  hintText: "(包含测装费用，支付尾款时可抵货款)",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: IconTheme(
                      data: IconThemeData(size: R.dimen.sp14),
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,
                        // margin: EdgeInsets.only(top: 12),
                        constraints: BoxConstraints(maxWidth: R.dimen.dp24),
                        child: Text(
                          "¥${order.deposit.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: R.dimen.sp14, color: R.color.ff333333),
                        ),
                      ))),
            ),
          )),
        ],
      ),
    );
  }
}
