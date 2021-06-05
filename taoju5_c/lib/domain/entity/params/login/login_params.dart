/*
 * @Description: 登陆参数
 * @Author: iamsmiling
 * @Date: 2021-04-15 16:03:15
 * @LastEditTime: 2021-06-03 15:28:47
 */

import '../base_params_entity.dart';

enum CLoginMode { password, sms, wechat }

extension CLoginModeKit on CLoginMode {
  int get code {
    return {CLoginMode.password: 1, CLoginMode.sms: 2}[this] ?? 0;
  }
}

class LoginParamsEntity extends BaseParamsEntity {
  CLoginMode mode = CLoginMode.password;
  String telephone = "";
  String password = '';
  String code = "";

  LoginParamsEntity();

  int get type => mode.code;

  Map<String, dynamic?> get params => {
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
