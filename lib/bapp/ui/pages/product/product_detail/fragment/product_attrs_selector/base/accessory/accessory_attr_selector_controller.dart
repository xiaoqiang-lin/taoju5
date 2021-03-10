/*
 * @Description: 配饰选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 11:15:13
 * @LastEditTime: 2021-01-18 15:17:06
 */

import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';

import '../base_attr_selector_controller.dart';

class AccessoryAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel accessory;

  @override
  void onInit() {
    accessory = taojuwuController.accessory ?? CurtainProductAttrModel();
    attr?.optionList?.first?.isChecked = true;
    super.onInit();
  }

  @override
  String get value => accessory.currentOptionName;
}
