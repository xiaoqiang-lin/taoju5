/*
 * @Description: 订单备注
 * @Author: iamsmiling
 * @Date: 2021-04-26 10:42:29
 * @LastEditTime: 2021-04-26 10:50:56
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_status.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';

import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';

class OrderNoteBar extends StatefulWidget {
  OrderNoteBar({Key key}) : super(key: key);

  @override
  _OrderNoteBarState createState() => _OrderNoteBarState();
}

class _OrderNoteBarState extends State<OrderNoteBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(
      builder: (_) {
        return Visibility(
          visible: _.order.orderStatus == OrderStatus.toBeSelected,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: BDimens.gap8),
            child: Column(
              children: [
                Container(
                  height: BDimens.gap16,
                  color: const Color(0xFFF5F5F5),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: BDimens.gap32, vertical: BDimens.gap24),
                  child: Row(
                    children: [
                      Text(
                        "订单备注",
                        style: TextStyle(fontSize: BDimens.sp24),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: _.order.note,
                          onChanged: (String val) {
                            _.order.note = val;
                          },
                          decoration: InputDecoration(
                              hintText: "请输入订单备注(选填)",
                              hintStyle: TextStyle(fontSize: BDimens.sp24),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              isCollapsed: true),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: BDimens.gap16,
                  color: const Color(0xFFF5F5F5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
