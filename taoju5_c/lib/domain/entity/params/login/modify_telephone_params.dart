/*
 * @Description: 修改手机号参数
 * @Author: iamsmiling
 * @Date: 2021-06-07 16:27:31
 * @LastEditTime: 2021-06-07 16:52:08
 */
import 'package:taoju5_c/domain/entity/params/base_params_entity.dart';
import 'package:taoju5_c/domain/entity/params/login/sms_params.dart';

class ModifyTelephoneParamsEntity extends BaseParamsEntity {
  late String oldCapthca;
  late String newCapthca;
  late String newPhone;
  late String oldPhone;
  SmsType smsType = SmsType.modifyTelephone;

  ModifyTelephoneParamsEntity(
      {this.newCapthca = "",
      this.newPhone = "",
      this.oldPhone = "",
      this.oldCapthca = ""});
  @override
  Map get params => {
        "sms_code": oldCapthca,
        "new_phone": newCapthca,
        "new_sms_code": newPhone,
        "phone": oldPhone,
        "type": smsType.code,
      };

  @override
  bool validate() =>
      oldCapthca.isNotEmpty &&
      newCapthca.isNotEmpty &&
      newPhone.isNotEmpty &&
      isMobileNumber(newPhone);

  bool check() => oldPhone.isNotEmpty && oldCapthca.isNotEmpty;
}
