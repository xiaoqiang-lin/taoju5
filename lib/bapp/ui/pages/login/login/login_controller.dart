/*
 * @Description: 登录控制器
 * @Author: iamsmiling
 * @Date: 2020-12-28 16:08:14
 * @LastEditTime: 2021-01-28 13:28:04
 */

import 'dart:convert';

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/user/user_info_model.dart';
import 'package:taoju5/bapp/domain/repository/login/login_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/user_provider_controller.dart';
import 'package:taoju5/storage/storage_manager.dart';
import 'package:taoju5/utils/x_logger.dart';
import 'package:taoju5/validator/params_validator.dart';
import 'package:taoju5/xdio/x_dio.dart';

class LoginController extends GetxController {
  static LoginRepository _repository = LoginRepository();
  LoginMode loginMode = LoginMode.password;
  LoginParamModel paramModel = LoginParamModel();

  Map get params => paramModel.toJson();

  static Map<LoginMode, ILoginStrategy> _strategyDict = {
    LoginMode.password: PasswordLoginStrategy(_repository),
    LoginMode.sms: SmsLoginStrategy(_repository),
  };

  ///[_currentStrategy]当前登录策略
  ILoginStrategy get _currentStrategy => _strategyDict[loginMode];
  Future login() {
    XLogger.v(params);

    ///参数校验
    if (!paramModel.validate(flag: loginMode)) return Future.error(false);
    return _currentStrategy.login(params: params).then((UserInfoModel model) {
      ///刷新dio中的token
      XDio().refreshToken(model.token);
      save(model);

      ///页面跳转
      Get.offNamed(BAppRoutes.home);
    });
  }

  save(UserInfoModel model) {
    ///存储token到sp中
    final storageManager = StorageManager();

    storageManager.sharedPreferences
        .setString("userInfo", jsonEncode(model.toJson()));

    ///保存token
    storageManager.sharedPreferences?.setString("token", model.token);

    ///保存到controller中
    final userProviderController = Get.find<UserProviderController>();
    userProviderController.user = model;
  }

  ///[description]:获取验证码
  ///[params]: [mobile]手机号码  [type]验证码类型  2 登录
  ///[return]:
  Future getSms() {
    return _repository.getSms(params: params);
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
      bool isValidPassword = isPassword(password, message: "密码不能为空哦");
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
