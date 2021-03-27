import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/bapp/domain/repository/customer/customer_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:taoju5/extensions/string_kit.dart';

class CustomerSearchController extends GetxController {
  CustomerRepository _repository = CustomerRepository();
  String keyword = "";
  XLoadState loadState = XLoadState.busy;
  List<CustomerModel> customerList;

  Future loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.customerList(params: {"keyword": keyword}).then(
        (CustomerModelListWrapper wrapper) {
      customerList = wrapper.list;
      if (GetUtils.isNullOrBlank(customerList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    keyword = "${Get.parameters["keyword"]}".stringDecode();

    loadData();
    super.onInit();
  }

  onCustomerTap(CustomerModel e) {
    if (Get.arguments != null && Get.arguments is ChooseCustomerEventModel) {
      ChooseCustomerEventModel event = Get.arguments;
      if (!GetUtils.isNullOrBlank(event.fromUrl)) {
        Get.find<CustomerProviderController>().setCustomer(e);
        return Get.until((route) => Get.currentRoute == event?.fromUrl);
      }
    }
    return Get.toNamed(BAppRoutes.customerDetail + "/${e.id}");
  }
}
