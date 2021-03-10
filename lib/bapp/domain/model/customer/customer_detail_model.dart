/*
 * @Description: 用户信息详情
 * @Author: iamsmiling
 * @Date: 2020-12-21 16:34:44
 * @LastEditTime: 2021-02-02 17:53:50
 */
import 'package:get/get.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/city_picker/x_city_picker.dart';
import 'package:taoju5/constants/x_gender.dart';
import 'package:taoju5/utils/json_kit.dart';

String getCustomerType(int code) {
  Map map = {0: '初谈客户', 1: '意向客户', 2: '跟进客户', 3: '成交客户'};
  return map[code] ?? map[0];
}

class CustomerDetailModel {
  String id;
  String name;
  String tel;
  String age;
  String wx;
  DateTime enterTime;
  int shopId;
  String type;
  CustomerAddressModel address;
  XGender gender;
  int cartCount;

  String get addressId => address?.addressId;
  String get concreteAddress =>
      "${address?.address?.address}${address?.detailAddress}";
  List<CustomerDetailKongoModel> kongoList = [
    CustomerDetailKongoModel(
        icon: "customer_collection.png", title: "收藏夹", onTap: () {}),
    CustomerDetailKongoModel(
        icon: "customer_cart.png", title: "购物车", onTap: () {}),
    CustomerDetailKongoModel(
        icon: "customer_order.png",
        title: "订单",
        onTap: () => Get.toNamed(BAppRoutes.orderList)),
    CustomerDetailKongoModel(
        icon: "customer_cart.png", title: "退款/售后", onTap: () {}),
  ];
  CustomerDetailModel(
      {this.id, this.name, this.address, this.tel, this.gender}) {
    gender ??= XGender.male;
    address ??= CustomerAddressModel();
  }

  CustomerDetailModel.fromJson(Map json) {
    id = "${json['id']}";
    name = json['client_name'];
    tel = json['client_mobile'];
    type = getCustomerType(json["client_type"]);
    age = "${json['client_age']}";
    wx = json['client_wx'];
    enterTime = JsonKit.getDateTimeFromMillseconds(
        GetUtils.isNullOrBlank(json['enter_time']) ? 0 : json['enter_time']);
    shopId = json['shop_id'];
    address = CustomerAddressModel.fromJsom(json);
    gender = getGenderById(JsonKit.asInt(json['client_sex'] ?? 1));
  }

  Map toJson() => {
        'id': id,
        'client_name': name,
        'client_mobile': tel,
        'client_wx': wx,
        'client_sex': getGenderId(gender),
        'enter_time': ((enterTime?.millisecondsSinceEpoch ?? 0) ~/ 1000),
        'province_id': address.address.provicne.id,
        'city_id': address.address.city.id,
        'district_id': address.address.district.id,
        'detail_address': address.detailAddress ?? '',
        'client_age': age,
        'mobile': tel,
        'province': address.address.provicne.id,
        'city': address.address.city.id,
        'district': address.address.district.id,
        'gender': getGenderId(gender),
        'address': address.detailAddress ?? '',
        'consigner': name,
      };
}

class CustomerAddressModel {
  AddressModel address;
  String detailAddress;
  String addressId;
  CustomerAddressModel();
  CustomerAddressModel.fromJsom(Map json) {
    addressId = json["address_id"];
    address = AddressModel.fromId(JsonKit.asInt(json['province_id']),
        JsonKit.asInt(json['city_id']), JsonKit.asInt(json['district_id']));

    detailAddress = json['detail_address'];
    print("__+++");
  }

  Map toJson() => {
        "province_id": address.provicne.id,
        "city_id": address.city.id,
        "district_id": address.district.id,
        "province": address.provicne.id,
        "city": address.city.id,
        "district": address.district.id,
        "detail_address": detailAddress,
        "province_name": address.provicne.name,
        "city_name": address.city.name,
        "district_name": address.district.name
      };
}

class CustomerDetailKongoModelListWrapper {
  List<CustomerDetailKongoModel> kongoList = [];
}

class CustomerDetailKongoModel {
  String icon;
  String title;
  Function onTap;

  CustomerDetailKongoModel({this.icon, this.title, this.onTap});
}
