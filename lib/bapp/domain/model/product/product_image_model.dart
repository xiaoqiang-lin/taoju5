import 'package:flutter/rendering.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:get/get.dart';

class ProductImageModel {
  String thumbnail;
  String longImageUrl;
  String bigImageUrl;
  String spec;

  ProductImageModel.fromJson(Map json) {
    spec = json["pic_spec"];
    longImageUrl = JsonKit.asWebUrl(json["pic_cover_long"]);
    bigImageUrl = JsonKit.asWebUrl(json["pic_cover_big"]);
    thumbnail = JsonKit.asWebUrl(json["pic_cover_mid"]);
  }
}

extension ProductImageModelKit on ProductImageModel {
  List<String> get _specList {
    if (GetUtils.isNullOrBlank(spec)) {
      return [];
    }
    if (spec.contains(",")) {
      return spec.split(",");
    }
    if (spec.contains("*")) {
      return spec.split("*");
    }
    return [];
  }

  double get width => JsonKit.asDouble(_specList?.first ?? "${Get.width}");
  double get height => JsonKit.asDouble(_specList?.last ?? "480");

  BoxFit get fit {
    if (GetUtils.isNullOrBlank(spec)) {
      return BoxFit.fitWidth;
    }

    return width > height ? BoxFit.fitWidth : BoxFit.fitHeight;
  }

  double get aspectRatio {
    if (GetUtils.isNullOrBlank(spec)) {
      return 1.0;
    }
    print(spec);
    print(width);
    print(height);
    return width / height;
  }

  String get imageUrl {
    if (GetUtils.isNullOrBlank(spec)) {
      return bigImageUrl;
    }
    return longImageUrl;
  }
}
