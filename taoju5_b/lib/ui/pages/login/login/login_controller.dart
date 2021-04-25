/*
 * @Description: 登录控制器
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:08:14
 * @LastEditTime: 2021-04-25 17:15:01
 */

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5_b/domain/model/user/user_info_model.dart';
import 'package:taoju5_b/domain/repository/login/login_repository.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_b/ui/dialog/auth.dart';
import 'package:taoju5_b/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5_b/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5_bc/storage/storage_manager.dart';
import 'package:taoju5_b/validator/params_validator.dart';
import 'package:taoju5_b/xdio/x_dio.dart';

class LoginController extends GetxController {
  static LoginRepository _repository = LoginRepository();
  LoginMode loginMode = LoginMode.password;
  double start = 0;
  LoginParamModel args = LoginParamModel();

  bool isPasswordCypher = true;

  Map get params => args.toJson();

  static Map<LoginMode, ILoginStrategy> _strategyDict = {
    LoginMode.password: PasswordLoginStrategy(_repository),
    LoginMode.sms: SmsLoginStrategy(_repository),
  };

  void switchPasswordMode() {
    isPasswordCypher = !isPasswordCypher;
  }

  void setPassword(String val) {
    args.password = val;
  }

  void setSms(String val) {
    args.code = val;
  }

  void setTel(String val) {
    args.mobile = val;
  }

  ///[_currentStrategy]当前登录策略
  ILoginStrategy get _currentStrategy => _strategyDict[loginMode];
  Future login() {
    ///参数校验
    if (!args.validate(flag: loginMode)) return Future.error(false);
    return _currentStrategy.login(params: params).then((UserInfoModel model) {
      ///刷新dio中的token
      XDio().refreshToken(model.token);
      save(model);
      Get.find<TaojuwuController>().loadData();

      ///页面跳转
      Get.offAndToNamed(BAppRoutes.home);
    });
  }

  save(UserInfoModel model) {
    ///存储token到sp中

    SharedPreferences.getInstance().then((sp) {
      sp.setString("userInfo", jsonEncode(model.toJson()));

      sp.setString("token", model.token).then((value) {});
    });

    // storageManager.sharedPreferences
    //     .setString("userInfo", jsonEncode(model.toJson()));

    // ///保存token
    // storageManager.sharedPreferences
    //     .setString("token", model.token)
    //     .then((value) {
    //   print(storageManager.sharedPreferences.getString("token"));
    //   print("token");
    // });

    ///保存到controller中
    final userProviderController = Get.find<UserProviderController>();
    userProviderController.user = model;
  }

  ///[description]:获取验证码
  ///[params]: [mobile]手机号码  [type]验证码类型  2 登录
  ///[return]:
  Future getSms() {
    if (args.validate()) {
      return _repository.getSms(params: params);
    }
    return Future.error(false);
  }

  void switchMode({@required LoginMode mode, @required double startx}) {
    loginMode = mode;
    start = startx;
    update();
  }

  @override
  onInit() {
    super.onInit();
    if (!(StorageManager().sharedPreferences?.getBool("hasAuth") ?? false)) {
      Future.microtask(() => showAuthDialog(Get.context));
    }
  }
}

///登录方式
enum LoginMode {
  password,
  sms,
}

class LoginParamModel extends ParamsValidator {
  String username;
  String password;
  String code;
  String mobile;

  LoginParamModel({username = "", password = "", sms = ""});

  Map toJson() => {
        // "mob"
        "username": username ?? mobile,
        "password": password,
        "mobile": mobile,
        "mobile_code": code,
        "type": 2
      };

  @override
  bool validate({var flag}) {
    if (flag == LoginMode.password) {
      bool isValidTel = isNullOrBlank(mobile, message: "请输入正确的手机号");
      bool isValidPassword = isPassword(password, message: "密码不能为空哦");
      return isValidTel && isValidPassword;
    }
    if (flag == LoginMode.sms) {
      bool isValidTel = isNullOrBlank(mobile, message: "请输入正确的手机号");
      bool isValidPassword = isPassword(code, message: "验证码不能为空哦");
      return isValidTel && isValidPassword;
    }
    return true;
  }
}

///使用策略模式
abstract class ILoginStrategy {
  LoginParamModel param;
  LoginRepository repository;
  ILoginStrategy(this.repository);
  Future<UserInfoModel> login({Map params});
}

class PasswordLoginStrategy implements ILoginStrategy {
  @override
  LoginParamModel param;

  @override
  Future<UserInfoModel> login({Map params}) {
    return repository.loginByPwd(params: params);
  }

  @override
  LoginRepository repository;

  PasswordLoginStrategy(this.repository);
}

class SmsLoginStrategy implements ILoginStrategy {
  @override
  LoginParamModel param;

  @override
  Future<UserInfoModel> login({Map params}) {
    return repository.loginBySms(params: params);
  }

  @override
  LoginRepository repository;
  SmsLoginStrategy(this.repository);
}
