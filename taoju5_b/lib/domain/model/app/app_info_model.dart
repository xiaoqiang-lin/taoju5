/*
 * @Description: app相关信息
 * @Author: iamsmiling
 * @Date: 2021-01-11 17:23:22
 * @LastEditTime: 2021-04-17 17:29:03
 */

import 'package:taoju5_bc/utils/json_kit.dart';

class AppInfoModel {
  int id;
  String system;
  String version;
  String title;
  String downloadUrl;
  String log;
  String createAt;
  bool isForceUpdate;
  AppInfoModel.fromJson(Map json) {
    id = json['id'];
    system = json['app_type'];
    version = json['version_number'];
    title = json['title'];
    downloadUrl = json['download_address'];
    log = json['update_log'];
    isForceUpdate = JsonKit.asBool(json["is_force_update"]);
    createAt = JsonKit.formatDateTimeFromMillseconds(json["create_time"]);
  }
}
