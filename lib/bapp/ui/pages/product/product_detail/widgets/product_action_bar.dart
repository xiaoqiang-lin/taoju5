/*
 * @Description: 商品 加入购物车 购买
 * @Author: iamsmiling
 * @Date: 2021-01-10 17:31:33
 * @LastEditTime: 2021-02-02 14:04:10
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';

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
            child: OutlinedButton(
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(color: BColors.outlineBorderColor, width: .8)),
                  shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero))),
              onPressed: onAddToCart,
              child: Text("加入购物车"),
            ),
          ),
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero))),
                onPressed: onBuy,
                child: Text("  立即购买  ",
                    style: TextStyle(color: BColors.primaryColor))),
          )
        ],
      ),
    );
  }
}
