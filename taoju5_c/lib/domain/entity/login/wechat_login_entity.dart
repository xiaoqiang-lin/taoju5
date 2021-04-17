/*
 * @Description: 微信登陆
 * @Author: iamsmiling
 * @Date: 2021-04-15 14:01:20
 * @LastEditTime: 2021-04-15 14:36:24
 */

class WeChatLoginEntity {
  String accessToken;
  int expiresIn;
  String refreshToken;
  String openId;
  String scope;
  String unionId;

  WeChatLoginEntity.fromJson(Map json) {
    accessToken = json["access_token"];
    expiresIn = json["expires_in"];
    refreshToken = json["refresh_token"];
    openId = json["openid"];
    scope = json["scope"];
    unionId = json["unionid"];
  }
}
