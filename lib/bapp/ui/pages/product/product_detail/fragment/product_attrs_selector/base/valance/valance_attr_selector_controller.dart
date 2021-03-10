/*
 * @Description: 幔头选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:29:13
 * @LastEditTime: 2021-01-18 14:04:21
 */
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';

class ValanceAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  @override
  void onInit() {
    attr = taojuwuController.valance;
    attr?.optionList?.first?.isChecked = true;
    super.onInit();
  }
}
