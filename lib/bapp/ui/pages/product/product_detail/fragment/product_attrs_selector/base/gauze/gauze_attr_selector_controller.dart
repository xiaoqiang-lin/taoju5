/*
 * @Description: 窗纱选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:11:54
 * @LastEditTime: 2021-01-18 15:44:43
 */

import 'package:get/utils.dart';
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';

class GauzeAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  @override
  void onInit() {
    attr = taojuwuController.gauze;
    attr?.optionList?.first?.isChecked = true;

    super.onInit();
  }

  bool get hasGauze {
    if (GetUtils.isNullOrBlank(attr?.optionList)) return false;
    return !RegExp("不要").hasMatch(attr?.currentOptionName);
  }
}
