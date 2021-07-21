/*
 * @Description: 我的
 * @Author: iamsmiling
 * @Date: 2021-04-16 16:38:20
 * @LastEditTime: 2021-07-16 10:55:45
 */

import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/footprint/footprint_entity.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/provider/mine_api.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class MineRepository {
  MineAPI _api = MineAPI();

  ///新建地址
  Future<UserEntity> getUserInfo() => _api
      .getUserInfo()
      .then((BaseEntity response) => UserEntity.fromJson(response.data));

  ///新建地址
  Future<BaseEntity> addAddress(Map params) => _api.addAddress(params);

  ///编辑
  Future<BaseEntity> editAddress(Map params) => _api.editAddress(params);

  ///查询
  Future<List<AddressEntity>> getAddressList(Map params) =>
      _api.getAddressList(params).then((BaseEntity response) {
        List list = JsonKit.asList(response.data);
        return list.map((e) => AddressEntity.fromJson(e)).toList();
      });

  ///设为默认地址
  Future<List<AddressEntity>> setDefaultAddress(Map params) =>
      _api.setDefaultAddress(params).then((BaseEntity response) {
        List list = JsonKit.asList(response.data);
        return list.map((e) => AddressEntity.fromJson(e)).toList();
      });

  ///删除地址
  Future<List<AddressEntity>> delAddress(Map params) =>
      _api.delAddress(params).then((BaseEntity response) {
        List list = JsonKit.asList(response.data);
        return list.map((e) => AddressEntity.fromJson(e)).toList();
      });

  ///修改用户信息
  Future<UserEntity> modifyUserProfile(Map params, {dynamic formData}) =>
      _api.modifyUserProfile(params, formData).then((BaseEntity response) {
        return UserEntity.fromJson(response.data);
      });

  ///修改用户信息
  Future feedback({Map? params, dynamic formData}) =>
      _api.feedback(formData: params);

  ///我的足迹
  Future<List<FootPrintEntity>> footprint({Map? params}) =>
      _api.footprint(params: params).then((value) {
        return JsonKit.asList(value.data["data"])
            .map((e) => FootPrintEntity.fromJson(e))
            .toList();
      });

  ///我的足迹
  Future<BaseEntity> removeHistory({Map? params}) =>
      _api.removeHistory(params: params);
}
