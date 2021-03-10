import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/accessory/accessory_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_controller.dart';

class ModifyCurtainProductAttrBinding extends Bindings {
  @override
  void dependencies() {
    String tag = Get.parameters["id"];
    Get.lazyPut(() => ModifyCurtainProductAttrController());
    Get.lazyPut(() => GauzeAttrSelectorController(), tag: tag);
    Get.lazyPut(() => SectionalbarAttrSelectorController(), tag: tag);
    Get.lazyPut(() => ValanceAttrSelectorController(), tag: tag);
    Get.lazyPut(() => RibouxAttrSelectorController(), tag: tag);
    Get.lazyPut(() => AccessoryAttrSelectorController(), tag: tag);
  }
}
