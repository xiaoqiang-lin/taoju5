/*
 * @Description: 测量单信息备注填写
 * @Author: iamsmiling
 * @Date: 2021-05-06 14:52:44
 * @LastEditTime: 2021-07-14 15:57:27
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/widget/deposit_tip_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/install_time_picker_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/measure_time_picker_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/order_note_fill_bar.dart';
import 'package:taoju5_c/ui/pages/order/widget/window_count_picker_bar.dart';

class MeasureOrderSheet extends StatelessWidget {
  final Function(String?)? onMeasureTimeChange;
  final Function(String?)? onInstallTimeChange;
  final Function(String?)? onWindowCountChange;
  final Function(String)? onOrderRemarkChange;
  final PreOrderInfoEntity order;
  const MeasureOrderSheet(
      {Key? key,
      required this.onMeasureTimeChange,
      required this.onInstallTimeChange,
      required this.onWindowCountChange,
      required this.onOrderRemarkChange,
      required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MeasureTimePickerBar(
            onValueChanged: onMeasureTimeChange,
          ),
          InstallTimePickerBar(
            onValueChanged: onInstallTimeChange,
          ),
          WindowCountPickerBar(onValueChanged: onWindowCountChange),
          DepositTipBar(order: order),
          OrderNoteFillBar(onValueChanged: onOrderRemarkChange),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp10, bottom: R.dimen.dp20),
            width: R.dimen.width,
            alignment: Alignment.centerRight,
            child: Text.rich(TextSpan(
                text: "小计:",
                style:
                    TextStyle(fontSize: R.dimen.sp14, color: R.color.ff333333),
                children: [
                  TextSpan(
                      text: "¥400.0", style: TextStyle(color: R.color.ffff5005))
                ])),
          )
        ],
      ),
    );
  }
}
