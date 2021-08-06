/*
 * @Description:窗帘属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:59:53
 * @LastEditTime: 2021-08-06 10:15:14
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/modal_wrapper/modal_wrapper.dart';
import 'package:taoju5_c/component/net/flutter_loadstate_builder.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';
import 'package:get/get.dart';

import 'curtain_product_attribute_modal/section/matching_set_body.dart';
import 'curtain_product_attribute_modal/section/measure_data_body.dart';

Future<bool?> openCurtainProductAttributeModal(
  BuildContext context, {
  required ProductDetailEntity product,
  Function()? addToCart,
  Function()? buy,
  Widget? actionBar,
}) async {
  ///如果 [CurtainProductAttributeController] 没有注册过 则注册
  if (!product.initialzed &&
      !Get.isRegistered<CurtainProductAttributeController>(
          tag: "${product.id}")) {
    Get.lazyPut(() => CurtainProductAttributeController(product: product),
        tag: "${product.id}");
  } else {
    /// 如果 [CurtainProductAttributeController] 注册过，则将p重新赋值
    product.prototype(
        Get.find<CurtainProductAttributeController>(tag: "${product.id}")
            .product);
  }
  return showCupertinoModalPopup<bool?>(
      context: context,
      barrierColor: R.color.ff00000.withOpacity(.6),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GetBuilder<CurtainProductAttributeController>(
          autoRemove: false,
          tag: "${product.id}",
          builder: (_) {
            return FutureLoadStateBuilder<CurtainProductAttributeController>(
                controller: _,
                tag: "${product.id}",
                loadingBuilder: (BuildContext context) => SizedBox.shrink(),
                builder: (_) {
                  return ModalWrapper(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Scaffold(
                            body: IndexedStack(
                              index: _.currentIndex,
                              children: [
                                MeasureDataBody(
                                    product: product, controller: _),
                                MatchingsetBody(controller: _)
                              ],
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
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: _.currentIndex == 0,
                                        child: PrimaryButton(
                                          text: "下一步",
                                          onPressed: _.next,
                                          constraints: BoxConstraints(
                                              minHeight: R.dimen.dp45,
                                              minWidth: R.dimen.dp200,
                                              maxHeight: R.dimen.dp45,
                                              maxWidth: R.dimen.dp200),
                                        ),
                                      ),
                                      Visibility(
                                          visible: _.currentIndex == 1,
                                          child: actionBar == null
                                              ? ProductActionBar(
                                                  onAddToCart: addToCart,
                                                  onPurchase: buy,
                                                )
                                              : actionBar)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _.currentIndex == 1,
                            child: GestureDetector(
                                onTap: () => _.switchIndex(0),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: R.dimen.dp16, top: R.dimen.dp12),
                                  child: Row(
                                    children: [
                                      Image.asset(R.image.back),
                                      Text(
                                        "上一步",
                                        style: TextStyle(
                                            fontSize: R.dimen.sp14,
                                            color: R.color.ffee9b5f),
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      );
                    },
                  );
                });
          },
        );
      });
}
