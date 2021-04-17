import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';
import 'package:taoju5_b/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';

class EditMeasureDataBinding extends Bindings {
  @override
  void dependencies() {
    String tag = Get.parameters["id"];

    Get.put(RoomAttrSelectorController(), tag: tag, permanent: true);

    Get.put(WindowPatternSelectorController(tag: tag),
        tag: tag, permanent: true);

    Get.put(WindowStyleSelectorController(tag: tag), tag: tag, permanent: true);

    Get.put(SizeSelectorController(), tag: tag, permanent: true);
  }
}
