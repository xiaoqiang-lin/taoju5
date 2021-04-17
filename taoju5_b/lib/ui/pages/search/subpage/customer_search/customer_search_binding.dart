import 'package:get/get.dart';
import 'package:taoju5_b/ui/pages/search/subpage/customer_search/customer_search_controller.dart';

class CustomerSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerSearchController());
  }
}
