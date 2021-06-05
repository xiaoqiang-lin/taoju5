/*
 * @Description: 场景详情
 * @Author: iamsmiling
 * @Date: 2021-05-28 09:33:18
 * @LastEditTime: 2021-05-29 09:56:28
 */

// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';

class DesignerCommentEntity {
  late String avatar;
  late String name;

  late String description;

  late String cover;

  DesignerCommentEntity.fromJson(Map json);

  DesignerCommentEntity.sample() {
    avatar = "https://i.loli.net/2021/04/20/E5SK9ahjTvM3tqN.png";
    name = "认证设计师anny";
    description = "夏日南法的白色小屋搭配灰色床品 和暖橘色系床品和场景夏日南法...";
    cover = "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png";
  }
}

class SceneDetailEntity {
  int id = -1;

  late String name;

  late String description;

  late List<PictureEntity> pictures;

  late List<ProductEntity> products;

  late List<DesignerCommentEntity> comments;

  SceneDetailEntity.fromJson(Map json) {
    name = json["scenes_name"];
    description = json["scenes_detail"];
    pictures = JsonKit.asList(json["scenes_img_list"])
        .map((e) => PictureEntity.fromJson(e))
        .toList();
    products = JsonKit.asList(json["goods_list"])
        .map((e) => ProductEntity.fromJson(e))
        .toList();

    comments = List.generate(5, (index) => DesignerCommentEntity.sample());
  }
}
