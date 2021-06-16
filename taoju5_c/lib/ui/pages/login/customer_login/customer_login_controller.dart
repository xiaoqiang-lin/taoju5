/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-14 12:11:34
 * @LastEditTime: 2021-06-07 15:12:18
 */
import 'dart:async';

import 'package:get/get.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/params/login/login_params.dart';
import 'package:taoju5_c/domain/entity/params/login/sms_params.dart';
import 'package:taoju5_c/domain/repository/login_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/utils/toast.dart';

abstract class LoginStrategy {
  LoginRepository repository = LoginRepository();

  late Function(BaseEntity entity) onSuccess;
  Future login(Map<String, dynamic> params) {
    ToastKit.loading(message: "正在登录");
    return repository
        .login(params)
        .then(onSuccess)
        .whenComplete(ToastKit.dismiss);
  }

  void setSuccessHandler(Function(BaseEntity entity) handler) {
    onSuccess = handler;
  }
}

///密码登陆
class PasswordLoginStrategy extends LoginStrategy {
  @override
  late Function(BaseEntity entity) onSuccess;
}

///密码登陆
class SmsCodeLoginStrategy extends LoginStrategy {
  @override
  late Function(BaseEntity entity) onSuccess;
}

///微信登陆
class WeChatLoginStrategy extends LoginStrategy {
  late StreamSubscription? _subscription;

  @override
  Future login(Map<String, dynamic> params) {
    _subscription = fluwx.weChatResponseEventHandler
        .distinct((a, b) => a == b)
        .listen((res) {
      if (res is fluwx.WeChatAuthResponse) {
        if (res.isSuccessful) {
          // ToastKit.success("授权成功");
          ToastKit.loading(message: "正在登录");

          params.addAll(Map<String, dynamic>.from({
            "appid": AppConfig.weChatAppId,
            "code": res.code,
            "secret": AppConfig.weChatSecret,
            "grant_type": "authorization_code"
          }));
          repository.weChatLogin(params).then(onSuccess).whenComplete(() {
            _subscription?.cancel();
            _subscription = null;
          }).whenComplete(ToastKit.dismiss);
        }
      }
    });
    return fluwx.sendWeChatAuth(scope: "snsapi_userinfo", state: "taoju5");
  }

  @override
  late Function(BaseEntity entity) onSuccess;
}

class CustomerLoginController extends GetxController {
  bool isPasswordVisible = true;

  LoginParamsEntity _loginArg = LoginParamsEntity();

  void _onLoginSuccess(BaseEntity entity) async {
    Get.offAllNamed(AppRoutes.main);
  }

  void setPassword(String val) {
    _loginArg.password = val;
  }

  void setTelephone(String val) {
    _loginArg.telephone = val;
  }

  void setSmsCode(String val) {
    _loginArg.code = val;
  }

  Future getSmsCode() {
    LoginRepository _repository = LoginRepository();
    CSmsParamsEntity _smsArg =
        CSmsParamsEntity(telephone: _loginArg.telephone, type: SmsType.login);
    if (_smsArg.validate()) {
      return _repository.getSmsCode(_smsArg.params);
    }
    throw Future.error(false);
  }

  Future login(LoginStrategy strategy, CLoginMode mode) {
    _loginArg.mode = mode;
    strategy.setSuccessHandler(_onLoginSuccess);
    return strategy.login(_loginArg.params);
  }
}
