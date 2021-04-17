/*
 * @Description: 登陆参数
 * @Author: iamsmiling
 * @Date: 2021-04-15 16:03:15
 * @LastEditTime: 2021-04-15 19:43:44
 */

import '../base_params_entity.dart';

enum CLoginMode { password, sms, wechat }

extension CLoginModeKit on CLoginMode {
  int get code {
    return {CLoginMode.password: 1, CLoginMode.sms: 2}[this];
  }
}

class CLoginParamsEntity extends CBaseParamsEntity {
  CLoginMode mode;
  String telephone;
  String password;
  String code;

  CLoginParamsEntity();

  int get type => mode.code;

  Map get params => {
        "phone": telephone,
        "type": type,
        "sms_code": code,
        "password": password
      };

  @override
  bool validate() {
    if (mode == CLoginMode.password) {
      return isNullOrEmpty(password);
    }
    if (mode == CLoginMode.sms) {
      return isNullOrEmpty(code);
    }
    return true;
  }
}
