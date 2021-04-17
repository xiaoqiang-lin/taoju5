/*
 * @Description: 地址
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-16 17:35:07
 */
import 'package:flutter/cupertino.dart';

class AddressEntity {
  String receiverName;
  String telephone;
  String concreteInfo;
  bool isDefault;
  int id;
  bool hasDeleted = false;
  String provinceName;
  String cityName;
  String districtName;
  String description;
  int provinceId;
  int cityId;
  int districtId;

  AddressEntity.empty();

  AddressEntity.fromJson(Map json) {
    receiverName = json["consigner"];
    telephone = json["mobile"];
    provinceName = json["province_name"];
    cityName = json["city_name"];
    districtName = json["district_name"];
    provinceId = json["province"];
    cityId = json["city"];
    districtId = json["district"];
    concreteInfo = json["address"];
    id = json["id"];
    isDefault = json["is_default"] == 1;
    description = json["all_address"];
  }

  AddressEntity.sample({@required int id, bool isDefault = false}) {
    this.id = id;
    receiverName = "青红造了个白";
    telephone = "13588414007";
    this.isDefault = isDefault;
    description = "浙江省杭州市临平区临平乔司街道世纪大道与南苑街道交叉口华元欢乐城4幢3513-2";
  }
}
