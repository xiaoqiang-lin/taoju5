import 'dart:convert';

import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/domain/model/window/window_style_model.dart';
import 'package:taoju5/utils/json_kit.dart';
import 'package:get/get.dart';

import 'product_adapter_model.dart';

class ProductMixinModel {
  int id;
  String name;
  String image;
  double marketPrice;
  double price;
  String unit;
  int picId;
  int code;

  String get widthMStr => ((width ?? 0) / 100)?.toStringAsFixed(2);
  String get heightMStr => ((height ?? 0) / 100)?.toStringAsFixed(2);
  double width;
  double height;

  List<CurtainProductAttrAdapterModel> attrList = [];

  String room;
  String roomId;

  String material;

  ///离地距离
  String deltaY;

  Map installData;
  double totalPrice;

  List<ProductSpecModel> specList;
  List<ProductSkuModel> skuList;
  String thumbnail;

  String measureId;

  String attribute;

  String skuId;
  String skuName;

  Map measureData;
  String installInfo;
  WindowStyleOptionModel style;

  String windowPattern;

  double defaultWidth;
  double defaultHeight;

  ProductMixinModel.fromJson(Map json) {
    id = json['goods_id'];
    name = json['goods_name'];
    thumbnail = json['pic_cover_small'] ?? "";
    image = (json['pic_cover_mid'] ?? json['image'] ?? json['picture']);
    code = json["goods_type"];
    marketPrice = JsonKit.asDouble(json['market_price']);
    totalPrice = JsonKit.asDouble(json['total_price']);
    unit = json["unit"];
    picId = json["pic_id"];
    price = JsonKit.asDouble(
        (json['price'] ?? json['display_price'] ?? json['market_price']));
    width = JsonKit.asDouble(json['width']);
    height = JsonKit.asDouble(json['height']);

    Map<String, dynamic> sku = json['sku_list']?.first ?? {};

    skuName = json['sku_name'] ?? sku['sku_name'];
    // defalutSkuId = sku['sku_id'];
    skuId = "${json["sku_id"] ?? sku["sku_id"]}";
    skuName = json["sku_name"];
    specList = JsonKit.asList(json["spec_list"])
        .map((e) => ProductSpecModel.fromJson(e))
        .toList();
    skuList = JsonKit.asList(json["sku_list"])
        .map((e) => ProductSkuModel.fromJson(e))
        .toList();
    material = json["material"];

    defaultWidth = json["default_width"] ?? 350;
    defaultHeight = json["default_width"] ?? 265;
  }
}

extension ProductMixinModelKit on ProductMixinModel {
  BaseProductType get productType => getProductType(code);

  bool get isUseDefaultMeasureData =>
      width == defaultWidth && height == defaultHeight;

  String get currentSkuDescription {
    if (GetUtils.isNullOrBlank(specList)) return "";
    List<String> list = [];
    specList?.forEach((e) {
      e?.optionList?.forEach((o) {
        if (o.isChecked) {
          list.add(o?.name);
        }
      });
    });
    return list?.join(" ");
  }

  ProductSkuModel get currentSkuModel {
    if (GetUtils.isNullOrBlank(skuList)) return null;
    return skuList?.firstWhere((e) => e?.name?.contains(currentSkuDescription));
  }

  String get description {
    if (productType is FinishedProductType) {
      return "${currentSkuModel?.name ?? currentSkuDescription}\n数量x1";
    }

    if (productType is SectionalbarProductType) {
      return "${currentSkuModel?.name ?? currentSkuDescription}\n用料:$width米";
    }
    return "宽:$width米 高:$height,$room,离地距离(cm):$deltaY,$installInfo";
  }

  Map get params => {
        "cart_tag": "app",
        "estimated_price": totalPrice,
        "wc_attr": attribute ?? "",
        "measure_data":
            productType is CurtainProductType ? measureData ?? "" : "0",
        "cart_detail": jsonEncode({
          "goods_name": name,
          "sku_id": "${currentSkuModel?.id ?? skuId}",
          "price": price,
          "num": "${currentSkuModel?.count ?? 1}",
          "sku_name": "${currentSkuModel?.name ?? skuName}",
          "goods_id": id,
          "picture": picId,
          "material": material
        })
      };
  Map toJson() => {
        "id": id,
        "name": name,
        "room": room,
        "price": price,
        "description": "",
        "attr_list": attrList.map((e) => e.adapt()).toList(),
        "image": image,
        "total_price": totalPrice,
        "measure_id": measureId,
        "sku_id": skuId,
        "attribute": attribute
      };
  ProductAdapterModel adapt() {
    return ProductAdapterModel.fromJson(toJson());
  }
}
