/*
 * @Description: 订单价格信息
 * @Author: iamsmiling
 * @Date: 2021-07-16 17:29:44
 * @LastEditTime: 2021-07-17 16:02:58
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/res/R.dart';

class PreOrderBillSheetSection extends StatelessWidget {
  final PreOrderBillEntity bill;
  final OrderType orderType;
  final bool needMeasure;
  const PreOrderBillSheetSection(
      {Key? key,
      required this.bill,
      required this.orderType,
      this.needMeasure = true})
      : super(key: key);
  List<PreOrderBillItemEntity> get bills {
    if (orderType == OrderType.measureOrder) {
      return bill.measureOrderBill;
    }
    if (needMeasure) {
      return bill.billWithMeasureFee;
    }
    return bill.billNoMeasureFee;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (PreOrderBillItemEntity bill in bills)
            Container(
              margin: EdgeInsets.only(top: R.dimen.dp15),
              child: Row(
                children: [
                  Text(
                    bill.label,
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff181818),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: R.dimen.dp5),
                    child: Text(
                      "${bill.hint}",
                      style: TextStyle(
                          fontSize: R.dimen.sp11, color: R.color.ff999999),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${bill.value.value}",
                    style: TextStyle(
                        fontSize: R.dimen.sp14,
                        color: bill.value.highlighted
                            ? R.color.ffff5005
                            : R.color.ff333333),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
