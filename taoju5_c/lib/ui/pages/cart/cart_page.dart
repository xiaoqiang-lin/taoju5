/*
 * @Description: 购物车
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:32:36
 * @LastEditTime: 2021-07-20 10:05:19
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
import 'package:taoju5_c/ui/pages/commendation/commendation_fragement.dart';
import 'package:taoju5_c/ui/pages/main/main_controller.dart';

import 'widget/curtain_product_cart_card.dart';
import 'package:autolist/autolist.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: GetBuilder<CartController>(builder: (_) {
              return Container(
                padding: EdgeInsets.only(
                    top: Get.mediaQuery.padding.top, right: R.dimen.dp20),
                color: R.color.ffee9b5f,
                height: kToolbarHeight + Get.mediaQuery.padding.top,
                child: Row(
                  children: [
                    Get.currentRoute == AppRoutes.main
                        ? SizedBox(width: R.dimen.dp20)
                        : BackButton(),
                    Text.rich(
                      TextSpan(
                          text: "购物车",
                          style: TextStyle(
                              fontSize: R.dimen.sp18,
                              fontWeight: FontWeight.w600,
                              color: R.color.ffffffff),
                          children: [
                            WidgetSpan(child: SizedBox(width: R.dimen.dp10)),
                            TextSpan(
                              text: "共${_.carts.length}件商品",
                              style: TextStyle(
                                  color: R.color.ffffffff,
                                  fontSize: R.dimen.sp10,
                                  fontWeight: FontWeight.normal),
                            )
                          ]),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "完成",
                          style: TextStyle(color: R.color.ffffffff),
                        ))
                  ],
                ),
              );
            }),
            preferredSize: Size.fromHeight(R.dimen.dp88)),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: controller.refreshController,
          scrollController: controller.scrollController,
          onLoading: controller.loadMore,
          onRefresh: controller.refreshData,
          child: CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: FutureLoadStateBuilder<CartController>(
                  controller: controller,
                  loadingBuilder: (BuildContext context) => SizedBox.expand(),
                  emptyBuilder: (BuildContext context) {
                    return Container(
                      height: R.dimen.height * .5,
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
                                  fontSize: R.dimen.sp14,
                                  color: R.color.ff666666),
                            ),
                          ),
                          PrimaryButton(
                            text: "去逛逛",
                            onPressed: () {
                              Get.find<MainController>().switchTo(1);
                            },
                            mode: PrimaryButtonMode.outlinedButton,
                            size: PrimaryButtonSize.middle,
                            margin: EdgeInsets.only(top: R.dimen.dp30),
                          )
                        ],
                      ),
                    );
                  },
                  builder: (_) {
                    return AutoList<CartEntity>(
                        items: _.carts,
                        controller: _.scrollController,
                        duration: Duration(milliseconds: 400),
                        itemBuilder: (BuildContext context, CartEntity item) {
                          return item.productType is FinishedProductType
                              ? FinishedProductCartCard(
                                  key: ObjectKey(item),
                                  cart: item,
                                  onLongPress: () =>
                                      _.openRemoveFromCartDialog(item),
                                  onMoveToCollection: () {},
                                  onRemoveFromCart: () =>
                                      _.removeFromCart(item),
                                  onModifyAttribute:
                                      _.openFinishedProductAttributeModal,
                                  onSelect: _.select,
                                  onCountChange: _.modifyCartCount,
                                )
                              : CurtainProductCartCard(
                                  key: ObjectKey(item),
                                  cart: item,
                                  onLongPress: () =>
                                      _.openRemoveFromCartDialog(item),
                                  onMoveToCollection: () {},
                                  onRemoveFromCart: () =>
                                      _.removeFromCart(item),
                                  onModifyAttribute:
                                      _.openFinishedProductAttributeModal,
                                  onSelect: _.select,
                                );
                        });
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: CommendationFragment(
                  scrollController: controller.scrollController,
                  tag: "cart",
                  header: Container(
                    margin: EdgeInsets.only(
                        left: R.dimen.dp24,
                        top: R.dimen.dp24,
                        bottom: R.dimen.dp15),
                    child: Text(
                      "为你推荐",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: R.dimen.sp15,
                          color: R.color.ff333333),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomSheet: Obx(
          () => Container(
            key: ValueKey(controller.carts.isNotEmpty),
            color: controller.carts.isNotEmpty
                ? R.color.ffffffff
                : R.color.transparent,
            child: Container(
              padding: EdgeInsets.only(
                left: R.dimen.dp20,
                right: R.dimen.dp20,
                // bottom: Get.mediaQuery.padding.bottom
              ),
              decoration: BoxDecoration(color: R.color.ffffffff, boxShadow: [
                BoxShadow(blurRadius: 6, color: Colors.black.withAlpha(25))
              ]),
              height: kBottomNavigationBarHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundCheckbox(
                    key: ValueKey(controller.checkedAll),
                    checkedIcon: Image.asset(R.image.checkedMid),
                    uncheckedIcon: Image.asset(R.image.uncheckedMid),
                    onChanged: controller.selectAll,
                    value: controller.checkedAll,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: R.dimen.dp8),
                    child: Text(
                      "全选",
                      style: TextStyle(
                          fontSize: R.dimen.sp14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Spacer(),
                  Text.rich(
                    TextSpan(
                        text: "合计:",
                        style: TextStyle(
                            fontSize: R.dimen.sp14,
                            fontWeight: FontWeight.w400,
                            color: R.color.ff333333),
                        children: [
                          TextSpan(
                            text:
                                "¥${controller.totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: R.dimen.sp14,
                                fontWeight: FontWeight.w400,
                                color: R.color.ffff5005),
                          )
                        ]),
                    textAlign: TextAlign.justify,
                    key: ValueKey(controller.totalPrice.toStringAsFixed(2)),
                  ),
                  PrimaryButton(
                      key: ValueKey(controller.selectedCarts.length),
                      margin: EdgeInsets.only(left: R.dimen.dp10),
                      text: "结算(${controller.selectedCarts.length})",
                      padding: EdgeInsets.symmetric(
                          horizontal: R.dimen.dp16, vertical: R.dimen.dp10),
                      onPressed: controller.selectedCarts.isEmpty
                          ? null
                          : () => Get.toNamed(AppRoutes.commitOrder,
                              arguments: controller.selectedProducts))
                ],
              ),
            ),
          ),
        ));
  }
}
