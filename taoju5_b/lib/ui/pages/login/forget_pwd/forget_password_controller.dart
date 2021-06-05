/*
 * @Description:
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:06:30
 * @LastEditTime: 2021-06-04 14:26:46
 */
import 'package:get/get.dart';
import 'package:taoju5_b/domain/repository/login/login_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5_b/routes/bapp_routes.dart';

class ForgetPasswordController extends GetxController {
  LoginRepository _repository = LoginRepository();

  String tel;
  String code;

  void setTel(String val) {
    tel = val;
  }

  void setCode(String val) {
    code = val;
  }

  Future getSms() {
    if (!GetUtils.isPhoneNumber(tel)) {
      EasyLoading.showInfo("请输入正确的手机号哦");
      return Future.error(false);
    }
    return _repository.getSms(params: {'mobile': tel, 'type': 3});
  }

  Future checkSms() {
    return _repository.checkSms(
        params: {'mobile': tel, 'type': 3, 'mobile_code': code}).then((_) {
      Get.toNamed(BAppRoutes.modifyPassword + "?tel=$tel&code=$code");
    });
  }
}
