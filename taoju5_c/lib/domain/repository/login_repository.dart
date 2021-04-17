/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-15 13:15:52
 * @LastEditTime: 2021-04-16 16:40:19
 */

import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/provider/login_api.dart';

class CLoginRepository {
  LoginAPI _api = LoginAPI();

  Future<BaseEntity> weChatLogin(Map params) {
    return _api.weChatLogin(params);
  }

  Future<BaseEntity> login(Map params) => _api.login(params);

  ///获取验证码
  Future<BaseEntity> getSmsCode(Map params) => _api.getSmsCode(params);
}
