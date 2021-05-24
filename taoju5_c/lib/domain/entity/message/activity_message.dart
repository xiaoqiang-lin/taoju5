/*
 * @Description: 活动通知
 * @Author: iamsmiling
 * @Date: 2021-05-19 16:52:13
 * @LastEditTime: 2021-05-19 16:54:26
 */

class ActivityMessageEntity {
  late String cover;
  late String title;
  late String date;
  late int id;

  ActivityMessageEntity.fromJson(Map json);

  ActivityMessageEntity.sample() {
    cover = "https://i.loli.net/2021/04/15/OazEKJVkrCf9qwT.png";
    title = "淘居屋官方邀您一起参与全民投票赢大奖活动...";
    date = "2021.03.28";
    id = -1;
  }
}
