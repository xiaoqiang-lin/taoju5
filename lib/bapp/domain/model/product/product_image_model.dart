import 'package:flutter/rendering.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:get/get.dart';

class ProductImageModel {
  String imageUrl;
  String thumbnail;
  String spec;

  ProductImageModel.fromJson(Map json) {
    imageUrl = JsonKit.asWebUrl(GetUtils.isNullOrBlank(json["pic_cover_long"])
        ? json["pic_cover_big"]
        : json["pic_cover_long"]);
    spec = json["pic_spec_long"];
    thumbnail = JsonKit.asWebUrl(json["pic_cover_mid"]);
  }
}

extension ProductImageModelKit on ProductImageModel {
  List<String> get _specList => spec.split("*");
  double get width => JsonKit.asDouble(_specList?.first ?? "${Get.width}");
  double get height => JsonKit.asDouble(_specList?.last ?? "480");

  BoxFit get fit {
    if (GetUtils.isNullOrBlank(spec)) {
      return BoxFit.fitWidth;
    }
    return width > height ? BoxFit.fitWidth : BoxFit.fitHeight;
  }
}
