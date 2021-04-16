/*
 * @Description: 我的
 * @Author: iamsmiling
 * @Date: 2021-04-16 16:38:20
 * @LastEditTime: 2021-04-16 19:02:34
 */

import 'package:taoju5/capp/domain/entity/address/address_entity.dart';
import 'package:taoju5/capp/domain/entity/base_entity.dart';
import 'package:taoju5/capp/domain/entity/user/user_entity.dart';
import 'package:taoju5/capp/domain/provider/mine_api.dart';
import 'package:taoju5/utils/json_kit.dart';

class CMineRepository {
  CMineAPI _api = CMineAPI();

  ///新建地址
  Future<CUserEntity> getUserInfo() => _api
      .getUserInfo()
      .then((CBaseEntity response) => CUserEntity.fromJson(response.data));

  ///新建地址
  Future<CBaseEntity> addAddress(Map params) => _api.addAddress(params);

  ///编辑
  Future<CBaseEntity> editAddress(Map params) => _api.editAddress(params);

  ///查询
  Future<List<CAddressEntity>> getAddressList(Map params) =>
      _api.getAddressList(params).then((CBaseEntity response) {
        List list = JsonKit.asList(response.data);
        return list.map((e) => CAddressEntity.fromJson(e)).toList();
      });

  ///设为默认地址
  Future<List<CAddressEntity>> setDefaultAddress(Map params) =>
      _api.setDefaultAddress(params).then((CBaseEntity response) {
        List list = JsonKit.asList(response.data);
        return list.map((e) => CAddressEntity.fromJson(e)).toList();
      });

  ///删除地址
  Future<List<CAddressEntity>> delAddress(Map params) =>
      _api.delAddress(params).then((CBaseEntity response) {
        List list = JsonKit.asList(response.data);
        return list.map((e) => CAddressEntity.fromJson(e)).toList();
      });
}
