/*
 * @Description: AppManager
 * @Author: iamsmiling
 * @Date: 2020-12-28 22:02:49
 * @LastEditTime: 2021-06-08 10:52:26
 */

import 'dart:convert';
import 'dart:io';

import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:device_info/device_info.dart';
import 'package:taoju5_bc/config/app_config.dart';
import 'package:taoju5_bc/storage/storage_manager.dart';

import 'package:dio/dio.dart';
import 'package:flutter_app_upgrade/flutter_app_upgrade.dart';

class AppInfoModel {
  int id;
  String system;
  String version;
  String title;
  String downloadUrl;
  String log;
  // String createAt;
  bool isForceUpdate;
  AppInfoModel.fromJson(Map json) {
    id = json['id'];
    system = json['app_type'];
    version = json['version_number'];
    title = json['title'];
    downloadUrl = json['download_address'];
    log = json['update_log'];
    isForceUpdate = json["is_force_update"] == 1;
    // createAt = json["create_time"];
  }
}

abstract class AppManager {
  static String apkName = '淘居屋.apk';
  static AppInfoModel appInfoModel;

  static Future<AppUpgradeInfo> appUpgradeInfo;

  static bool hasNewVersion = false;
  static String lasestVersion = "1.0.0";

  ///递归方式删除目录
  static Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  }

  static _renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = []..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  ///获取文件大小 字节为单位
  static Future<double> _getTotalSizeOfFilesInDir(
      final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  ///加载缓存
  static Future<String> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    return Future.value(_renderSize(value));
    /*tempDir.list(followLinks: false,recursive: true).listen((file){
          //打印每个缓存文件的路径
        print(file.path);
      });*/
  }

  static Future clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await delDir(tempDir);
    await loadCache();
  }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    return version;
  }

  static Future<String> getAppInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    List<String> list = [];

    if (Platform.isAndroid) {
      AndroidDeviceInfo appInfo = await deviceInfo.androidInfo;

      list.add('Android');
      list.add(version);
      list.add('${appInfo.model}');
      list.add(appInfo.version.release);
    }
    if (Platform.isIOS) {
      IosDeviceInfo appInfo = await deviceInfo.iosInfo;
      list.add('IOS');
      list.add(version);
      list.add('${appInfo.utsname.machine}');
      list.add(appInfo.systemVersion);
    }
    String desc = list.join(',');
    StorageManager().sharedPreferences.setString('device_info', desc);
    return desc;
  }

  ///获取最新的app信息
  static Future<String> getLatestAppInfo() {
    // ignore: unused_local_variable
    Map<String, dynamic> params = {};

    if (Platform.isIOS) {
      params = {"app_type": "Ios"};
    }
    if (Platform.isAndroid) {
      params = {"app_type": "Android"};
    }

    return Dio()
        .get(AppConfig.baseUrl + "/api/Config/getAppUpgradeInfo",
            queryParameters: params)
        .then((value) {
      print(value);
      print(value.data);
      value.data = jsonDecode(value.data);
      appInfoModel =
          AppInfoModel.fromJson(value.data is Map ? value.data["data"] : {});
      return appInfoModel.version;
    });
  }

  static Future<bool> hasNewAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String localVersion = packageInfo.version;

    String remoteVersion = await getLatestAppInfo();
    lasestVersion = remoteVersion;
    hasNewVersion = remoteVersion.compareTo(localVersion) == 1;

    return hasNewVersion;
  }
}
