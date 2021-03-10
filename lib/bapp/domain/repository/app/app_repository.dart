/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2021-01-11 17:27:01
 * @LastEditTime: 2021-01-12 10:02:28
 */

import 'package:taoju5/bapp/domain/model/app/app_info_model.dart';
import 'package:taoju5/bapp/domain/provider/app/app_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class AppRepository {
  AppAPI _api = AppAPI();

  Future<AppInfoModel> appInfo({Map params}) {
    return _api
        .appInfo("/api/Config/getAppUpgradeInfo", params: params)
        .then((BaseResponse response) {
      if (response.isValid) return AppInfoModel.fromJson(response.data);
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }
}
