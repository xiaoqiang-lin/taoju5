/*
 * @Description: app相关信息
 * @Author: iamsmiling
 * @Date: 2021-01-11 17:23:22
 * @LastEditTime: 2021-01-11 17:31:08
 */

class AppInfoModel {
  int id;
  String system;
  String version;
  String title;
  String downloadUrl;
  String log;
  int updateTime;
  AppInfoModel.fromJson(Map json) {
    id = json['id'];
    system = json['app_type'];
    version = json['version_number'];
    title = json['title'];
    downloadUrl = json['download_address'];
    log = json['update_log'];
    updateTime = json['updateTime'];
  }
}
