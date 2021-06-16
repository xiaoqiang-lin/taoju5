/*
 * @Description: app下载
 * @Author: iamsmiling
 * @Date: 2021-06-08 10:46:03
 * @LastEditTime: 2021-06-08 10:52:11
 */

import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:flutter_app_upgrade/flutter_app_upgrade.dart';
import 'package:taoju5_bc/config/app_manager.dart';

class AppDownloadController extends GetxController {
  DownloadStatus downloadStatus = DownloadStatus.none;

  double progress = 0;

  downloadApk(String url) async {
    String path = await FlutterUpgrade.apkDownloadPath;
    path += AppManager.apkName;
    if (downloadStatus == DownloadStatus.start ||
        downloadStatus == DownloadStatus.downloading ||
        downloadStatus == DownloadStatus.done) {
      print('当前下载状态：$downloadStatus,不能重复下载。');
      return;
    }
    _updateDownloadStatus(DownloadStatus.start);
    try {
      var dio = Dio();
      await dio.download(url, path, onReceiveProgress: (int count, int total) {
        if (total == -1) {
          progress = 0.01;
        } else {
          progress = count / total.toDouble();
        }

        if (progress == 1) {
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
}
