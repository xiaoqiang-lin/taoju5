/*
 * @Description: 商品相关api
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:26:26
 * @LastEditTime: 2021-01-21 09:33:52
 */

import 'package:taoju5/xdio/x_dio.dart';

class ProductAPI {
  ///商品分类
  Future<BaseResponse> categoryList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> productList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> productDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///商品分享
  Future<BaseResponse> productShare(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///购物车列表
  Future<BaseResponse> cartCount(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///购物车列表
  Future<BaseResponse> cartList(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///修改商品属性
  Future<BaseResponse> modifyProductAttr(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///商品列表过滤条件
  Future<BaseResponse> filterTag(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///场景详情
  Future<BaseResponse> sceneDesignProductDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///软装方案详情
  Future<BaseResponse> softDesignProductDetail({Map params}) =>
      XDio().get("/api/goods/softProjectGoodsDetail", params: params);

  ///软装详情
  Future<BaseResponse> softDesignProductList({Map params}) =>
      XDio().get("/api/goods/softProjectList", params: params);

  ///查询是否为收藏状态
  Future<BaseResponse> isLiked(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///收藏
  Future<BaseResponse> like(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///收藏
  Future<BaseResponse> dislike(String url, {Map params}) =>
      XDio().get(url, params: params);

  //加入购物车
  Future<BaseResponse> addToCart(String url, {Map params}) =>
      XDio().post(url, formData: params);

  //加入购物车
  Future<BaseResponse> scanFromCode(String url, {Map params}) =>
      XDio().post(url, formData: params);

  //添加测装数据
  Future<BaseResponse> addMeasureData(String url, {Map params}) =>
      XDio().post(url, formData: params);

  //添加测装数据
  Future<BaseResponse> removeFromCart(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///获取收藏列表
  Future<BaseResponse> collection({Map params}) =>
      XDio().get("/api/member/collection", params: params);

  ///从收藏列表中删除
  Future<BaseResponse> removeFromCollection({Map params}) =>
      XDio().get("/api/member/cancelCollection", params: params);

  ///修改购物车数量
  Future<BaseResponse> modifyProuductCountInCart({Map params}) =>
      XDio().get("/api/goods/modifyCartNum", params: params);

  ///修改购物车成品属性
  Future<BaseResponse> modifyProuductAttrInCart({Map params}) =>
      XDio().get("/api/goods/modifyCartAccessory", params: params);
}
