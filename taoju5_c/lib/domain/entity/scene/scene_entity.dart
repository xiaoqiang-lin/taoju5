/*
 * @Description: 场景列表项数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:31:21
 * @LastEditTime: 2021-07-26 10:43:00
 */
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';

class SceneEntityListWrapperEntity {
  late List<SceneEntity> list;
  late int totalPage;

  SceneEntityListWrapperEntity.fromJson(Map json) {
    list = JsonKit.asList(json["data"])
        .map((e) => SceneEntity.fromJson(e))
        .toList();
    totalPage = JsonKit.asInt(json["page_count"]);
  }
}

class SceneEntity {
  late int id;
  late String description;

  late String name;

  late String label;

  late String image;

  late String size;

  double get aspectRatio {
    List<String> arr = size.contains("*") ? size.split("*") : size.split(",");
    double w = double.parse(arr.first);
    double h = double.parse(arr.last);
    print(w);
    print(h);
    print(w / h);
    return w / h;
  }

  SceneEntity.fromJson(Map json) {
    id = json["scenes_id"];
    description = json["scenes_detail"];
    name = json["scenes_name"];
    image = JsonKit.asWebUrl(json["image"]);
    size = json["pic_spec"];
    label = json["browse"];
  }
}
