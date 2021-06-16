/*
 * @Description: 设置密码
 * @Author: iamsmiling
 * @Date: 2021-06-07 14:51:49
 * @LastEditTime: 2021-06-07 15:16:20
 */

import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/login/set_password_params.dart';
import 'package:taoju5_c/domain/repository/login_repository.dart';
import 'package:taoju5_c/utils/toast.dart';

class SetPasswordController extends GetxController {
  SetPassowrdParamsEntity _args = SetPassowrdParamsEntity();

  void setPassword1(String s) {
    _args.password1 = s;
  }

  void setPassword2(String s) {
    _args.password2 = s;
  }

  Future submit() {
    LoginRepository repository = LoginRepository();
    if (!_args.validate()) {
      ToastKit.warning("密码不能为空哦");
      throw ArgumentError("密码为空");
    }
    return repository.setPassword(_args.params).then((value) {
      Get.back<bool?>(result: true);
    });
  }
}
