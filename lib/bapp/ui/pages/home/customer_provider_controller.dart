/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-29 11:43:32
 * @LastEditTime: 2021-02-02 09:34:58
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/product_detail_controller.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_cart_button.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_like_button.dart';

class CustomerProviderController extends GetxController {
  CustomerDetailModel _customer;

  bool get isCustomerNull => _customer == null;
  String get abbrName {
    if (_customer == null || _customer?.name == null) return "请选择";
    if (_customer.name.length > 12) {
      return _customer.name.substring(0, 8) +
          "..." +
          _customer.name.substring(8, 11);
    }
    return _customer.name;
  }

  String get name =>
      GetUtils.isNullOrBlank(_customer?.name) ? "请选择" : _customer?.name;

  String get id => _customer?.id;
  CustomerDetailModel get customer => _customer;

  set customer(CustomerDetailModel model) {
    clear();
    _customer = model;
    update();
    refreshData();
  }

  setCustomer(CustomerModel model) {
    clear();
    _customer ??= CustomerDetailModel();
    _customer.id = model.id;
    _customer.name = model.name;
    update();
    refreshData();
  }

  void refreshData() {
    if (Get.isRegistered<CommitOrderController>()) {
      Get.find<CommitOrderController>().update(["customer"]);
    }

    if (Get.isRegistered<XLikeController>()) {
      Get.find<XLikeController>().loadData();
    }

    if (Get.isRegistered<XCountController>()) {
      Get.find<XCountController>().loadData();
    }
  }

  clear() {
    _customer = null;
    update();
    // refreshData();
  }

  void updateCartCount(int count) {
    _customer.cartCount = count;
    update(["count"]);
  }
}
