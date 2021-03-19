import 'package:flutter/material.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/utils/common_kit.dart';

class MixinProductCard extends StatelessWidget {
  final ProductMixinModel product;
  const MixinProductCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(BAppRoutes.productDetail + "/${product.id}"),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.image),
            Container(
              padding: EdgeInsets.only(top: BDimens.gap8, bottom: BDimens.gap4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.name),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "¥${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: BDimens.sp26, fontWeight: FontWeight.w600),
                ),
                Text(
                  "/${product.unit}",
                  style: TextStyle(
                      fontSize: BDimens.sp20, color: BColors.greyTextColor),
                ),
                Visibility(
                  visible: !CommonKit.isNullOrZero(product.marketPrice),
                  child: Padding(
                    padding: EdgeInsets.only(left: BDimens.gap8),
                    child: Text(
                      "¥${product.marketPrice.toStringAsFixed(2)}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: BDimens.sp20,
                          color: BColors.greyTextColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
