import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_refund/customer_refund_controller.dart';

class CustomerRefundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerRefundController());
  }
}
