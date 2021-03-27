/*
 * @Description: 购物车页面
 * @Author: iamsmiling
 * @Date: 2020-12-28 10:27:58
 * @LastEditTime: 2021-01-27 15:51:20
 */

import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_skeleton.dart';
import 'package:taoju5/bapp/ui/widgets/common/x_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_tab_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:taoju5/bapp/res/b_icons.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/modal/product/finished_product.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/cart_list_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/widgets/product_attr_card.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_step_counter.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_rotation_arrow.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:autolist/autolist.dart';

class CartPage extends GetView<CartListParentController> {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
          actions: [
            GetBuilder<CartListParentController>(
                id: "editMode",
                builder: (_) {
                  return TextButton(
                      onPressed: _.switchMode,
                      child: Text(_.isInEditMode ? "完成" : "编辑"));
                })
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kTextTabBarHeight),
            child: GetBuilder<CartListParentController>(
              id: "tab",
              builder: (_) {
                return TabBar(
                  isScrollable: true,
                  controller: _.tabController,
                  tabs: [
                    for (ProductTabModel tab in _.tabList)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                        child: Text("${tab.name}(${tab.count})"),
                      )
                  ],
                );
              },
            ),
          ),
        ),
        body: GetBuilder<CartListParentController>(
            id: "tab",
            builder: (_) {
              return TabBarView(
                  controller: controller.tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    for (ProductTabModel tab in controller.tabList)
                      GetBuilder<CartListController>(
                          tag: "${tab.id}",
                          key: ValueKey(tab.id),
                          autoRemove: false,
                          builder: (_) {
                            return XLoadStateBuilder(
                                loadState: _.loadState,
                                retry: _.loadData,
                                loadingWidget: CartListSkeleton(),
                                builder: (BuildContext context) {
                                  return AutoList(
                                      // itemCount: _.cartList.length,
                                      // separatorBuilder:
                                      //     (BuildContext context, int i) {
                                      //   return Divider(
                                      //     height: BDimens.gap16,
                                      //     thickness: BDimens.gap16,
                                      //   );
                                      // },
                                      items: _.cartList,
                                      duration: Duration(milliseconds: 400),
                                      itemBuilder: (BuildContext context,
                                          CartPorductModel e) {
                                        return Slidable(
                                          key: ObjectKey(e),
                                          actionPane:
                                              SlidableBehindActionPane(),
                                          secondaryActions: [
                                            IconSlideAction(
                                              caption: '删除',
                                              color: Colors.red,
                                              icon: BIcons.del,
                                              onTap: () => _.remove(
                                                  element: e, tag: "${tab.id}"),
                                            ),
                                          ],
                                          child: Container(
                                            key: ValueKey(e.skuId),
                                            color: BColors.primaryColor,
                                            padding:
                                                EdgeInsets.all(BDimens.gap16),
                                            child: Column(
                                              children: [
                                                Obx(() => Row(
                                                      children: [
                                                        Checkbox(
                                                            // key: ObjectKey(e.id),
                                                            value: e.isChecked
                                                                .value,
                                                            onChanged:
                                                                (bool flag) =>
                                                                    _.checkItem(
                                                                        e,
                                                                        flag)),
                                                        Container(
                                                          width: 180.w,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: BDimens
                                                                      .gap20),
                                                          child: AspectRatio(
                                                            aspectRatio: 1.0,
                                                            child:
                                                                XCachedNetworkImage(
                                                              imageUrl: e.image,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "${e.productName}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            BDimens.sp28),
                                                                  ),
                                                                  Spacer(),
                                                                  Text(
                                                                    "¥${e.price.toStringAsFixed(2)}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            BDimens.sp28),
                                                                  ),
                                                                  Text(
                                                                      "${e.unit ?? ""}"),
                                                                ],
                                                              ),
                                                              Visibility(
                                                                visible: e
                                                                        .productType
                                                                    is CurtainProductType,
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: BDimens
                                                                          .gap20),
                                                                  child: Text(
                                                                    "${e.description}",
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 5,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            BDimens
                                                                                .sp24,
                                                                        color: BColors
                                                                            .descriptionTextColor),
                                                                  ),
                                                                ),
                                                              ),
                                                              Visibility(
                                                                visible: e
                                                                        .productType
                                                                    is FinishedProductType,
                                                                child:
                                                                    Container(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                4),
                                                                        decoration: BoxDecoration(
                                                                            color: BColors
                                                                                .scaffoldBgColor,
                                                                            borderRadius: BorderRadius.circular(
                                                                                4)),

                                                                        // padding: EdgeInsets.zero,
                                                                        // margin: EdgeInsets.only(
                                                                        //     top: BDimens.gap20),
                                                                        child: XRotationArrow(
                                                                            key: ValueKey(e
                                                                                .description),
                                                                            label:
                                                                                "${e.description}",
                                                                            labelStyle:
                                                                                TextStyle(fontSize: BDimens.sp24, color: BColors.descriptionTextColor),
                                                                            onTap: () => showFinishedProductAttrModal(context, id: "${e.productId}", cartProduct: e))),
                                                              ),
                                                              Visibility(
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  margin: EdgeInsets.only(
                                                                      top: BDimens
                                                                          .gap32),
                                                                  child:
                                                                      XStepCounter(
                                                                    width: 118,
                                                                    height: 28,
                                                                    key: ValueKey(e
                                                                        .count
                                                                        .value),
                                                                    initialValue: e
                                                                        .count
                                                                        .value,
                                                                    onValueChange:
                                                                        (String
                                                                            val) {
                                                                      _.onProductCountChange(
                                                                          e,
                                                                          val);
                                                                    },
                                                                  ),
                                                                ),
                                                                visible: e
                                                                        .productType
                                                                    is FinishedProductType,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                Visibility(
                                                  visible:
                                                      !GetUtils.isNullOrBlank(
                                                          e.attrsList),
                                                  child: GestureDetector(
                                                    onTap: () => Get.toNamed(
                                                        BAppRoutes
                                                                .modifyCurtainProductAttr +
                                                            "?id=${e.id}&category=${e.categoryType}",
                                                        arguments:
                                                            ModifyCurtainProductAttrEvent(
                                                                tag: e.id,
                                                                cart: e,
                                                                isFromCart:
                                                                    true,
                                                                category:
                                                                    "${tab.id}")),
                                                    child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    BDimens
                                                                        .gap16,
                                                                horizontal:
                                                                    BDimens
                                                                        .gap24),
                                                        color: BColors
                                                            .scaffoldBgColor,
                                                        margin: EdgeInsets.only(
                                                            left: 42,
                                                            top: 20,
                                                            bottom:
                                                                BDimens.gap36),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  ProductAttrCard(
                                                                attrList:
                                                                    e.attrsList,
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              child: Icon(
                                                                  BIcons.next),
                                                              onTap: () {},
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: e.productType
                                                      is CurtainProductType,
                                                  child: Container(
                                                    width: Get.width,
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "预计总金额:",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  BDimens.sp26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Text(
                                                          "¥${e.totalPrice.toStringAsFixed(2)}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  BDimens.sp32),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                });
                          })
                  ]);
            }),
        bottomNavigationBar: Container(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.all(BDimens.gap16),
          child: Row(
            // key: ValueKey(controller.totalPrice),
            children: [
              GetBuilder<CartListParentController>(
                  id: "isCheckedAll",
                  builder: (_) {
                    return Row(
                      children: [
                        Checkbox(
                          key: ValueKey(controller.isCheckedAll),
                          onChanged: (bool flag) {
                            _.isCheckedAll = flag;
                            _.update(["isCheckedAll", "totalPrice"]);
                          },
                          value: controller.isCheckedAll,
                        ),
                        Text("全选"),
                      ],
                    );
                  }),

              Spacer(),

              GetBuilder<CartListParentController>(
                  id: "buttonBar",
                  builder: (_) {
                    return Row(
                      children: [
                        GetBuilder<CartListParentController>(
                            id: "totalPrice",
                            builder: (_) {
                              return Visibility(
                                  visible: !_.isInEditMode,
                                  key: ValueKey(_.totalPrice),
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: BDimens.gap16),
                                    child: Row(
                                      children: [
                                        Text(
                                          "总价:",
                                          style: TextStyle(
                                              fontSize: BDimens.sp26,
                                              color: BColors.greyTextColor),
                                        ),
                                        Text(
                                          "¥${_.totalPrice.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: BColors.highLightColor,
                                              fontSize: BDimens.sp36,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                        Visibility(
                          visible: !_.isInEditMode,
                          child: ElevatedButton(
                              onPressed: controller.commit,
                              child: Text("提交订单")),
                        ),
                        Visibility(
                          visible: _.isInEditMode,
                          child: OutlinedButton(
                              onPressed: controller.batchRemove,
                              child: Text("删除所选")),
                        ),
                      ],
                    );
                  })
              // Obx(() {
              //   return Checkbox(
              //     key: ValueKey(controller.isCheckedAll),
              //     onChanged: (bool flag) {
              //       controller.isCheckedAll = flag;
              //       print(controller.isCheckedAll);
              //     },
              //     value: controller.isCheckedAll.value,
              //   );
              // }),
            ],
          ),
        )
        // bottomNavigationBar: Obx(() {
        //   print(controller.totalPrice);
        //   return Row(
        //     key: ValueKey(controller.tag +
        //         "${controller.totalPrice.value.toStringAsFixed(2)}"),
        //     children: [
        //       Checkbox(
        //           value: controller.isCheckedAll.value,
        //           onChanged: (bool flag) {
        //             controller.isCheckedAll = flag;
        //           }),
        //       Text("全选"),
        //       Text(
        //         controller.totalPrice.value.toStringAsFixed(2),
        //       )
        //     ],
        //   );
        // }),
        // body: GetBuilder(
        //   init: CartListController(),
        //   builder: (_){

        //   },
        // ),
        );
  }
}
