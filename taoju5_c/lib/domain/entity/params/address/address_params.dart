/*
 * @Description: 地址数据模型
 * @Author: iamsmiling
 * @Date: 2021-04-16 15:08:39
 * @LastEditTime: 2021-04-18 00:30:08
 */

import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

class AddressParamsEntity extends BaseParamsEntity {
  String? provinceName;
  late String? cityName;
  late String? districtName;
  late String receiverName;
  late String concreteInfo;
  late bool isDefault = false;
  late String telephone;
  late int? provinceId;
  late int? cityId;
  late int? districtId;
  late int addressId;

  AddressParamsEntity.empty();

  AddressParamsEntity.fromAddress(AddressEntity address) {
    addressId = address.id;
    provinceName = address.provinceName;
    provinceId = address.provinceId;
    cityName = address.cityName;
    cityId = address.cityId;
    districtName = address.districtName;
    districtId = address.districtId;
    telephone = address.telephone;
    receiverName = address.receiverName;
    concreteInfo = address.concreteInfo;
    isDefault = address.isDefault;
  }

  int get _isDefaultCode => isDefault ? 1 : 2;

  String? get area {
    if (provinceName == null || provinceName!.isEmpty) return null;
    return "${provinceName ?? ''} ${cityName ?? ''} ${districtName ?? ''}";
  }

  @override
  Map get params => {
        "id": addressId,
        "consigner": receiverName,
        "mobile": telephone,
        "province": provinceId,
        "city": cityId,
        "district": districtId,
        "address": concreteInfo,
        "is_default": _isDefaultCode
      };

  @override
  bool validate() {
    return true;
  }
}
