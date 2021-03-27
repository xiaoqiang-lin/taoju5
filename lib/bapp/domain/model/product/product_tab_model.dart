/*
 * @Description: 商品tab模型
 * @Author: iamsmiling
 * @Date: 2021-01-05 17:50:50
 * @LastEditTime: 2021-01-05 17:51:04
 */

class ProductTabModel {
  String name;
  int id;
  bool isChecked;
  int count;
  ProductTabModel({this.name, this.id, this.isChecked = false, this.count = 0});

  ProductTabModel.fromJson(Map json) {
    name = json["name"];
    id = json["category_id"];
    count = json["num"];
  }
}
