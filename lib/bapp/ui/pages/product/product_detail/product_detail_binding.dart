/*
 * @Description: productDetailBinding
 * @Author: iamsmiling
 * @Date: 2020-12-21 14:42:56
 * @LastEditTime: 2021-02-01 16:59:42
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/craft/craft_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_register_controller.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_cart_button.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_like_button.dart';

import 'fragment/product_attrs_selector/base/accessory/accessory_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/gauze/gauze_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    String id = Get.parameters["id"];
    Get.lazyPut(() => ProductRegisterController(id));

    ///空间选择器
    Get.lazyPut(() => RoomAttrSelectorController(), tag: id, fenix: true);

    ///配饰选择器
    Get.lazyPut(() => AccessoryAttrSelectorController(), tag: id, fenix: true);

    ///窗纱选择器
    Get.lazyPut(() => GauzeAttrSelectorController(), tag: id, fenix: true);

    ///工艺方式
    Get.lazyPut(() => CraftAttrSelectorController(), tag: id, fenix: true);

    ///型材
    Get.lazyPut(() => SectionalbarAttrSelectorController(),
        tag: id, fenix: true);

    ///里布
    Get.lazyPut(() => RibouxAttrSelectorController(), tag: id, fenix: true);

    ///幔头
    Get.lazyPut(() => ValanceAttrSelectorController(), tag: id, fenix: true);

    ///窗型
    Get.lazyPut(() => WindowPatternSelectorController(tag: id),
        tag: id, fenix: true);

    ///尺寸大小
    Get.lazyPut(() => SizeSelectorController(), tag: id, fenix: true);

    Get.lazyPut(() => WindowStyleSelectorController(tag: id),
        tag: id, fenix: true);

    Get.lazyPut(() => ProductDetailController(), tag: id);

    Get.lazyPut(() => XLikeController());

    Get.lazyPut(() => XCountController());
  }
}
