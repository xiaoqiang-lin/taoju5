/*
 * @Description:修改密码第一步
 * @Author: iamsmiling
 * @Date: 2021-06-07 15:29:01
 * @LastEditTime: 2021-06-07 16:04:17
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/domain/entity/params/login/sms_params.dart';

import '../base_params_entity.dart';

enum ModifyPasswordStep { getCapthca, modifyPwd }

class ModifyPasswordParamsEntity extends BaseParamsEntity {
  late String password1;
  late String password2;
  late String captcha;
  late String telephone;
  SmsType smsType = SmsType.modifyPassword;

  ModifyPasswordParamsEntity(
      {this.telephone = "",
      this.password1 = "",
      this.password2 = "",
      this.captcha = ""});

  @override
  Map get params => {
        "password": password1,
        "r_password": password2,
        "sms_code": captcha,
        "phone": telephone,
        "type": smsType.code
      };

  @override
  bool validate() =>
      password1.isNotEmpty && password2.isNotEmpty && captcha.isNotEmpty;

  bool check() => captcha.isNotEmpty && telephone.isNotEmpty;
}
