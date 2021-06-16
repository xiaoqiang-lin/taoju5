/*
 * @Description: 绑定手机号
 * @Author: iamsmiling
 * @Date: 2021-06-07 17:05:43
 * @LastEditTime: 2021-06-07 17:21:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/login/bind_telephone_params.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/repository/login_repository.dart';
import 'package:taoju5_c/utils/toast.dart';

class BindTelephoneController extends GetxController {
  UserEntity user = Get.arguments;
  LoginRepository _repository = LoginRepository();

  BindTelephoneParamsEntity _args = BindTelephoneParamsEntity();

  @override
  void onInit() {
    _args.telephone = user.telephone;
    super.onInit();
  }

  void setTelephone(String tel) {
    _args.telephone = tel;
  }

  void setCaptcha(String code) {
    _args.captcha = code;
  }

  Future getCaptcha() {
    return _repository.getSmsCode(_args.params).then((value) {});
  }

  Future submit() {
    if (!_args.validate()) {
      ToastKit.warning("手机或验证码不能为空哦");
      throw ArgumentError("手机或验证码为空");
    }
    return _repository.bindTelephone(_args.params).then((value) {
      Get.back();
    });
  }
}
