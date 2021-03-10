/*
 * @Description: app控制器
 * @Author: iamsmiling
 * @Date: 2021-01-11 17:32:04
 * @LastEditTime: 2021-02-01 11:10:25
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_upgrade/flutter_app_upgrade.dart';
import 'package:get/get.dart';
// import 'package:install_plugin/install_plugin.dart';
// import 'package:install_plugin/install_plugin.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taoju5/bapp/domain/model/app/app_info_model.dart';
import 'package:taoju5/bapp/domain/repository/app/app_repository.dart';

class AppController extends GetxController {
  AppRepository _repository = AppRepository();

  String apkName = '淘居屋商家.apk';
  AppInfoModel appInfoModel;

  Future<AppUpgradeInfo> appUpgradeInfo;

  ///获取最新的app信息
  Future<String> _getLatestAppInfo() {
    Map params = {};

    if (Platform.isIOS) {
      params = {"app_type": "Ios"};
    }
    if (Platform.isAndroid) {
      params = {"app_type": "Android"};
    }

    return _repository.appInfo(params: params).then((AppInfoModel value) {
      appInfoModel = value;
      return value.version;
    });
  }

  Future<bool> _hasNewAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String localVersion = packageInfo.version;

    String remoteVersion = await _getLatestAppInfo();

    return remoteVersion.compareTo(localVersion) == 1;
  }

  Future<String> _getApkPath() async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<Null> _installApk() async {
    try {
      _getApkPath();
      // String path = await _getApkPath();

      // InstallPlugin.installApk(path + apkName, 'com.buyi.taoju5')
      //     .then((_) {})
      //     .catchError((err) => err);
    } on Error catch (_) {}
  }

  Future _upgradeApp() async {
    bool hasNewVersion = await _hasNewAppVersion();
    if (!hasNewVersion) {
      AppUpgrade.appUpgrade(
        Get.context,
        Future.value(AppUpgradeInfo(
            force: true,
            apkDownloadUrl: appInfoModel?.downloadUrl,
            title: appInfoModel?.title,
            contents: [appInfoModel?.log])),
        okText: '马上升级',
        cancelTextStyle: TextStyle(color: const Color(0xFF2196f3)),
        okTextStyle: TextStyle(color: const Color(0xFF2196f3)),
        okBackgroundColors: [Colors.white, Colors.white],
        progressBarColor: Colors.blue,
        iosAppId: 'id88888888',

        // appMarketInfo: AppMarket.tencent,
        borderRadius: 16.0,
        onCancel: () {
          // print('onCancel');
        },
        onOk: () {
          // print('onOk');
        },
        downloadProgress: (count, total) {
          // print('count:$count,total:$total');
        },
        downloadStatusChange: (DownloadStatus status, {dynamic error}) {
          if (status == DownloadStatus.done) {
            _installApk();
          }
        },
      );
    }
  }

  @override
  void onInit() {
    _upgradeApp();
    super.onInit();
  }
}
