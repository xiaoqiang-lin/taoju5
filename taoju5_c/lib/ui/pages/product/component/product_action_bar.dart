/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-26 16:00:04
 * @LastEditTime: 2021-04-27 15:53:32
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

class ProductActionBar extends StatelessWidget {
  final Function()? onPurchase;
  final Function()? onAddToCart;
  const ProductActionBar(
      {Key? key, required this.onPurchase, required this.onAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: R.color.ffee9b5f),
          borderRadius: BorderRadius.all(Radius.circular(R.dimen.sp32))),
      width: R.dimen.dp200,
      height: R.dimen.dp45,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onAddToCart,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "加入购物车",
                  style: TextStyle(
                      color: R.color.ffee9b5f, fontSize: R.dimen.sp14),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onAddToCart,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: R.color.ffee9b5f,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(R.dimen.sp32),
                        bottomRight: Radius.circular(R.dimen.sp32),
                      )),
                  child: Text(
                    "立即购买",
                    style: TextStyle(
                        color: R.color.ffffffff, fontSize: R.dimen.sp14),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
