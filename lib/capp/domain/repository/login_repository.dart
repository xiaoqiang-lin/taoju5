/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-15 13:15:52
 * @LastEditTime: 2021-04-16 16:40:19
 */

import 'package:taoju5/capp/domain/entity/base_entity.dart';
import 'package:taoju5/capp/domain/provider/login_api.dart';

class CLoginRepository {
  CLoginAPI _api = CLoginAPI();

  Future<CBaseEntity> weChatLogin(Map params) {
    return _api.weChatLogin(params);
  }

  Future<CBaseEntity> login(Map params) => _api.login(params);

  ///获取验证码
  Future<CBaseEntity> getSmsCode(Map params) => _api.getSmsCode(params);
}
