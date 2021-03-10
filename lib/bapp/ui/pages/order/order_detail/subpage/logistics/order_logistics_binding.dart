import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/order_logistics_controller.dart';

class OrderLogisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderLogisticsController());
  }
}
