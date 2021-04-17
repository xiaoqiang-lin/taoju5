/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2021-01-11 17:27:01
 * @LastEditTime: 2021-04-17 17:40:17
 */

import 'package:taoju5_b/domain/model/app/app_info_model.dart';
import 'package:taoju5_b/domain/provider/app/app_api.dart';
import 'package:taoju5_b/xdio/x_dio.dart';

class AppRepository {
  AppAPI _api = AppAPI();

  Future<AppInfoModel> appInfo({Map params}) {
    return _api.appInfo(params: params).then((BaseResponse response) {
      if (response.isValid) return AppInfoModel.fromJson(response.data);
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }
}
