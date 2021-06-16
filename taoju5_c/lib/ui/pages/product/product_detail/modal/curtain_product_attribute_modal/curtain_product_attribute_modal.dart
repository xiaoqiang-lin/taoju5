/*
 * @Description: 窗帘商品属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:56:23
 * @LastEditTime: 2021-05-31 15:24:19
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/component/modal_wrapper/modal_wrapper.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/product/component/product_action_bar.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/section/room_expansion_panel.dart';

import 'section/window_open_mode_panel.dart';
import 'section/window_pattern_expansion_panel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class CurtainProductAttributeModal extends StatelessWidget {
  final ProductDetailEntity product;
  final CurtainAttributeEntity attribute;
  const CurtainProductAttributeModal(
      {Key? key, required this.product, required this.attribute})
      : super(key: key);

  ///测装数据
  Widget _buildMeasureDataFragment(
      CurtainProductAttributeController controller) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: RoomExpansionPanel(
            room: attribute.measureData.room,
            onRoomChanged: controller.selectRoom),
      ),
      WindowPatternExpansionPanel(
        measureData: attribute.measureData,
        onWindowFacadeChanged: controller.selectWindow,
        onInstallModeChanged: controller.selectInstallMode,
      ),
      WindowOpenModePanel(
        measureData: attribute.measureData,
        onOpenModeChanged: controller.selectOpenMode,
        onChildOpenModeChanged: controller.selectChildOpenMode,
        onSizeChanged: controller.update,
      )
    ]);
  }

  Widget _buildMatchingSetFragment(
      CurtainProductAttributeController controller) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: R.dimen.dp20),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: attribute.matchingSet.attributes.length,
        itemBuilder: (BuildContext context, int i) {
          CurtainAddtionalProductEntity item =
              attribute.matchingSet.attributes[i];
          return Visibility(
            visible: item.options.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin:
                        EdgeInsets.only(top: R.dimen.dp18, bottom: R.dimen.dp7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShakeAnimationWidget(
                          isForward: false,
                          shakeAnimationController: item.shakeController,
                          shakeCount: 2,
                          shakeAnimationType: ShakeAnimationType.LeftRightShake,
                          shakeRange: 0.2,
                          child: Row(
                            children: [
                              Text(
                                item.label,
                                style: TextStyle(
                                    fontSize: R.dimen.sp14,
                                    fontWeight: FontWeight.w600,
                                    color: R.color.ff333333),
                              ),
                              Visibility(
                                visible: (GetUtils.isNullOrBlank(
                                        item.selectedOption?.name) ??
                                    true),
                                child: Container(
                                    margin: EdgeInsets.only(left: R.dimen.dp6),
                                    child: Text(
                                      item.hint,
                                      style: TextStyle(
                                          fontSize: R.dimen.sp9,
                                          color: R.color.ffff5005),
                                    )),
                              ),
                              Visibility(
                                visible: !(GetUtils.isNullOrBlank(
                                        item.selectedOption?.name) ??
                                    true),
                                child: Container(
                                    margin: EdgeInsets.only(left: R.dimen.dp6),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${item.selectedOption?.name ?? ""}",
                                          style: TextStyle(
                                              fontSize: R.dimen.sp9,
                                              color: R.color.ff999999),
                                        ),
                                        Visibility(
                                            visible: !CommonKit.isNullOrZero(
                                                item.selectedOption?.price),
                                            child: Text(
                                              " ¥${item.selectedOption?.price.toStringAsFixed(2)}",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: R.dimen.sp9,
                                                  color: R.color.ff999999),
                                            ))
                                      ],
                                    )),
                              ),
                              Spacer(),
                              Text(
                                "查看更多",
                                style: TextStyle(
                                    fontSize: R.dimen.sp12,
                                    color: R.color.ff333333),
                              ),
                              Image.asset(R.image.next,
                                  color: R.color.ff333333),
                            ],
                          ),
                        ),
                        Visibility(
                          visible:
                              !(GetUtils.isNullOrBlank(item.message) ?? true),
                          child: Container(
                              margin: EdgeInsets.only(top: R.dimen.dp5),
                              child: Text(
                                item.message,
                                style: TextStyle(
                                    fontSize: R.dimen.sp9,
                                    color: R.color.ffff5005),
                              )),
                        ),
                      ],
                    )),
                Container(
                  height: item.options.any((e) => e.price != 0) ? 150 : 132,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.options.length,
                      itemBuilder: (BuildContext context, int i) {
                        CurtainAddtionalProductOptionEntity option =
                            item.options[i];
                        return GestureDetector(
                          onTap: () =>
                              controller.selectAdditonalProduct(item, option),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(R.dimen.sp7),
                                border: Border.all(
                                    color: option.selected
                                        ? R.color.ffee9b5f
                                        : R.color.transparent)),
                            margin: EdgeInsets.only(right: R.dimen.dp8),
                            child: Column(
                              children: [
                                ChimeraImage(
                                  option.image,
                                  width: R.dimen.dp100,
                                  height: R.dimen.dp100,
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: R.dimen.dp10),
                                  child: Text(
                                    option.name,
                                    style: TextStyle(fontSize: R.dimen.sp12),
                                  ),
                                ),
                                Visibility(
                                    visible:
                                        !CommonKit.isNullOrZero(option.price),
                                    child: Text(
                                      "¥${option.price.toStringAsFixed(2)}",
                                      style: TextStyle(fontSize: R.dimen.sp12),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurtainProductAttributeController>(
      init: CurtainProductAttributeController(
          atrribute: attribute, product: product),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            _.hasFinished();
            return true;
          },
          child: ModalWrapper(builder: (BuildContext context) {
            return Scaffold(
              body: Container(
                color: R.color.ffffffff,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: R.dimen.dp12),
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
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                width: Get.width,
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => _.switchIndex(0),
                                      child: Row(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  left: R.dimen.dp20),
                                              child: Image.asset(R.image.back)),
                                          Text(
                                            "上一步",
                                            style: TextStyle(
                                                fontSize: R.dimen.sp14,
                                                color: R.color.ffee9b5f),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: R.dimen.width / 2 -
                                              R.dimen.dp56 -
                                              R.dimen.dp20 -
                                              R.dimen.dp14 * 2),
                                      child: Text(
                                        "窗帘配套",
                                        style: TextStyle(
                                            fontSize: R.dimen.sp14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // Expanded(
                        //   child: GestureDetector(
                        //     onTap: () => _.switchIndex(0),
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       color: _.currentIndex == 0
                        //           ? R.color.ffffffff
                        //           : R.color.fff5f5f5,
                        //       padding:
                        //           EdgeInsets.symmetric(vertical: R.dimen.dp12),
                        //       child: Text(
                        //         "测装数据",
                        //         style: TextStyle(
                        //             color: _.currentIndex == 0
                        //                 ? R.color.ffee9b5f
                        //                 : R.color.ffbcbcbc,
                        //             fontSize: R.dimen.sp16,
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: GestureDetector(
                        //     onTap: () => _.switchIndex(1),
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       color: _.currentIndex == 1
                        //           ? R.color.ffffffff
                        //           : R.color.fff5f5f5,
                        //       padding:
                        //           EdgeInsets.symmetric(vertical: R.dimen.dp12),
                        //       child: Text(
                        //         "窗帘配套",
                        //         style: TextStyle(
                        //             color: _.currentIndex == 1
                        //                 ? R.color.ffee9b5f
                        //                 : R.color.ffbcbcbc,
                        //             fontSize: R.dimen.sp16,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: IndexedStack(
                          sizing: StackFit.passthrough,
                          index: _.currentIndex,
                          children: [
                            _buildMeasureDataFragment(_),
                            _buildMatchingSetFragment(_)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: R.color.ffe5e5e5))),
                padding: EdgeInsets.only(
                    left: R.dimen.dp20,
                    right: R.dimen.dp20,
                    top: R.dimen.dp8,
                    bottom: Get.mediaQuery.padding.bottom + R.dimen.dp8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: attribute.measureData.sizeIsNotEmpty,
                      child: Text.rich(TextSpan(
                          text: "预计:\n",
                          style: TextStyle(
                              fontSize: R.dimen.sp12, color: R.color.ff333333),
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
                          onPressed: _.next,
                          constraints: BoxConstraints(
                              minHeight: 45,
                              minWidth: 200,
                              maxHeight: 45,
                              maxWidth: 200),
                        ),
                        ProductActionBar(
                          onAddToCart: _.addToCart,
                          onPurchase: _.buy,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
