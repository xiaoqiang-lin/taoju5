/*
 * @Description: 修改手机号
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:06:30
 * @LastEditTime: 2021-06-07 16:21:45
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/login/modify_password_params.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/repository/login_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/utils/toast.dart';

class ModifyPasswordController extends GetxController {
  LoginRepository _repository = LoginRepository();
  UserEntity user = Get.arguments;

  late ModifyPasswordParamsEntity _args;

  @override
  void onInit() {
    _args = ModifyPasswordParamsEntity(telephone: user.telephone);
    super.onInit();
  }

  Future getCaptcha() {
    return _repository.getSmsCode(_args.params).then((value) {});
  }

  void setTelephone(String tel) {
    _args.telephone = tel;
  }

  void setCaptcha(String code) {
    _args.captcha = code;
  }

  void setPassword1(String s) {
    _args.password1 = s;
  }

  void setPassword2(String s) {
    _args.password2 = s;
  }

  Future? next() {
    if (!_args.check()) {
      ToastKit.warning("手机号或验证码不能为空哦");
      throw ArgumentError("手机或验证码为空");
    }

    return Get.toNamed(AppRoutes.modifyPassword2,
        arguments: _args, preventDuplicates: false);
  }

  Future submit() {
    return _repository.modifyPassword(_args.params).then((value) {
      // Get.back(result: true);
      Get.until((route) => Get.currentRoute.contains(AppRoutes.account));
    });
  }
}
