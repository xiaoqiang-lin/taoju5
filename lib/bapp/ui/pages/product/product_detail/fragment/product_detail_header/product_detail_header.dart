/*
 * @Description:商品详情头部
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:12:26
 * @LastEditTime: 2021-01-25 20:43:17
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_cart_button.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_like_button.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_share_button.dart';

class ProductDetailHeader extends StatelessWidget {
  final ProductDetailModel product;

  const ProductDetailHeader({Key key, @required this.product})
      : super(key: key);

  static const List<String> tipList = ["前沿设计", "上门测装", "品质保障", "贴心售后"];

  @override
  Widget build(BuildContext context) {
    // ThemeData themeData = Theme.of(context);
    // TextTheme textTheme = themeData.textTheme;
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: TextStyle(
                    fontSize: BDimens.sp32, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Visibility(
                visible: true,
                child: XShareButton(id: product.id),
              ),
              XLikeButton(),
              Container(
                  margin: EdgeInsets.only(bottom: 4), child: XCartButton())
            ],
          ),
          Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: BDimens.gap4),
              child: Text(
                "${product.fullName}",
                style: TextStyle(fontSize: BDimens.sp28),
              ),
            ),
            visible: !GetUtils.isNullOrBlank(product.fullName),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
            child: Row(
              children: [
                Text(
                  "¥${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: BDimens.sp36, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${product.unit}",
                  style: TextStyle(fontSize: BDimens.sp24),
                ),
                Padding(
                  padding: EdgeInsets.only(left: BDimens.gap8),
                  child: Text(
                    "¥${product.marketPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: BDimens.sp24,
                        color: product.marketPrice == 0
                            ? Colors.transparent
                            : BColors.tipColor),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: product.productType is CurtainProductType,
            child: Column(
              children: [
                Container(
                  color: BColors.lightBlueColor,
                  padding: EdgeInsets.symmetric(vertical: BDimens.gap8),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: BDimens.gap16),
                        child: Text(
                          "·",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: BColors.blueTextColor,
                              fontSize: 24),
                        ),
                      ),
                      Text(
                        "该商品为定制商品，此价格为米价",
                        style: TextStyle(
                          color: BColors.blueTextColor,
                          fontSize: BDimens.sp24,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: BDimens.gap12),
                  child: DefaultTextStyle(
                    style: TextStyle(color: BColors.tipTextColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (String e in tipList)
                          Container(
                            padding: EdgeInsets.only(right: BDimens.gap10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: BDimens.gap16),
                                  child: Text(
                                    "·",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                ),
                                Text(e)
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
