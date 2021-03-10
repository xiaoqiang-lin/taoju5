/*
 * @Description: 底部价格
 * @Author: iamsmiling
 * @Date: 2020-12-24 10:08:11
 * @LastEditTime: 2021-02-02 14:02:49
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/modal/product/finished_product.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/product_action_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';

class ProductDetailFooter extends StatelessWidget {
  final String tag;
  const ProductDetailFooter({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                if (!Get.isRegistered<SelectableProductListController>())
                  Text(
                      _.priceDelegator?.totalPrice?.toStringAsFixed(2) ?? "总价"),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      if (Get.isRegistered<SelectableProductListController>())
                        ElevatedButton(
                          child: Text("确认选品"),
                          onPressed: Get.find<OrderDetailController>().select,
                        )
                      else
                        ProductActionBar(
                          onAddToCart: () => Get.toNamed(BAppRoutes.commitOrder,
                              arguments: []),
                          onBuy: () => showFinishedProductAttrModal(context,
                              product: _.product),
                          // onBuy: () => Get.toNamed( BAppRoutes.commitOrder,
                          //     arguments: Get.find<ProductDetailController>().adapt()

                          //     ),
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
