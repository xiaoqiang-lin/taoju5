/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-26 16:00:04
 * @LastEditTime: 2021-07-08 14:49:52
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/mixin/order_product_operation_mixin.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_controller.dart';

// ignore: must_be_immutable
class ProductActionBar extends StatelessWidget with OrderProductOperationMixin {
  final Function()? onPurchase;
  final Function()? onAddToCart;
  final Function()? onSelect;
  final ProductDetailEntity? product;
  ProductActionBar(
      {Key? key,
      this.onPurchase,
      this.onAddToCart,
      this.product,
      this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: R.color.ffee9b5f),
          borderRadius: BorderRadius.all(Radius.circular(R.dimen.sp32))),
      width: R.dimen.dp200,
      height: R.dimen.dp45,

      ///如果上一个页面是选品页面 则显示确认选品按钮
      child: Get.isRegistered<OrderDetailController>()
          ? PrimaryButton(
              text: "确认选品",
              onPressed: onSelect,
            )
          : Row(
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
                    onTap: onPurchase,
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
