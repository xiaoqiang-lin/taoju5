/*
 * @Description: 我的
 * @Author: iamsmiling
 * @Date: 2021-04-16 16:38:20
 * @LastEditTime: 2021-04-17 17:44:34
 */

import 'package:taoju5_c/domain/entity/address/address_entity.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/provider/mine_api.dart';
import 'package:taoju5_bc/utils/json_kit.dart';

class CMineRepository {
  CMineAPI _api = CMineAPI();

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
}
