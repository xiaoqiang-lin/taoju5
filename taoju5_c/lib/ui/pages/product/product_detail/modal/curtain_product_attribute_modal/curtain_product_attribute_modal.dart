/*
 * @Description: 窗帘商品属性选择
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:56:23
 * @LastEditTime: 2021-05-10 11:35:15
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/expansion_tile/attribute_expansion_tile.dart';
import 'package:taoju5_c/component/modal_wrapper/modal_wrapper.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';

class CurtainProductAttributeModal extends StatelessWidget {
  final ProductDetailEntity product;
  final CurtainAttributeEntity attribute;
  const CurtainProductAttributeModal(
      {Key? key, required this.product, required this.attribute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurtainProductAttributeController>(
      init: CurtainProductAttributeController(
          arribute: attribute, product: product),
      builder: (_) {
        return ModalWrapper(builder: (BuildContext context) {
          return Container(
            color: R.color.ffffffff,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        color: R.color.ffffffff,
                        padding: EdgeInsets.symmetric(vertical: R.dimen.dp12),
                        child: Text(
                          "测装数据",
                          style: TextStyle(
                              color: R.color.ffee9b5f,
                              fontSize: R.dimen.sp16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        color: R.color.fff5f5f5,
                        padding: EdgeInsets.symmetric(vertical: R.dimen.dp12),
                        child: Text(
                          "窗帘配套",
                          style: TextStyle(
                              color: R.color.ffbcbcbc,
                              fontSize: R.dimen.sp16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
                IndexedStack(
                  children: [
                    Column(
                      children: [
                        AttributeExpansionTile(
                          title: Text("空间"),
                          collapsedBackgroundColor: R.color.transparent,
                          backgroundColor: R.color.transparent,
                          trailingLabel: Text("客厅"),
                          children: [
                            Wrap(
                              spacing: R.dimen.dp10,
                              // runSpacing: R.dimen.dp14 / 2,
                              children: [
                                for (WindowRoomOptionEntity item
                                    in attribute.measureData.room.options)
                                  PrimaryButton(
                                    text: item.name,
                                    onPressed: () {},
                                    radius: R.dimen.sp4,
                                    mode: item.selected
                                        ? PrimaryButtonMode.elevatedButton
                                        : PrimaryButtonMode.outlinedButton,
                                  )
                              ],
                            )
                          ],
                        ),
                        AttributeExpansionTile(
                          title: Text("窗型"),
                          collapsedBackgroundColor: R.color.transparent,
                          backgroundColor: R.color.transparent,
                          trailingLabel: Text("单窗/非飘窗/无盒"),
                          children: [
                            Wrap(
                              spacing: R.dimen.dp10,
                              // runSpacing: R.dimen.dp14 / 2,
                              children: [
                                for (WindowRoomOptionEntity item
                                    in attribute.measureData.room.options)
                                  PrimaryButton(
                                    text: item.name,
                                    onPressed: () {},
                                    radius: R.dimen.sp4,
                                    mode: item.selected
                                        ? PrimaryButtonMode.elevatedButton
                                        : PrimaryButtonMode.outlinedButton,
                                  )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }
}
