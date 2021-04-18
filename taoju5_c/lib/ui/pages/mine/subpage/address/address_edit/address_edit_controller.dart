/*
 * @Description: 收货地址编辑页面
 * @Author: iamsmiling
 * @Date: 2021-04-16 09:16:27
 * @LastEditTime: 2021-04-18 08:29:35
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5_c/component/picker/city_picker.dart';
import 'package:taoju5_c/domain/entity/params/address/address_params.dart';
import 'package:taoju5_c/domain/repository/mine_api.dart';

class AddressEditController extends GetxController {
  late AddressParamsEntity addressArg;

  ///标识是否为新新建地址
  late bool isNew;

  ///城市选择器为可读,需要控制器才能显示内容
  late TextEditingController areaController;

  AddressEditController({required currentAddress}) {
    isNew = currentAddress == null;
    addressArg = currentAddress == null
        ? AddressParamsEntity.empty()
        : AddressParamsEntity.fromAddress(currentAddress);
  }

  @override
  void onInit() {
    areaController = TextEditingController(text: addressArg.area);
    super.onInit();
  }

  void setDefaultAddress(bool flag) {
    addressArg.isDefault = flag;
    update(["is_default"]);
  }

  void setReceiverName(String val) {
    addressArg.receiverName = val;
  }

  void setTelephone(String val) {
    addressArg.telephone = val;
  }

  void setArea(AddressModel address) {
    addressArg.provinceName = address.provicne.name;
    addressArg.provinceId = address.provicne.id;
    addressArg.cityName = address.city.name;
    addressArg.cityId = address.city.id;
    addressArg.districtName = address.district.name;
    addressArg.districtId = address.district.id;
  }

  void setConcreteInfo(String val) {
    addressArg.concreteInfo = val;
  }

  Future selectArea() {
    AddressModel addressModel = AddressModel.fromName(
        addressArg.provinceName, addressArg.cityName, addressArg.districtName);
    return cshowCityPicker(Get.context!, addressResult: addressModel)
        .then((value) {
      if (value is AddressModel) {
        setArea(value);
        areaController.text = addressArg.area!;
      }
    });
  }

  bool get isDefaultAddress => addressArg.isDefault;

  Future _sendRequest() {
    if (addressArg.validate()) {
      CMineRepository _repository = CMineRepository();
      if (isNew) {
        return _repository.addAddress(addressArg.params);
      } else {
        return _repository.editAddress(addressArg.params);
      }
    }
    throw ArgumentError();
  }

  Future submit() {
    return _sendRequest().then((value) {
      Get.back();
    });
  }
}
