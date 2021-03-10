/*
 * @Description: 空间选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 10:24:16
 * @LastEditTime: 2021-02-01 16:04:01
 */
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';

class RoomAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  void onInit() {
    attr = taojuwuController.room;
    attr?.optionList?.first?.isChecked = true;
    attr?.optionList?.first?.hasConfirmed = true;
    super.onInit();
  }

  String get value => attr?.currentOptionName;

  void select(
      CurtainProductAttrModel attr, CurtainProductAttrOptionModel option) {
    super.select(attr, option);
    update(["options"]);
  }

  @override
  void onClose() {
    print("+++++++++++++++删除空间属性onClose++++++++++++++++");
    super.onClose();
  }
}
