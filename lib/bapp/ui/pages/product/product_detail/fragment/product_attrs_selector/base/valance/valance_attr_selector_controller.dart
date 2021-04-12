/*
 * @Description: 幔头选择器
 * @Author: iamsmiling
 * @Date: 2021-01-18 13:29:13
 * @LastEditTime: 2021-01-18 14:04:21
 */
import 'package:taoju5/bapp/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/base_attr_selector_controller.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/utils/common_kit.dart';

class ValanceAttrSelectorController extends BaseAttrSelectorController {
  CurtainProductAttrModel attr;

  @override
  void onInit() {
    attr = taojuwuController.valance;
    filterValance();
    initCheckState();
    super.onInit();
  }

  void filterValance() {
    int targetTagId;
    if (Get.isRegistered<ProductDetailController>(tag: tag)) {
      targetTagId = Get.find<ProductDetailController>(tag: tag)?.product?.tagId;
    } else if (Get.isRegistered<ModifyCurtainProductAttrController>()) {
      ModifyCurtainProductAttrController attrController =
          Get.find<ModifyCurtainProductAttrController>();

      targetTagId = (attrController?.event?.cart?.tagId) ??
          (attrController?.event?.productTagId);
    }

    if (CommonKit.isNullOrZero(targetTagId)) {
      attr?.optionList = [];
    } else {
      attr?.optionList =
          attr?.optionList?.where((e) => e.tagId == targetTagId)?.toList();
    }
  }
}
