/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:32:36
 * @LastEditTime: 2021-05-18 15:39:13
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/checkbox/c_round_checked_box.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/cart/cart_controller.dart';
import 'package:taoju5_c/ui/pages/cart/widget/finished_product_cart_card.dart';

import 'widget/curtain_product_cart_card.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: R.color.ffee9b5f,
        leadingWidth: 300,
        leading: Container(
          padding: EdgeInsets.only(left: R.dimen.dp20),
          constraints: BoxConstraints(minHeight: 44),
          alignment: Alignment.center,
          child: Row(
            children: [
              BackButton(),
              Text.rich(
                TextSpan(
                    text: "购物车",
                    style: TextStyle(
                        fontSize: R.dimen.sp18,
                        fontWeight: FontWeight.bold,
                        color: R.color.ffffffff),
                    children: [
                      WidgetSpan(child: SizedBox(width: R.dimen.dp10)),
                      TextSpan(
                        text: "共3件商品",
                        style: TextStyle(
                            color: R.color.ffffffff,
                            fontSize: R.dimen.sp10,
                            fontWeight: FontWeight.normal),
                      )
                    ]),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "完成",
                style: TextStyle(color: R.color.ffffffff),
              ))
        ],
      ),
      body: FutureLoadStateBuilder<CartController>(
          controller: controller,
          emptyBuilder: (BuildContext context) {
            return Container(
              height: R.dimen.height,
              width: R.dimen.width,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(R.image.emptyCart),
                  Container(
                    margin: EdgeInsets.only(top: R.dimen.dp30),
                    child: Text(
                      "购物车空空如也~",
                      style: TextStyle(
                          fontSize: R.dimen.sp14, color: R.color.ff666666),
                    ),
                  )
                ],
              ),
            );
          },
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int i) {
                        return Divider(
                            indent: R.dimen.dp24, endIndent: R.dimen.dp24);
                      },
                      shrinkWrap: true,
                      itemCount: _.carts.length,
                      itemBuilder: (BuildContext context, int i) {
                        CartEntity item = _.carts[i];
                        return item.productType is FinishedProductType
                            ? FinishedProductCartCard(
                                cart: item,
                                onLongPress: () =>
                                    _.openRemoveFromCartDialog(item.id),
                                onMoveToCollection: () {},
                                onRemoveFromCart: () =>
                                    _.removeFromCart(item.id),
                                onModifyAttribute:
                                    _.openFinishedProductAttributeModal,
                                onSelect: _.select,
                                onCountChange: _.modifyCartCount,
                              )
                            : CurtainProductCartCard(
                                cart: item,
                                onLongPress: () =>
                                    _.openRemoveFromCartDialog(item.id),
                                onMoveToCollection: () {},
                                onRemoveFromCart: () =>
                                    _.removeFromCart(item.id),
                                onModifyAttribute:
                                    _.openFinishedProductAttributeModal,
                                onSelect: _.select,
                              );
                      }),
                )
              ],
            );
          }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
        decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.black.withAlpha(25))
        ]),
        height: kBottomNavigationBarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return RoundCheckbox(
                key: ValueKey(controller.checkedAll.value),
                checkedIcon: Image.asset(R.image.checkedMid),
                uncheckedIcon: Image.asset(R.image.uncheckedMid),
                onChanged: controller.selectAll,
                value: controller.checkedAll.value,
              );
            }),
            Container(
              margin: EdgeInsets.only(left: R.dimen.dp8),
              child: Text(
                "全选",
                style: TextStyle(
                    fontSize: R.dimen.sp14, fontWeight: FontWeight.w500),
              ),
            ),
            Spacer(),
            Obx(() => Text.rich(
                  TextSpan(
                      text: "合计:",
                      style: TextStyle(
                          fontSize: R.dimen.sp14,
                          fontWeight: FontWeight.w400,
                          color: R.color.ff333333),
                      children: [
                        TextSpan(
                          text:
                              "¥${controller.totalPrice.value.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: R.dimen.sp14,
                              fontWeight: FontWeight.w400,
                              color: R.color.ffff5005),
                        )
                      ]),
                  textAlign: TextAlign.justify,
                )),
            PrimaryButton(
                margin: EdgeInsets.only(left: R.dimen.dp10),
                text: "结算(1)",
                padding: EdgeInsets.symmetric(
                    horizontal: R.dimen.dp16, vertical: R.dimen.dp10),
                onPressed: () => Get.toNamed(AppRoutes.commitOrder,
                    arguments: controller.selectedProducts))
          ],
        ),
      ),
    );
  }
}
