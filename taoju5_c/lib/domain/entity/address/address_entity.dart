/*
 * @Description: 地址
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-18 12:55:13
 */

class AddressEntity {
  late String receiverName;
  late String telephone;
  late String concreteInfo;
  late bool isDefault;
  late int id;
  late bool hasDeleted = false;
  late String provinceName;
  late String cityName;
  late String districtName;
  late String description;
  late int provinceId;
  late int cityId;
  late int districtId;

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

  AddressEntity.sample({required int id, bool isDefault = false}) {
    this.id = id;
    receiverName = "青红造了个白";
    telephone = "13588414007";
    this.isDefault = isDefault;
    description = "浙江省杭州市临平区临平乔司街道世纪大道与南苑街道交叉口华元欢乐城4幢3513-2";
  }
}
