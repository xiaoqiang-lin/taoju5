/*
 * @Description: CustomerEditController
 * @Author: iamsmiling
 * @Date: 2020-12-22 09:59:14
 * @LastEditTime: 2021-01-20 09:29:01
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5/bapp/domain/model/customer/customer_model.dart';
import 'package:taoju5/bapp/domain/repository/customer/customer_repository.dart';
import 'package:taoju5/bapp/domain/repository/taojuwu/taojuwu_repository.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_detail/customer_detail_controller.dart';
import 'package:taoju5/bapp/ui/pages/customer/customer_list/customer_list_controller.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:taoju5/config/app_config.dart';
import 'package:taoju5/utils/x_logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';

class CustomerEditController extends GetxController {
  CustomerRepository _repository = CustomerRepository();

  ///[target]修改句柄
  CustomerDetailModel target;

  String fromUrl;

  bool canChoose = false;

  ChooseCustomerEventModel event;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is ChooseCustomerEventModel) {
      event = Get.arguments;
      target = event.customer;
      fromUrl = event.fromUrl;
      canChoose = event.canChoose;
    }
    target ??= CustomerDetailModel();
    _getLocation();
    super.onInit();
  }

  void _getLocation() {
    Geolocator.getCurrentPosition(forceAndroidLocationManager: true)
        .then((Position position) {
      TaojuwuRepository repository = TaojuwuRepository();
      repository.locate({
        "key": AppConfig.tencentMapKey,
        "location": "${position.latitude},${position.longitude}"
      }).then((value) {
        print(value);
      });
    });
  }

  Future edit() {
    if (!GetUtils.isPhoneNumber(target.tel)) {
      EasyLoading.showInfo("请输入正确的手机号");
      return Future.error(false);
    }
    XLogger.v(target.toJson());
    return _repository.editCustomer(params: target.toJson());
  }

  void confirm() {
    ///更新客户详情
    if (Get.isRegistered<CustomerDetailController>()) {
      CustomerDetailController detailController =
          Get.find<CustomerDetailController>();
      detailController.customer = target;
      detailController.update();
    }
    if (Get.isRegistered<CustomerListController>()) {
      ///更新客户列表页
      CustomerListController listController =
          Get.find<CustomerListController>();
      listController?.loadData();
    }

    if (event != null) {
      Get.find<CustomerProviderController>()
          .setCustomer(CustomerModel(id: target.id, name: target.name));
      Get.back();
      return;
    }
    Get.back(result: target);
  }
}
