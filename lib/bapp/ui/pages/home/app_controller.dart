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
import 'package:taoju5/bapp/domain/model/app/app_info_model.dart';
import 'package:taoju5/bapp/domain/repository/app/app_repository.dart';
import 'package:taoju5/bapp/ui/dialog/app/app_upgrade_dialog.dart';
import 'package:dio/dio.dart';
import 'package:taoju5/storage/storage_manager.dart';

class AppController extends GetxController {
  AppRepository _repository = AppRepository();

  String apkName = '淘居屋商家.apk';
  AppInfoModel appInfoModel;

  Future<AppUpgradeInfo> appUpgradeInfo;

  double progress = 0;

  bool hasNewVersion = false;
  String lasestVersion = "1.0.0";

  DownloadStatus downloadStatus = DownloadStatus.none;

  downloadApk() async {
    String path = await FlutterUpgrade.apkDownloadPath;
    path += apkName;
    if (downloadStatus == DownloadStatus.start ||
        downloadStatus == DownloadStatus.downloading ||
        downloadStatus == DownloadStatus.done) {
      print('当前下载状态：$downloadStatus,不能重复下载。');
      return;
    }
    _updateDownloadStatus(DownloadStatus.start);
    try {
      var dio = Dio();
      await dio.download(appInfoModel.downloadUrl, path,
          onReceiveProgress: (int count, int total) {
        if (total == -1) {
          progress = 0.01;
        } else {
          progress = count / total.toDouble();
        }
        update();
        if (progress == 1) {
          Get.back();
          //下载完成，跳转到程序安装界面
          _updateDownloadStatus(DownloadStatus.done);

          FlutterUpgrade.installAppForAndroid(path);
        }
      });
    } catch (err) {}
  }

  _updateDownloadStatus(DownloadStatus downloadStatus) {
    downloadStatus = downloadStatus;
    update();
  }

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
    lasestVersion = remoteVersion;
    hasNewVersion = remoteVersion.compareTo(localVersion) == 1;
    update();
    return hasNewVersion;
  }

  Future requestPermission() async {
    // bool isGranted = await PermissionKit.isGranted(Permission.storage);
    // if (!isGranted) {
    //   return showAppPermissionRequestDialog("淘居屋暂时没有存储权限哦").then((value) async {
    //     if (value == true) {
    //       isGranted = await PermissionKit.requestPerssion(Permission.storage);
    //     }
    //     return isGranted;
    //   });
    // }
  }

  // Future<String> _getApkPath() async {
  //   final directory = await getExternalStorageDirectory();
  //   return directory.path;
  // }

  Future upgradeApp({WidgetBuilder builder}) async {
    bool hasNewVersion = await _hasNewAppVersion();

    if (hasNewVersion) {
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
        builder: (BuildContext context) {
          return AppUpgradeDialogBuilder(
            appInfo: appInfoModel,
          );
        },
        onCancel: () {
          // print('onCancel');
        },
        onOk: () {
          // print('onOk');
        },
        downloadProgress: (count, total) {
          progress = count / total;
          _updateDownloadStatus(DownloadStatus.downloading);
          // print('count:$count,total:$total');
        },
        downloadStatusChange: (DownloadStatus status, {dynamic error}) {},
      );
    }
  }

  @override
  void onInit() {
    // _hasNewAppVersion();
    super.onInit();
  }

  Future auth() {
    return StorageManager().sharedPreferences?.setBool("hasAuth", true);
  }
}
