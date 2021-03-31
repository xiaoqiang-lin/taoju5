/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 10:24:16
 * @LastEditTime: 2021-02-01 16:04:01
 */
import 'package:flutter/foundation.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_mixin_model.dart';
import 'package:taoju5/bapp/ui/modal/product/room_attr_selector.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/design_product/design_product_modal/design_product_modal_controller.dart';
import 'package:get/get.dart';

class RoomAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  @override
  void onInit() {
    attr = taojuwuController.room;
    initCheckState();
    super.onInit();
  }

  String get value => attr?.currentOptionName;
  String get id => attr?.currentOptionId;
  String get typeName => attr?.typeName;

  void select(
      CurtainProductAttrModel attr, CurtainProductAttrOptionModel option) {
    super.select(attr, option);
    update(["options"]);
  }

  Future openRoomAttrSelectorModal(
      {@required String tag,
      @required Function onConfirm,
      ProductMixinModel product}) {
    return showRoomAttrSelectorModal(tag: tag, onConfirm: onConfirm)
        .then((data) {
      if (product != null) {
        product.room = value;
        product.roomId = id;
        Get.find<DesignProductModalController>().update();
      }
    });
  }

  void initWithMeasureData(OrderMeasureDataModel measureData) {
    attr?.optionList?.forEach((o) {
      o.isChecked = o.name == measureData.room;
    });
    update();
  }
}
