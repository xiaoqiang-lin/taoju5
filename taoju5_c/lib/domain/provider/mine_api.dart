/*
 * @Description: 我的
 * @Author: iamsmiling
 * @Date: 2021-04-16 16:37:07
 * @LastEditTime: 2021-04-16 18:02:03
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/netkit/http_kit.dart';

class CMineAPI {
  HttpKit _http = HttpKit();

  ///创建地址
  Future<BaseEntity> getUserInfo() => _http.get("/app/user/user");

  ///创建地址
  Future<BaseEntity> addAddress(Map params) =>
      _http.post("/app/user/addAddress", formData: params);

  ///编辑地址
  Future<BaseEntity> editAddress(Map params) =>
      _http.post("/app/user/editAddress", formData: params);

  //设为默认地址
  Future<BaseEntity> setDefaultAddress(Map params) =>
      _http.post("/app/user/setDefaultAddress", formData: params);

  ///查询地址
  Future<BaseEntity> getAddressList(Map params) =>
      _http.get("/app/user/addressList", params: params);

  ///删除地址
  Future<BaseEntity> delAddress(Map params) =>
      _http.post("/app/user/delAddress", params: params);
}
