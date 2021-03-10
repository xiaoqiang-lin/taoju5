/*
 * @Description: 工艺方式
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:22:29
 * @LastEditTime: 2021-01-18 15:17:22
 */

import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';

class CraftAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  @override
  void onInit() {
    attr = taojuwuController.craft;
    attr?.optionList?.first?.isChecked = true;
    super.onInit();
  }
}
