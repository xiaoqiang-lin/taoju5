/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-14 12:11:34
 * @LastEditTime: 2021-04-16 16:47:33
 */
import 'dart:async';

import 'package:get/get.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:taoju5/capp/domain/entity/base_entity.dart';
import 'package:taoju5/capp/domain/entity/params/login/login_params.dart';
import 'package:taoju5/capp/domain/entity/params/login/sms_params.dart';
import 'package:taoju5/capp/domain/repository/login_repository.dart';
import 'package:taoju5/capp/routes/capp_routes.dart';
import 'package:taoju5/capp/utils/toast.dart';
import 'package:taoju5/config/app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CLoginStrategy {
  CLoginRepository repository = CLoginRepository();

  Function(CBaseEntity entity) onSuccess;
  Future login(Map params) {
    assert(params != null);
    ToastKit.loading(message: "正在登录");
    return repository.login(params).then(onSuccess);
  }

  void setSuccessHandler(Function(CBaseEntity entity) handler) {
    onSuccess = handler;
  }
}

///密码登陆
class CPasswordLoginStrategy extends CLoginStrategy {
  @override
  Function(CBaseEntity entity) onSuccess;
}

///密码登陆
class CSmsCodeLoginStrategy extends CLoginStrategy {
  @override
  Function(CBaseEntity entity) onSuccess;
}

///微信登陆
class CWeChatLoginStrategy extends CLoginStrategy {
  StreamSubscription _subscription;

  @override
  Future login(params) {
    assert(params != null);
    _subscription = fluwx.weChatResponseEventHandler
        .distinct((a, b) => a == b)
        .listen((res) {
      if (res is fluwx.WeChatAuthResponse) {
        if (res.isSuccessful) {
          // ToastKit.success("授权成功");
          ToastKit.loading(message: "正在登录");
          params.addAll({
            "appid": AppConfig.weChatAppId,
            "code": res.code,
            "secret": AppConfig.weChatSecret,
            "grant_type": "authorization_code"
          });
          repository.weChatLogin(params).then(onSuccess).whenComplete(() {
            ToastKit.dismiss();
            _subscription.cancel();
            _subscription = null;
          });
        }
      }
    });
    return fluwx.sendWeChatAuth(scope: "snsapi_userinfo", state: "taoju5");
  }

  @override
  Function(CBaseEntity entity) onSuccess;
}

class CCustomerLoginController extends GetxController {
  bool isPasswordVisible = true;

  CLoginParamsEntity _loginArg = CLoginParamsEntity();

  void _onLoginSuccess(CBaseEntity entity) async {
    SharedPreferences _sp = await SharedPreferences.getInstance();
    await _sp.setString("token", entity.data);
    Get.offAndToNamed(CAppRoutes.main);
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
    CLoginRepository _repository = CLoginRepository();
    CSmsParamsEntity _smsArg =
        CSmsParamsEntity(telephone: _loginArg.telephone, type: CSmsType.login);
    if (_smsArg.validate()) {
      return _repository.getSmsCode(_smsArg.params);
    }
    throw Future.error(false);
  }

  Future login(CLoginStrategy strategy, CLoginMode mode) {
    assert(strategy != null);
    _loginArg.mode = mode;
    strategy.setSuccessHandler(_onLoginSuccess);
    return strategy.login(_loginArg.params);
  }
}
