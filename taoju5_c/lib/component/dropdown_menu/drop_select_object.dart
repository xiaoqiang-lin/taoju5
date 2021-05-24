/*
 * @Description: 下拉选项数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-20 09:32:38
 * @LastEditTime: 2021-05-20 10:49:42
 */
class DropSelectObject {
  String title;
  List<DropSelectObject> children;
  bool selected;
  bool multiple;

  DropSelectObject(
      {this.title = "",
      this.children = const [],
      this.selected = false,
      this.multiple = false});

  DropSelectObject clone() {
    DropSelectObject newData = DropSelectObject();
    newData.title = title;
    newData.children = [];
    children.forEach((item) {
      newData.children.add(item.clone());
    });

    newData.selected = selected;
    newData.multiple = multiple;
    return newData;
  }
}
