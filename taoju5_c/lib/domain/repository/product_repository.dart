/*
 * @Description: 商品相关
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:02:12
 * @LastEditTime: 2021-08-06 10:39:30
 */
import 'dart:convert';

import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_entity.dart';
import 'package:taoju5_c/domain/provider/product_api.dart';

class ProductRepository {
  ProductAPI _api = ProductAPI();

  ///商品详情
  Future<ProductDetailEntity> productDetail(Map params) =>
      _api.productDetail(params).then((BaseEntity response) {
        return ProductDetailEntity.fromJson(response.data["goods_detail"]);
      });

  ///商品详情
  Future<ProductDetailEntity> productDetailWithSkuId(Map params) =>
      _api.productDetailWithSkuId(params).then((BaseEntity response) {
        return ProductDetailEntity.fromJson(response.data);
      });

  ///商品详情
  Future<MallEntity> productList(Map params) =>
      _api.productList(params).then((BaseEntity response) {
        return MallEntity.fromJson(response.data);
      });

  ///商品属性
  Future<CurtainAttributeEntity> productAttribute(Map params) async {
    Map json1 = jsonDecode(
        await rootBundle.loadString("assets/data/measure_data.json"));

    Map json2 = (await _api.productAttribute(params)).data;
    return CurtainAttributeEntity.fromJson(json1, json2);
    // WindowRoomEntity room = WindowRoomEntity.fromJson(json1);

    // CurtainMatchingSetAttributeEntity matchingSet =
    //     CurtainMatchingSetAttributeEntity.fromJson(json1);
    // CurtainMeasureDataAttributeEntity measureData =
    //     CurtainMeasureDataAttributeEntity(
    //         measureData: WindowMeasureDataEntity.fromJson(json2, room: room),
    //         room: room);
    // return CurtainAttributeEntity(
    //     matchingSet: matchingSet, measureData: measureData);
  }

  ///商品浏览记录
  Future addToHistory(Map params) => _api.addToHistory(params);

  ///保存测装数据
  Future<int> saveMeasureData(Map params) =>
      _api.saveMeasureData(params).then((value) {
        return JsonKit.asInt(value.data);
      });

  ///保存测装数据
  Future<MallEntity> commendation({Map? params}) =>
      _api.commendation(params).then((value) {
        return MallEntity.fromJson(value.data);
      });

  ///搜索词
  ///保存测装数据
  Future<List<String>> keywords({Map? params}) =>
      _api.keywords(params).then((value) {
        return JsonKit.asList(value.data).cast<String>();
      });

  ///大家都在搜
  Future<List<String>> hotKeywords({Map? params}) =>
      _api.hotKeywords(params).then((value) {
        print(value.data);
        return JsonKit.asList(value.data["keywords_list"]).cast<String>();
      });

  ///购物车测量数据
  Future<Map> measureData({Map? params}) =>
      _api.measureData(params: params).then((BaseEntity response) {
        return JsonKit.asMap(response.data);
      });
}
