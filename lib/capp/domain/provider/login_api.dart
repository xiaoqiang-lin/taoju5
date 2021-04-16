/*
 * @Description: 登录相关
 * @Author: iamsmiling
 * @Date: 2021-04-15 13:11:15
 * @LastEditTime: 2021-04-15 16:58:29
 */

import 'dart:convert';

import 'package:taoju5/capp/domain/entity/base_entity.dart';
import 'package:taoju5/capp/domain/entity/login/wechat_login_entity.dart';
import 'package:taoju5/capp/netkit/http_kit.dart';

class CLoginAPI {
  HttpKit _http = HttpKit();

  ///微信登录
  Future<CBaseEntity> weChatLogin(Map params) async {
    try {
      CWeChatLoginEntity entity = await _getWeChatAccessToken(params);
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

  Future<CWeChatLoginEntity> _getWeChatAccessToken(Map params) {
    return _http
        .get("https://api.weixin.qq.com/sns/oauth2/access_token",
            params: params)
        .then((CBaseEntity entity) {
      return CWeChatLoginEntity.fromJson(entity.data);
    });
  }

  Future<CWeChatLoginEntity> _getWeChatRefreshToken(Map params) {
    return _http
        .get("https://api.weixin.qq.com/sns/oauth2/refresh_token",
            params: params)
        .then((CBaseEntity entity) {
      return CWeChatLoginEntity.fromJson(entity.data);
    });
  }

  Future _getWeChatUserInfo(Map params) {
    return _http
        .get("https://api.weixin.qq.com/sns/userinfo", params: params)
        .then((CBaseEntity entity) {
      return entity.data;
    });
  }

  ///用微信在淘居屋服务器注册账号
  Future<CBaseEntity> _autoRegisterWithWeChat(Map params) {
    return _http.post("/app/login/weChatLogin", formData: params);
  }

  ///登陆
  Future<CBaseEntity> login(Map params) =>
      _http.post("/app/login/login", formData: params);

  ///获取验证码
  Future<CBaseEntity> getSmsCode(Map params) =>
      _http.post("/app/login/sendConsumerPhoneCode", formData: params);
}
