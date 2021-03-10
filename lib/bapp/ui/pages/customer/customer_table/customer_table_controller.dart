/*
 * @Description:用户表格
 * @Author: iamsmiling
 * @Date: 2021-02-01 14:26:37
 * @LastEditTime: 2021-02-01 14:36:08
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_category_model.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_table_model.dart';
import 'package:taoju5/bapp/domain/repository/customer/customer_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomerTableController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  CustomerCategoryModel category = Get.arguments;

  List<CustomerModel> customerList = [];

  RefreshController refreshController;

  int pageIndex = 1;

  List<String> fieldList = ["姓名", "性别", "年龄", "意向产品", "入店时间"];
  XLoadState loadState;
  Future loadData() {
    loadState = XLoadState.busy;
    update();

    return _repository.categoryCustomerList(
        params: {"client_type": category.type}).then((CustomerTableModel data) {
      customerList = data.customerList;
      if (GetUtils.isNullOrBlank(customerList)) {
        loadState = XLoadState.empty;
      } else {
        loadState = XLoadState.idle;
      }
    }).catchError((err) {
      print(err);
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  selectCustomer(CustomerModel customer) {
    // bool isSelect = Get.arguments ?? false;
    if (true) {
      return Get.toNamed(BAppRoutes.customerDetail + "/${customer.id}");
    }
    // Get.find<CustomerProviderController>().setCustomer(customer);
    // return Get.until((route) => Get.currentRoute.contains(
    //     (Get.isRegistered<CommitOrderController>()
    //         ? BAppRoutes.commitOrder
    //         : BAppRoutes.productDetail)));
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
    refreshController = RefreshController();
  }

  @override
  void onClose() {
    refreshController?.dispose();
    super.onClose();
  }
}
