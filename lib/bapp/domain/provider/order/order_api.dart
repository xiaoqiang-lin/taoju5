/*
 * @Description: 订单相关api
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:02:51
 * @LastEditTime: 2021-01-21 16:33:58
 */

import 'package:taoju5/xdio/x_dio.dart';

class OrderAPI {
  Future<BaseResponse> orderList(String url, {Map params}) =>
      XDio().get(url, params: params);

  Future<BaseResponse> orderDetail(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///选品
  Future<BaseResponse> selectProduct(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///修改价格
  Future<BaseResponse> modifyPrice(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///取消订单
  Future<BaseResponse> cancelOrder(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///取消商品
  Future<BaseResponse> cancelProduct(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///确认选品
  Future<BaseResponse> confirmSelet(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///订单提醒
  Future<BaseResponse> remind(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///提交测量单
  Future<BaseResponse> submitOrder(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///物流信息
  Future<BaseResponse> logistics(String url, {Map params}) =>
      XDio().post(url, queryParameters: params);

  ///售后服务
  Future<BaseResponse> aftersell(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///上传图片
  Future<BaseResponse> uploadImage(String url, {Map params}) =>
      XDio().post(url, formData: params);

  ///商品清单
  Future<BaseResponse> mainfest(String url, {Map params}) =>
      XDio().get(url, params: params);

  ///订单编辑记录
  Future<BaseResponse> orderLog(String url, {Map params}) =>
      XDio().get(url, params: params);
}
