/*
 * @Description: 地址数据模型
 * @Author: iamsmiling
 * @Date: 2021-04-16 15:08:39
 * @LastEditTime: 2021-04-16 17:39:03
 */

import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

class AddressParamsEntity extends BaseParamsEntity {
  String provinceName;
  String cityName;
  String districtName;
  String receiverName;
  String concreteInfo;
  bool isDefault = false;
  String telephone;
  int provinceId;
  int cityId;
  int districtId;
  int addressId;

  AddressParamsEntity.empty();

  AddressParamsEntity.fromAddress(AddressEntity address) {
    assert(address != null);
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

  String get area {
    if (provinceName == null || provinceName.isEmpty) return null;
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
