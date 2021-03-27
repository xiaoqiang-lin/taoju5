import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/search/subpage/customer_search/customer_search_controller.dart';

class CustomerSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerSearchController());
  }
}
