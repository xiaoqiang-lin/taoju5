/*
 * @Description: 订单备注填写
 * @Author: iamsmiling
 * @Date: 2021-05-06 16:04:34
 * @LastEditTime: 2021-05-07 16:40:29
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class OrderNoteFillBar extends StatefulWidget {
  final Function(String)? onValueChanged;
  const OrderNoteFillBar({Key? key, this.onValueChanged}) : super(key: key);

  @override
  _OrderNoteFillBarState createState() => _OrderNoteFillBarState();
}

class _OrderNoteFillBarState extends State<OrderNoteFillBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: R.dimen.dp10)
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: R.dimen.dp10),
            child: Text(
              "订单备注",
              style: TextStyle(fontSize: R.dimen.sp14, color: R.color.ff181818),
            ),
          ),
          Expanded(
              child: TextFormField(
            onChanged: widget.onValueChanged,
            decoration: InputDecoration(
              hintText: "请输入订单备注(选填)",
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )),
        ],
      ),
    );
  }
}
