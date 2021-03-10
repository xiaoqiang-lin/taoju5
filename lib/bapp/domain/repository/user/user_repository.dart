/*
 * @Description: 获取用户相关信息
 * @Author: iamsmiling
 * @Date: 2021-01-21 14:31:50
 * @LastEditTime: 2021-01-21 15:18:25
 */
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/bapp/domain/model/user/user_info_model.dart';
import 'package:taoju5/bapp/domain/provider/user/user_provider.dart';
import 'package:taoju5/xdio/x_dio.dart';

class UserRepository {
  UserProvider _api = UserProvider();

  Future<UserInfoModel> userInfo({Map params}) =>
      _api.userInfo("/api/order/getShop").then((BaseResponse response) {
        if (response.isValid) return UserInfoModel.fromJson(response.data);
        throw EasyLoading.showError(response.message);
      }).catchError((err) {
        throw err;
      });
}
