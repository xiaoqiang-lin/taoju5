/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-17 17:40:32
 * @LastEditTime: 2021-01-19 13:40:30
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5_b/domain/model/product/product_mixin_model.dart';
import 'package:taoju5_b/res/b_dimens.dart';
import 'package:taoju5_b/ui/modal/product/base/x_base_attr_modal.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5_b/ui/widgets/common/button/x_check_button.dart';

Future showRoomAttrSelectorModal(
    {@required String tag,
    @required Function onConfirm,
    ProductMixinModel product}) {
  return showCupertinoModalPopup(
      context: Get.context,
      builder: (BuildContext context) {
        return XBaseAttrModal(
            title: "空间选择",
            onConfirm: onConfirm,
            height: Get.height * .5,
            builder: (BuildContext context) {
              return GetBuilder<RoomAttrSelectorController>(
                tag: tag,
                id: "options",
                builder: (_) {
                  return WillPopScope(
                    onWillPop: _.reset,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: BDimens.gap24),
                      child: Column(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            // crossAxisAlignment: ,
                            // spacing: BDimens.gap24,

                            runSpacing: BDimens.gap32,
                            children: [
                              for (CurtainProductAttrOptionModel o
                                  in _.attr.optionList)
                                Container(
                                  margin: EdgeInsets.only(left: BDimens.gap16),
                                  child: XCheckButton(
                                      isChecked: o.isChecked,
                                      constraints: BoxConstraints(
                                          minWidth: 64, minHeight: 32),
                                      onPresss: () => _.select(_.attr, o),
                                      child: Text(o.name)),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            });
      });
}
