/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:32:36
 * @LastEditTime: 2021-04-21 15:16:03
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/cart/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            backgroundColor: R.color.ffee9b5f,
            leadingWidth: 256,
            leading: Container(
              padding: EdgeInsets.only(left: R.dimen.dp20),
              constraints: BoxConstraints(minHeight: 44),
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                    text: "购物车",
                    style: TextStyle(
                        fontSize: R.dimen.sp18,
                        fontWeight: FontWeight.bold,
                        color: R.color.ffffffff),
                    children: [
                      WidgetSpan(child: SizedBox(width: R.dimen.dp10)),
                      TextSpan(
                        text: "共3件商品",
                        style: TextStyle(
                            color: R.color.ffffffff,
                            fontSize: R.dimen.sp10,
                            fontWeight: FontWeight.normal),
                      )
                    ]),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "完成",
                    style: TextStyle(color: R.color.ffffffff),
                  ))
            ],
          ),
        );
      },
    );
  }
}
