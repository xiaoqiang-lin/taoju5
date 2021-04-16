import 'package:get/get.dart';
import 'package:taoju5/capp/domain/entity/params/login/sms_params.dart';

class CModifyTelephoneController extends GetxController {
  CSmsParamsEntity _smsArg = CSmsParamsEntity(telephone: '');

  void setTelephone(String val) {
    _smsArg.telephone = val;
  }

  void setSmsCode(String val) {}
}
