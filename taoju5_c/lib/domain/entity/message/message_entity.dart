/*
 * @Description:消息
 * @Author: iamsmiling
 * @Date: 2021-05-19 15:52:10
 * @LastEditTime: 2021-05-19 16:51:54
 */
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/routes/app_routes.dart';

class MessageEntity {
  late int type;
  late String title;
  late String subtitle;
  late int count;
  late int id;

  String get icon =>
      {1: R.image.activityMessage, 2: R.image.orderMessage}[type] ??
      R.image.orderMessage;

  String get path =>
      {
        1: AppRoutes.message + AppRoutes.orderMessage + "/$id",
        2: AppRoutes.message + AppRoutes.activityMessage + "/id"
      }[type] ??
      "";

  MessageEntity(
      {this.count = 0,
      this.id = -1,
      required this.title,
      required this.subtitle,
      required this.type});
  MessageEntity.fromJson(Map json);

  // MessageEntity.sample();
}
