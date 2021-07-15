/*
 * @Description: 打开第三方对应的函数
 * @Author: iamsmiling
 * @Date: 2021-07-01 16:03:26
 * @LastEditTime: 2021-07-01 16:10:03
 */
import 'package:taoju5_c/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherKit {
  ///拨打电话
  static dial(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastKit.error("无法打开链接");
      throw "Could not launch $url";
    }
  }
}
