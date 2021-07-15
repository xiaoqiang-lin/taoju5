/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-15 13:11:15
 * @LastEditTime: 2021-06-07 17:18:42
 */

import 'dart:convert';

import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/login/wechat_login_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class LoginAPI {
  HttpKit _http = HttpKit();

  ///微信登录
  Future<BaseEntity> weChatLogin(Map<String, dynamic> params) async {
    try {
      WeChatLoginEntity entity = await _getWeChatAccessToken(params);
      params.addAll({
        "access_token": entity.accessToken,
        "grant_type": "refresh_token",
        "refresh_token": entity.refreshToken,
        "openid": entity.openId
      });
      await _getWeChatRefreshToken(params);
      Map userInfo = await _getWeChatUserInfo(params);
      return _autoRegisterWithWeChat({"data": jsonEncode(userInfo)});
    } catch (err) {
      _http.setError(err);
      throw err;
    }
  }

  Future<WeChatLoginEntity> _getWeChatAccessToken(Map params) {
    return _http
        .get("https://api.weixin.qq.com/sns/oauth2/access_token",
            params: params)
        .then((BaseEntity entity) {
      return WeChatLoginEntity.fromJson(entity.data);
    });
  }

  Future<WeChatLoginEntity> _getWeChatRefreshToken(Map params) {
    return _http
        .get("https://api.weixin.qq.com/sns/oauth2/refresh_token",
            params: params)
        .then((BaseEntity entity) {
      return WeChatLoginEntity.fromJson(entity.data);
    });
  }

  Future _getWeChatUserInfo(Map params) {
    return _http
        .get("https://api.weixin.qq.com/sns/userinfo", params: params)
        .then((BaseEntity entity) {
      return entity.data;
    });
  }

  ///用微信在淘居屋服务器注册账号
  Future<BaseEntity> _autoRegisterWithWeChat(Map params) {
    return _http.post("/app/login/weChatLogin", formData: params);
  }

  ///登陆
  Future<BaseEntity> login(Map params) =>
      _http.post("/app/login/login", formData: params);

  ///获取验证码
  Future<BaseEntity> getSmsCode(Map params) =>
      _http.post("/app/login/sendConsumerPhoneCode", formData: params);

  ///设置登录密码
  Future<BaseEntity> setPassword(Map params) =>
      _http.post("/app/user/setPassword", formData: params);

  ///修改密码
  Future<BaseEntity> modifyPassword(Map params) =>
      _http.post("/app/user/changePassword", formData: params);

  ///修改手机号
  Future<BaseEntity> modifyTelephone(Map params) =>
      _http.post("/app/user/changePhone", formData: params);

  ///修改手机号
  Future<BaseEntity> bindTelephone(Map params) =>
      _http.post("/app/user/bindPhone", formData: params);
}