import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_controller.dart';

class OrderMainfestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderMainfestController());
  }
}
