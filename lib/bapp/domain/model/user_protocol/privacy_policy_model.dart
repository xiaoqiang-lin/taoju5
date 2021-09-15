/*
 * @Description: 隐私政策
 * @Author: iamsmiling
 * @Date: 2021-09-15 20:35:21
 * @LastEditTime: 2021-09-15 20:51:32
 */
class PrivacyPolicyModel {
  String title;
  String content;

  PrivacyPolicyModel.fromJson(Map json) {
    title = json["title"];
    content = json["content"];
  }
}
