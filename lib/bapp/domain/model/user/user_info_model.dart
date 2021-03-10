/*
 * @Description: 登录用户模型
 * @Author: iamsmiling
 * @Date: 2020-12-28 17:26:07
 * @LastEditTime: 2020-12-28 17:42:22
 */

class UserInfoModel {
  int shopId;
  String shopName;
  String nickName;
  String userTel;
  String address;
  String token;

  UserInfoModel.fromJson(Map json) {
    token = json['token'];
    shopName = json['shop_name'];
    shopId = json['shop_id'];
    nickName = json['nick_name'];
    userTel = json['user_tel'];
    address = json['address'];
  }

  Map toJson() => {
        "token": token,
        "shop_name": shopName,
        "shop_id": shopId,
        "nick_name": nickName,
        "user_tel": userTel,
        "address": address
      };
}
