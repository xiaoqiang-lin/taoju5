import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/order_log/order_log_controller.dart';

class OrderLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderLogController());
  }
}
