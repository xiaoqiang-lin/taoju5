/*
 * @Description: 从购物车中移除
 * @Author: iamsmiling
 * @Date: 2021-04-29 17:09:06
 * @LastEditTime: 2021-04-29 17:20:20
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';

Future openRemoveFromCartDialog(BuildContext context,
    {required Function()? onMoveToCollection,
    required Function()? onRemoveFromCart}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                  onPressed: onMoveToCollection,
                  child: Text(
                    "移入收藏夹",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff333333),
                  )),
              Divider(),
              TextButton(
                  onPressed: onRemoveFromCart,
                  child: Text(
                    "删除商品",
                    style: TextStyle(
                        fontSize: R.dimen.sp14, color: R.color.ff333333),
                  )),
            ],
          ),
        );
      });
}
