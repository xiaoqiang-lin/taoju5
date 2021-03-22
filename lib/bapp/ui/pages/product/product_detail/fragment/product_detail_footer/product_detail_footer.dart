/*
 * @Description: 底部价格
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:08:11
 * @LastEditTime: 2021-02-02 14:02:49
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/product_action_bar.dart';

class ProductDetailFooter extends StatelessWidget {
  final String tag;
  const ProductDetailFooter({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: kBottomNavigationBarHeight,
    // );
    return Container(
      height: kBottomNavigationBarHeight,
      width: Get.width,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: BDimens.gap20),
      child: GetBuilder<ProductDetailController>(
          tag: tag,
          id: "totalPrice",
          builder: (_) {
            return Row(
              children: [
                if (!_.isForSelect)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "预计:",
                          style: TextStyle(
                              fontSize: BDimens.sp24,
                              color: BColors.greyTextColor),
                        ),
                        Text(
                          "¥${_.priceDelegator?.totalPrice?.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: BDimens.sp36,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      if (_.isForSelect)
                        Container(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            child: Text("确认选品"),
                            onPressed: Get.find<OrderDetailController>().select,
                          ),
                        )
                      else
                        GetBuilder<ProductDetailController>(
                          tag: tag,
                          builder: (_) {
                            return ProductActionBar(
                              onAddToCart: _.addToCart,
                              onBuy: _.buy,
                            );
                          },
                        ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
