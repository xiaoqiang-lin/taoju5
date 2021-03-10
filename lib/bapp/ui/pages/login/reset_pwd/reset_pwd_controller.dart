import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/repository/login/login_repository.dart';

class ResetPasswordParamsModel {
  String oldPassword;
  String newPassword;

  ResetPasswordParamsModel({this.newPassword, this.oldPassword});

  Map get params => {"old_password": oldPassword, "new_password": newPassword};
}

class ResetPwdController extends GetxController {
  LoginRepository _repository = LoginRepository();

  ResetPasswordParamsModel args = ResetPasswordParamsModel();

  ///新密码是否以秘文展示
  bool isNewPasswordCypher = true;

  ///旧密码是否以秘文展示
  bool isOldPasswordCypher = true;

  void switchNewPasswordMode() {
    isNewPasswordCypher = !isNewPasswordCypher;
    update(["newPassword"]);
  }

  void switchOldPasswordMode() {
    isNewPasswordCypher = !isNewPasswordCypher;
    update(["oldPassword"]);
  }

  setOldPassword(String val) {
    args.oldPassword = val;
  }

  setNewPassword(String val) {
    args.newPassword = val;
  }

  Future submit() {
    return _repository.resetPassword(params: args.params);
  }
}
