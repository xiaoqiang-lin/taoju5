/*
 * @Description: 淘学院
 * @Author: iamsmiling
 * @Date: 2021-04-21 13:49:59
 * @LastEditTime: 2021-04-21 14:04:45
 */
class CourseEntity {
  int id;
  String cover;
  String desc;
  bool isVideo;
  double ratio;
  String href;

  CourseEntity(
      {required this.id,
      required this.cover,
      required this.isVideo,
      required this.ratio,
      required this.desc,
      required this.href});
}
