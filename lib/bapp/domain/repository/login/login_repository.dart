/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-28 17:14:21
 * @LastEditTime: 2020-12-29 10:35:21
 */
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/bapp/domain/model/user/user_info_model.dart';
import 'package:taoju5/bapp/domain/provider/login/login_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class LoginRepository {
  LoginAPI _api = LoginAPI();

  ///[description]: 密码登录
  ///[params]: [username] 用户名 [password]密码
  ///[return]:

  Future<UserInfoModel> loginByPwd({Map params}) {
    return _api
        .loginByPwd("/api/login/login", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return UserInfoModel.fromJson(response.data);
      throw EasyLoading.showError(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  ///[description]:获取验证码
  ///[params]: [mobile]手机号码  [type]验证码类型  2 登录
  ///[return]:
  Future getSms({Map params}) {
    return _api
        .getSms("/api/login/sendBusinessesPhoneCode", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return response.data;
      throw EasyLoading.showError(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<UserInfoModel> loginBySms({Map params}) {
    return _api
        .loginByPwd("/api/login/mobileLogin", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return UserInfoModel.fromJson(response.data);
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future resetPassword({Map params}) {
    return _api.resetPassword("/api/member/modifyPassword", params: params);
  }
}
