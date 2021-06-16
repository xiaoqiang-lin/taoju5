/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-05-06 10:06:30
 * @LastEditTime: 2021-06-07 17:01:56
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/login/modify_telephone_params.dart';
import 'package:taoju5_c/domain/entity/user/user_entity.dart';
import 'package:taoju5_c/domain/repository/login_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/utils/toast.dart';

class ModifyTelephoneController extends GetxController {
  UserEntity user = Get.arguments;
  LoginRepository _repository = LoginRepository();
  late ModifyTelephoneParamsEntity _args;

  @override
  void onInit() {
    _args = ModifyTelephoneParamsEntity(oldPhone: user.telephone);
    super.onInit();
  }

  void setOldTelephone(String val) {
    _args.oldPhone = val;
  }

  void setOldCaptcha(String val) {
    _args.oldCapthca = val;
  }

  void setNewCaptcha(String val) {
    _args.newCapthca = val;
  }

  void setNewPhone(String val) {
    _args.newPhone = val;
    _args.oldPhone = val;
  }

  Future getCaptcha() {
    if (!_args.isMobileNumber(_args.oldPhone)) {
      ToastKit.warning("手机号不正确哦");
      throw ArgumentError("手机号不正确");
    }
    return _repository.getSmsCode(_args.params);
  }

  Future submit() {
    if (!_args.validate()) {
      ToastKit.warning("手机号或验证码不正确哦");
      throw ArgumentError("手机号或验证码不正确");
    }
    return _repository.modifyTelephone(_args.params).then((value) {
      Get.until((route) => Get.currentRoute.contains(AppRoutes.account));
    });
  }
}
