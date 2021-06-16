/*
 * @Description: 获取验证码参数
 * @Author: iamsmiling
 * @Date: 2021-04-15 17:12:00
 * @LastEditTime: 2021-06-07 15:46:00
 */
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

enum SmsType { login, forgetPassword, modifyPassword, modifyTelephone }

extension CSmsTypeKit on SmsType {
  int get code {
    Map<SmsType, int> map = {
      SmsType.login: 2,
      SmsType.forgetPassword: 3,
      SmsType.modifyPassword: 4,
      SmsType.modifyTelephone: 5
    };
    return map[this]!;
  }
}

class CSmsParamsEntity extends BaseParamsEntity {
  late String telephone;
  SmsType? type;

  CSmsParamsEntity({required this.telephone, this.type});

  @override
  Map get params => {"phone": telephone, "type": type?.code};

  @override
  bool validate() => isMobileNumber(telephone);
}
