import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/order/order_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class OrderCardSheet extends StatelessWidget {
  final OrderModel order;
  const OrderCardSheet({Key key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: order.orderStatus != OrderStatus.toBeSelected,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: BDimens.gap32, horizontal: BDimens.gap32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${order.orderStatus >= OrderStatus.toBeMeasured ? '已收定金' : '应收定金'}:",
                      style: TextStyle(fontSize: BDimens.sp28),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: BDimens.gap4),
                      child: Text(
                        "¥${order.prepayment.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: BDimens.sp28),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: BDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "创建时间:${order.createTime}",
                    style: TextStyle(
                        fontSize: BDimens.sp26,
                        color: BColors.weightGreyTextColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: order.orderStatus == OrderStatus.toBeSelected,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: BDimens.gap32, horizontal: BDimens.gap32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "客户:",
                      style: TextStyle(
                        fontSize: BDimens.sp28,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: BDimens.gap4),
                      child: Text(
                        "${order.customerName}",
                        style: TextStyle(fontSize: BDimens.sp28),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: BDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "订单号:${order.no}",
                    style: TextStyle(
                        fontSize: BDimens.sp26,
                        color: BColors.weightGreyTextColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: BDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "创建时间:${order.createTime}",
                    style: TextStyle(
                        fontSize: BDimens.sp26,
                        color: BColors.weightGreyTextColor),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: BDimens.gap8),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "共${order.windowCount}窗,已选${order.selectedCount}件商品 合计:¥${order.estimationAmount.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: BDimens.sp26,
                        color: BColors.weightGreyTextColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
