/*
 * @Description: 商品相关的接口
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:00:14
 * @LastEditTime: 2021-08-06 10:22:20
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class ProductAPI {
  HttpKit _http = HttpKit();

  ///商品详情
  Future<BaseEntity> productDetail(Map params) =>
      _http.get("/app/goods/goodsDetail", params: params);

  ///商品详情
  Future<BaseEntity> productDetailWithSkuId(Map params) =>
      _http.get("/app/cart/goodsSkuList", params: params);

  ///商品列表
  Future<BaseEntity> productList(Map params) =>
      _http.get("/app/goods/goodsList", params: params);

  ///商品属性
  Future<BaseEntity> productAttribute(Map params) =>
      _http.get("/app/goods/wcAttr", params: params);

  ///商品浏览记录
  Future<BaseEntity> addToHistory(Map params) =>
      _http.get("/app/goods/addGoodsBrowse", params: params);

  ///保存测量记录
  Future<BaseEntity> saveMeasureData(Map params) =>
      _http.post("/app/order/saveMeasure", formData: params);

  Future<BaseEntity> commendation(Map? params) =>
      _http.get("/app/goods/maybeLikeGoodsList", params: params);

  ///搜索词
  Future<BaseEntity> keywords(Map? params) =>
      _http.get("/app/goods/searchContent", params: params);

  /// 大家都在搜
  Future<BaseEntity> hotKeywords(Map? params) =>
      _http.get("/app/goods/searchInfo", params: params);

  ///购物车测量数据
  Future<BaseEntity> measureData({Map? params}) {
    return _http.post("/app/order/measureData", formData: params);
  }
}
