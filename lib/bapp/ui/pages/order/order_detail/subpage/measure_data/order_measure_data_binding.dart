import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/measure_data/order_measure_data_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';

class OrderMeasureDataBinding extends Bindings {
  @override
  void dependencies() {
    String tag = Get.parameters["id"];
    Get.lazyPut(() => OrderMeasureDataController());

    Get.lazyPut(() => WindowStyleSelectorController(tag: tag), tag: tag);
    Get.lazyPut(() => WindowPatternSelectorController(tag: tag), tag: tag);
  }
}
