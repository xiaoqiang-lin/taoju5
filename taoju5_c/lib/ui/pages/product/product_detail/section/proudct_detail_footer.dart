/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-26 15:51:51
 * @LastEditTime: 2021-07-20 09:44:45
 */
import 'package:flutter/material.dart';

import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';

class ProductDetailFooter extends StatelessWidget {
  final ProductDetailEntity product;
  final Function()? purchase;
  final Function()? addToCart;
  final Function()? select;
  const ProductDetailFooter(
      {Key? key,
      required this.product,
      required this.purchase,
      required this.addToCart,
      this.select})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
        BoxShadow(
            spreadRadius: 1,
            offset: Offset(0, -1),
            color: Colors.black.withAlpha(18))
      ]),
      height:
          kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: R.dimen.dp20,
          right: R.dimen.dp20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: R.dimen.dp8, bottom: R.dimen.dp4),
                child: Text(
                  product.productType is FinishedProductType ? "合计:" : "预计:",
                  style: TextStyle(
                    fontSize: R.dimen.sp12,
                  ),
                ),
              ),
              Text("¥${product.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                      // fontWeight: FontWeight.w500,
                      fontSize: R.dimen.sp15,
                      color: R.color.ffff5005))
            ],
          ),
          ProductActionBar(
            onAddToCart: addToCart,
            onPurchase: purchase,
            onSelect: select,
            product: product,
          )
        ],
      ),
    );
  }
}
