/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-26 15:51:51
 * @LastEditTime: 2021-04-26 16:31:34
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';

class ProductDetailFooter extends StatelessWidget {
  final ProductDetailEntity product;
  const ProductDetailFooter({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: R.dimen.dp20,
          right: R.dimen.dp20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productType is FinishedProductType ? "合计:" : "预计:",
                style: TextStyle(
                  fontSize: R.dimen.sp12,
                ),
              ),
              Text("¥${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: R.dimen.sp15,
                      color: R.color.ffff5005))
            ],
          ),
          ProductActionBar(
            onPurchase: () {},
            onAddToCart: () {},
          )
        ],
      ),
    );
  }
}
