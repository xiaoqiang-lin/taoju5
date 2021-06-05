/*
 * @Description:客户列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:09:30
 * @LastEditTime: 2021-06-04 14:25:13
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/customer/customer_category_model.dart';
import 'package:taoju5_b/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5_b/domain/model/customer/customer_model.dart';
import 'package:taoju5_b/domain/repository/customer/customer_repository.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';
import 'package:taoju5_b/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5_b/ui/widgets/base/x_view_state.dart';

class ChooseCustomerEventModel {
  String fromUrl;
  CustomerDetailModel customer;
  CustomerCategoryModel category;
  bool canChoose;
  ChooseCustomerEventModel({
    this.customer,
    this.fromUrl,
    this.category,
    this.canChoose = true,
  });
}

class CustomerListController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  List<CustomerCategoryModel> categoryList = [
    CustomerCategoryModel(
        count: 0, name: "初谈客户", icon: "init_customer.png", type: 0),
    CustomerCategoryModel(
        count: 0, name: "意向客户", icon: "potential_customer.png", type: 1),
    CustomerCategoryModel(
        count: 0, name: "跟进客户", icon: "following_customer.png", type: 2),
    CustomerCategoryModel(
        count: 0, name: "成交客户", icon: "finished_customer.png", type: 3),
  ];

  ScrollController scrollController;

  void onCategoryTap(CustomerCategoryModel e) {
    Get.toNamed(BAppRoutes.categoryCustomerList + "?type=${e?.type}",
        arguments: Get.arguments);
  }

  ///更新数量
  void updateCount(List<int> list) {
    for (int i = 0; i < list.length; i++) {
      categoryList[i].count = list[i];
    }
  }

  List<CustomerModel> customerList;

  XLoadState loadState = XLoadState.busy;
  Future<CustomerModelListWrapper> loadData() {
    loadState = XLoadState.busy;
    update();
    return _repository.customerList().then((CustomerModelListWrapper value) {
      customerList = value.list;
      updateCount(value.countList);
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  onCustomerTap(CustomerModel customer) {
    if (Get.arguments != null && Get.arguments is ChooseCustomerEventModel) {
      ChooseCustomerEventModel event = Get.arguments;
      String fromUrl = event.fromUrl;
      Get.find<CustomerProviderController>().setCustomer(customer);
      return Get.until((route) => Get.currentRoute.contains(fromUrl));
    }

    return Get.toNamed(BAppRoutes.customerDetail + "/${customer.id}");

    // bool isSelect = Get.arguments ?? false;
    // if (!isSelect) {}
    // Get.find<CustomerProviderController>().setCustomer(customer);
    // return Get.until((route) => Get.currentRoute.contains(
    //     (Get.isRegistered<CommitOrderController>()
    //         ? BAppRoutes.commitOrder
    //         : BAppRoutes.productDetail)));
  }

  @override
  void onInit() {
    loadData();
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }
}
