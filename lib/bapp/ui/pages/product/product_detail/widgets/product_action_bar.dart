/*
 * @Description: 商品 加入购物车 购买
 * @Author: iamsmiling
 * @Date: 2021-01-10 17:31:33
 * @LastEditTime: 2021-02-02 14:04:10
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_future_button.dart';

class ProductActionBar extends StatelessWidget {
  final Function onBuy;
  final Function onAddToCart;
  const ProductActionBar(
      {Key key, @required this.onBuy, @required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: XFutureButton(
              onFuture: onAddToCart,
              buttonMode: ButtonMode.outline,
              successTip: "加入购物车成功",
              failTip: "加入购物车失败",
              child: Text("加入购物车"),
            ),
          ),
          Expanded(
            child: XFutureButton(
              onFuture: onBuy,
              showLoading: false,
              child: Text("立即购买"),
            ),
          )
        ],
      ),
    );
  }
}
