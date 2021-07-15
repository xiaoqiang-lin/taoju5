/*
 * @Description:窗帘配套
 * @Author: iamsmiling
 * @Date: 2021-07-02 14:16:18
 * @LastEditTime: 2021-07-08 15:31:39
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/res/R.dart';

import '../curtain_product_attribute_controller.dart';

class MatchingsetBody extends StatelessWidget {
  final CurtainProductAttributeController controller;
  const MatchingsetBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: R.dimen.dp20),
        shrinkWrap: true,
        itemCount: controller.product.attribute.matchingSet.attributes.length,
        itemBuilder: (BuildContext context, int i) {
          CurtainAddtionalProductEntity item =
              controller.product.attribute.matchingSet.attributes[i];
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
}
