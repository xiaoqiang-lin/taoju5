/*
 * @Description: 购物车商品模型
 * @Author: iamsmiling
 * @Date: 2020-12-29 17:49:18
 * @LastEditTime: 2021-01-16 19:32:02
 */

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/product/product_attr_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_type.dart';
import 'package:taoju5/bapp/interface/i_xcountalbe.dart';
import 'package:taoju5/utils/json_kit.dart';

import 'abstract_product_model.dart';
import 'product_adapter_model.dart';

class CartPorductModelListWrapper {
  List<CartPorductModel> list;

  CartPorductModelListWrapper.fromJson(Map json) {
    list = JsonKit.asList(json["cart_list"])
        .map((e) => CartPorductModel.fromJson(e))
        .toList();
  }
}

class CartPorductModel implements IXCountable, AbstractProdductModel {
  String id;
  int skuId;
  String productName;
  double productPrice;
  String description;
  double estimatedPrice;

  int productId;
  String measureId;

  int type;
  String image;
  String room;
  String unit;
  List<ProductAttrAdapterModel> attrsList;
  String length;
  final isChecked = false.obs;
  RxInt count;
  CartPorductModel.fromJson(Map json) {
    id = "${json["cart_id"]}";
    measureId = json["measure_id"];
    count = RxInt((json["num"] ?? 1));
    productName = json['goods_name'];
    skuId = JsonKit.asInt(json["sku_id"]);
    description = json["goods_attr_str"];

    room = JsonKit.getValueInComplexMap(json, ["wc_attr", "1", "name"]);
    image = JsonKit.asWebUrl(
        JsonKit.getValueInComplexMap(json, ["picture_info", "pic_cover"]));
    type = json["goods_type"];
    unit = json["goods_unit"];
    length = json["material"];
    productId = json["goods_id"];
    estimatedPrice = JsonKit.asDouble(json["estimated_price"]) * count.value;
    attrsList = JsonKit.asList(json["goods_accessory"])
        .map((e) => ProductAttrAdapterModel.fromJson(e))
        .toList();
  }

  CartPorductModel.modify(Map json, List<ProductAttrAdapterModel> list) {
    description = json["goods_attr_str"];
    estimatedPrice = JsonKit.asDouble(json["estimated_price"]) * count.value;
    attrsList = list;
  }
}

extension CartPorductModelKit on CartPorductModel {
  ///商品类型
  BaseProductType get productType => getProductType(type);
  double get totalPrice => estimatedPrice * count.value;
  ProductAdapterModel adapt() {
    ProductAdapterModel model = ProductAdapterModel();
    model.id = productId;
    model.room = room;
    model.attrList = attrsList;
    model.name = productName;
    model.unitPrcie = productPrice;
    model.totalPrice = totalPrice;
    model.image = image;
    model.type = type;
    model.description = description;
    model.measureId = measureId;
    model.skuId = skuId;
    model.cartId = id;
    return model;
  }
}
