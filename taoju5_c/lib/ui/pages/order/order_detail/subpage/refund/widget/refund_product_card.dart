/*
 * @Description: 退回退款商品
 * 
 * @Author: iamsmiling
 * @Date: 2021-07-12 09:28:32
 * @LastEditTime: 2021-07-12 10:06:32
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_adaptor_entity.dart';
import 'package:taoju5_c/res/R.dart';

class RefundProductCard extends StatelessWidget {
  final ProductAdaptorEntity product;
  const RefundProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(R.dimen.sp7),
          child: Image.network(
            product.image,
            fit: BoxFit.fitHeight,
            width: R.dimen.dp85,
            height: R.dimen.dp85,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              width: R.dimen.dp85,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: R.dimen.dp5),
              decoration: BoxDecoration(
                  color: R.color.ffffffff.withOpacity(.8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(R.dimen.sp7),
                    bottomRight: Radius.circular(R.dimen.sp7),
                  )),
              child: Text(
                "¥${product.totalPrice.toStringAsFixed(2)}",
                style:
                    TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
              ),
            ))
      ],
    );
  }
}
