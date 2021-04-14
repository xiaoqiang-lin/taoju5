import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/web_product_detail/web_product_detail_controller.dart';

class WebProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebProductDetailController());
  }
}
