/*
 * @Description: 商品浏览记录
 * @Author: iamsmiling
 * @Date: 2021-04-29 20:10:07
 * @LastEditTime: 2021-04-29 20:18:40
 */

class ProductBrowseHistory {
  late int productId;

  late DateTime enterAt;
  late DateTime leaveAt;
  void onInit() {
    enterAt = DateTime.now();

    print("999999******************");
  }

  void onClose() {
    leaveAt = DateTime.now();
    print("页面关闭");
  }
}
