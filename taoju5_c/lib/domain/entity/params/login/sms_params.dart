/*
 * @Description: 获取验证码参数
 * @Author: iamsmiling
 * @Date: 2021-04-15 17:12:00
 * @LastEditTime: 2021-04-18 00:15:23
 */
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';

enum CSmsType { login, forgetPassword, modifyPassword, modifyTelephone }

extension CSmsTypeKit on CSmsType {
  int get code {
    Map<CSmsType, int> map = {
      CSmsType.login: 2,
      CSmsType.forgetPassword: 3,
      CSmsType.modifyPassword: 4,
      CSmsType.modifyTelephone: 5
    };
    return map[this]!;
  }
}

class CSmsParamsEntity extends BaseParamsEntity {
  late String telephone;
  CSmsType? type;

  CSmsParamsEntity({required this.telephone, this.type});

  @override
  Map get params => {"phone": telephone, "type": type?.code};

  @override
  bool validate() => isMobileNumber(telephone);
}
