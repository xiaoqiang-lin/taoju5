/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-15 13:15:52
 * @LastEditTime: 2021-06-08 11:19:43
 */

import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/provider/login_api.dart';

class LoginRepository {
  LoginAPI _api = LoginAPI();

  Future<BaseEntity> weChatLogin(Map<String, dynamic> params) {
    return _api.weChatLogin(params);
  }

  Future<BaseEntity> login(Map params) => _api.login(params);

  ///获取验证码
  Future<BaseEntity> getSmsCode(Map params) => _api.getSmsCode(params);

  /// 设置密码
  Future<BaseEntity> setPassword(Map params) => _api.setPassword(params);

  ///修改密码
  Future<BaseEntity> modifyPassword(Map params) => _api.modifyPassword(params);

  ///修改手机号
  Future<BaseEntity> modifyTelephone(Map params) =>
      _api.modifyTelephone(params);

  ///修改手机号
  Future<BaseEntity> bindTelephone(Map params) => _api.bindTelephone(params);
}
