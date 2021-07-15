/*
 * @Description: 选品弹窗
 * @Author: iamsmiling
 * @Date: 2021-07-02 11:20:03
 * @LastEditTime: 2021-07-08 15:29:17
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/modal_wrapper/modal_wrapper.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_page.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/section/matching_set_body.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/select_product_modal/select_product_modal_controller.dart';

Future openSelectProductModal(
  BuildContext context, {
  required ProductDetailEntity product,
}) {
  return showCupertinoModalPopup(
      context: context,
      barrierColor: R.color.ff00000.withOpacity(.6),
      builder: (BuildContext context) {
        return ModalWrapper(
          builder: (BuildContext context) {
            return GetBuilder<SelectProductModalController>(
              init: SelectProductModalController(product: product),
              builder: (_) {
                return Container(
                  color: R.color.ffffffff,
                  child: FutureLoadStateBuilder<SelectProductModalController>(
                      controller: _,
                      loadingBuilder: (BuildContext context) =>
                          SizedBox.shrink(),
                      builder: (_) {
                        return GetBuilder<CurtainProductAttributeController>(
                            builder: (_) {
                          return Scaffold(
                            body: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: R.dimen.dp12),
                                        child: IndexedStack(
                                          index: _.currentIndex,
                                          children: [
                                            Container(
                                              width: Get.width,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "测装数据",
                                                style: TextStyle(
                                                    fontSize: R.dimen.sp14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width,
                                              alignment: Alignment.center,
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    onTap: () =>
                                                        _.switchIndex(0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: R
                                                                        .dimen
                                                                        .dp20),
                                                            child: Image.asset(
                                                                R.image.back)),
                                                        Text(
                                                          "上一步",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  R.dimen.sp14,
                                                              color: R.color
                                                                  .ffee9b5f),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: R.dimen.width /
                                                                2 -
                                                            R.dimen.dp56 -
                                                            R.dimen.dp20 -
                                                            R.dimen.dp14 * 2),
                                                    child: Text(
                                                      "窗帘配套",
                                                      style: TextStyle(
                                                          fontSize:
                                                              R.dimen.sp14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: IndexedStack(
                                      sizing: StackFit.passthrough,
                                      index: _.currentIndex,
                                      children: [
                                        MeasureDataBody(
                                          measureData:
                                              Get.find<MeasureDataController>()
                                                  .measureData,
                                        ),
                                        MatchingsetBody(controller: _)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            bottomNavigationBar: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top:
                                          BorderSide(color: R.color.ffe5e5e5))),
                              padding: EdgeInsets.only(
                                  left: R.dimen.dp20,
                                  right: R.dimen.dp20,
                                  top: R.dimen.dp8,
                                  bottom: Get.mediaQuery.padding.bottom +
                                      R.dimen.dp8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                    visible: product.attribute.measureData
                                            .sizeIsNotEmpty ==
                                        true,
                                    child: Text.rich(TextSpan(
                                        text: "预计:\n",
                                        style: TextStyle(
                                            fontSize: R.dimen.sp12,
                                            color: R.color.ff333333),
                                        children: [
                                          TextSpan(
                                            text:
                                                "¥${_.priceDelegator.totalPrice.toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: R.dimen.sp14,
                                                color: R.color.ffff5005),
                                          )
                                        ])),
                                  ),
                                  IndexedStack(
                                    index: _.currentIndex,
                                    children: [
                                      PrimaryButton(
                                        text: "下一步",
                                        onPressed: _.nextWithoutValidate,
                                        constraints: BoxConstraints(
                                            minHeight: R.dimen.dp45,
                                            minWidth: R.dimen.dp200,
                                            maxHeight: R.dimen.dp45,
                                            maxWidth: R.dimen.dp200),
                                      ),
                                      ProductActionBar(
                                        onAddToCart: _.addToCart,
                                        onSelect: Get.find<
                                                SelectProductModalController>()
                                            .select,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                );
              },
            );
          },
        );
      });
}
