/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 17:28:37
 * @LastEditTime: 2021-01-11 14:27:00
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5/bapp/domain/repository/customer/customer_repository.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_view_state.dart';

class CustomerDetailController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  XLoadState loadState = XLoadState.idle;

  CustomerDetailModel customer;

  Future<CustomerDetailModel> loadData() {
    loadState = XLoadState.busy;
    final id = Get.parameters["id"];
    return _repository
        .customerDetail(params: {"id": id}).then((CustomerDetailModel model) {
      customer = model;
      loadState = XLoadState.idle;
    }).catchError((err) {
      loadState = XLoadState.error;
    }).whenComplete(update);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}

extension CustomerAddressModelKit on CustomerAddressModel {
  String get concreteAddress => GetUtils.isNullOrBlank(address?.address)
      ? ""
      : "${address?.address}${GetUtils.isNullOrBlank(detailAddress) ? "" : detailAddress}";
}

extension CustomerDetailModelKit on CustomerDetailModel {
  String get concreteAddress => address?.concreteAddress;
}
