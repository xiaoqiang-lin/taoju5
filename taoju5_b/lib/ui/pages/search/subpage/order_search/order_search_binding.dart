import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/search/subpage/order_search/order_search_controller.dart';

class OrderSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderSearchController());
  }
}
