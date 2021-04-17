import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/customer/customer_refund/customer_refund_controller.dart';

class CustomerRefundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerRefundController());
  }
}
