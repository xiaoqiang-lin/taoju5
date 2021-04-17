/*
 * @Description: 数据访问
 * @Author: iamsmiling
 * @Date: 2020-12-18 17:23:17
 * @LastEditTime: 2021-04-17 18:04:54
 */

import 'package:taoju5_b/domain/model/customer/customer_model.dart';

class TaojuwuStorage {
  TaojuwuStorage._();

  static TaojuwuStorage _singleton = TaojuwuStorage._();

  factory TaojuwuStorage() => _singleton;

  static final Map _map = {};

  dynamic read(dynamic key) => _map[key];

  void write(dynamic key, dynamic value, {bool forceWrite = true}) {
    if (forceWrite) {
      _map[key] = value;
      return;
    }
    if (_map[key] != null) return;
  }

  void update(dynamic key, dynamic value) {
    _map[key] = value;
  }
}

class TaojuwuStorageAccessor {
  TaojuwuStorageAccessor._();
  static TaojuwuStorageAccessor _singleton = TaojuwuStorageAccessor._();
  factory TaojuwuStorageAccessor() => _singleton;

  ///[当前选中顾客信息保存相关]
  static const String _kCustomerKey = "currentCustomer";

  CustomerModel get customer =>
      CustomerModel.fromJson(TaojuwuStorage().read(_kCustomerKey));

  set customer(CustomerModel customer) {
    TaojuwuStorage().write(_kCustomerKey, customer);
  }

  ///[门店商品属性相关]
  static const String _kShopCurtainProductAttrs = "shopCurtainProductAttrs";

  set shopCurtainProductAttrs(Map json) {
    TaojuwuStorage().write(_kShopCurtainProductAttrs, json);
  }

  Map get shopCurtainProductAttrs =>
      TaojuwuStorage().read(_kShopCurtainProductAttrs);

  static const String _kCurtainProductAttrData = "_kCurtainProductAttrData";

  set curtainProductAttrData(Map json) {
    TaojuwuStorage().write(_kCurtainProductAttrData, json);
  }

  Map get curtainProductAttrData =>
      TaojuwuStorage().read(_kCurtainProductAttrData);
}
