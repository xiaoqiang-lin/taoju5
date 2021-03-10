/*
 * @Description: 设计类上详情
 * @Author: iamsmiling
 * @Date: 2021-01-10 13:51:14
 * @LastEditTime: 2021-01-10 14:19:19
 */
import 'package:taoju5/bapp/domain/model/product/design_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/utils/json_kit.dart';

class DesignProductDetailModelWrapper {
  DesignProductDetailModel product;
  List<DesignProductModel> list;
  DesignProductDetailModelWrapper.fromJson(Map json) {
    product = DesignProductDetailModel.fromJson(json["scenes_detail"]);
    list = JsonKit.asList(json["related_scenes"])
        .map((e) => DesignProductModel.fromJson(e))
        .cast<DesignProductModel>()
        .toList();
  }
}

class DesignProductDetailModel {
  int id;
  String name;
  String description;

  String room;
  String style;
  String image;
  String bigImage;

  List<ProductModel> productList;

  DesignProductDetailModel.fromJson(Map json) {
    id = json["scenes_id"];
    name = json["scenes_name"];
    description = json["scenes_detail"];
    room = json["space"];
    style = json["style"];
    image = JsonKit.asWebUrl(json["image"]);
    bigImage = JsonKit.asWebUrl(json["image_big"]);
    productList = JsonKit.asList(json["goods_list"])
        .map((e) => ProductModel.fromJson(e))
        .cast<ProductModel>()
        .toList();
  }
}
