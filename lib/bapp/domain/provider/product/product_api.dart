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

  ///软装详情
  Future<BaseResponse> softDesignProductDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

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
}
