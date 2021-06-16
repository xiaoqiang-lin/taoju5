/*
 * @Description: 绑定手机号
 * @Author: iamsmiling
 * @Date: 2021-06-07 17:10:22
 * @LastEditTime: 2021-06-07 17:22:16
 */

import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/params/login/sms_params.dart';

class BindTelephoneParamsEntity extends BaseParamsEntity {
  late String telephone;

  late String captcha;

  SmsType smsType = SmsType.modifyTelephone;
  BindTelephoneParamsEntity({this.telephone = "", this.captcha = ""});
  @override
  Map get params => {"phone": telephone, "sms_code": captcha};

  @override
  bool validate() => telephone.isNotEmpty && captcha.isNotEmpty;
}
