/*
 * @Description:型材选择
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:26:33
 * @LastEditTime: 2021-01-19 15:46:45
 */
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';

class SectionalbarAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  @override
  void onInit() {
    attr = taojuwuController.sectionalbar;
    attr?.optionList?.first?.isChecked = true;

    super.onInit();
  }
}
