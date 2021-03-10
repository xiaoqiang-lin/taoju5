/*
 * @Description: CustomerAddressEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 11:19:26
 * @LastEditTime: 2021-02-10 10:53:41
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/commit_order/commit_order_controller.dart';
import 'package:taoju5/constants/x_gender.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5/bapp/domain/repository/customer/customer_repository.dart';
import 'package:taoju5/bapp/interface/i_xselectable.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/subpage/product_share/product_share_controller.dart';
import 'package:taoju5/utils/x_logger.dart';
import 'package:taoju5/validator/params_validator.dart';
import 'package:taoju5/xdio/x_dio.dart';

class CustomerGenderOptionModel implements IXSelectable {
  @override
  bool isChecked;
  XGender gender;
  String name;
  String id;

  CustomerGenderOptionModel(
      {this.isChecked = false, @required this.gender, @required this.name});
}

class CustomerEditAddressParamsModel extends ParamsValidator {
  final CustomerDetailModel customer;

  CustomerEditAddressParamsModel({@required this.customer});
  String get genderId => "${customer?.gender?.index}";
  Map get params {
    Map map = {
      "consigner": customer?.name,
      "gender": (customer?.gender?.index ?? 1),
      "mobile": customer?.tel,
      "address": customer?.address?.detailAddress,
      "detail_address": customer?.address?.detailAddress
    };
    Map address = customer?.address?.toJson();
    map.addAll(address ?? {});
    return map;
  }

  @override
  bool validate({flag}) => [
        isPhoneNumber(customer?.tel),
        isGenderNull(genderId),
        isNullOrBlank(customer?.address?.detailAddress, message: "门牌号不能为空哦")
      ].reduce((a, b) => a && b);
}

class CustomerAddressEditController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  CustomerDetailModel customer;

  final customerProviderController = Get.find<CustomerProviderController>();

  String get customerId => Get.parameters["id"];

  bool get isCustomerIdNull {
    String id = Get.parameters["id"];
    if (id == "null") return true;

    return GetUtils.isNullOrBlank(id);
  }

  bool get isAddressIdNull {
    return GetUtils.isNullOrBlank(
        customerProviderController?.customer?.addressId);
  }

  List<CustomerGenderOptionModel> genderOptions = [
    CustomerGenderOptionModel(
        gender: XGender.male, name: "先生", isChecked: true),
    CustomerGenderOptionModel(
        gender: XGender.female, name: "女士", isChecked: false),
  ];

  Future _loadData() {
    customer = customerProviderController.customer ?? CustomerDetailModel();
    genderOptions.forEach((e) {
      e.isChecked = e.gender == customer.gender;
    });
    if (isCustomerIdNull) return Future.value(0);
    if (!isAddressIdNull) return Future.value(0);

    return _repository.customerDetail(params: {"id": customerId}).then(
        (CustomerDetailModel value) {
      customer = value;
      customerProviderController.customer = customer;
      genderOptions.forEach((e) {
        e.isChecked = e.gender == customer.gender;
      });
    }).whenComplete(update);
  }

  bool get isFromShare => Get.isRegistered<ProductShareController>();
  Future submit() {
    CustomerEditAddressParamsModel params =
        CustomerEditAddressParamsModel(customer: customer);
    if (!params.validate()) throw Future.value(false);
    if (isFromShare) {
      return _syncSubmit(params);
    }
    return _asyncSubmit(params);
  }

  Future _asyncSubmit(CustomerEditAddressParamsModel params) {
    return _repository
        .editAddress(params: params?.params)
        .then((BaseResponse response) {
      _saveCustomerInfo(params, addressId: response.data);
    });
  }

  Future _syncSubmit(CustomerEditAddressParamsModel params) {
    XLogger.v(params.params);
    _saveCustomerInfo(params);
    return Future.value(true);
  }

  void _saveCustomerInfo(CustomerEditAddressParamsModel params,
      {String addressId = "-1"}) {
    customerProviderController.customer = customer;
    customerProviderController.customer?.address?.addressId = addressId;
    customerProviderController.update(["address"]);
    if (Get.isRegistered<CommitOrderController>()) {
      Get.find<CommitOrderController>().update(["customer"]);
    }
  }

  @override
  void onInit() {
    _loadData();

    super.onInit();
  }

  void selectGender(CustomerGenderOptionModel option) {
    genderOptions.forEach((e) {
      e.isChecked = e == option;
    });
    customer?.gender = option.gender;
    update(["gender"]);
  }
}
