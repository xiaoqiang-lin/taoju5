/*
 * @Description: 订单相关
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:03:16
 * @LastEditTime: 2021-07-13 10:32:27
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class OrderAPI {
  HttpKit _http = HttpKit();

  Future<BaseEntity> createOrder(Map params) =>
      _http.post("/app/order/orderCreate", params: params);

  Future<BaseEntity> orderInfo(Map params) =>
      _http.get("/app/order/submitOrder");

  Future<BaseEntity> createMeasureOrder(Map params) =>
      _http.post("/app/order/orderMeasureCreate", params: params);

  ///订单列表
  Future<BaseEntity> orderList(Map? params) =>
      _http.get("/app/order/orderList", params: params);

  ///订单详情
  Future<BaseEntity> orderDetail(Map? params) =>
      _http.get("/app/order/orderDetail", params: params);

  ///商品清单
  Future<BaseEntity> mainfest(Map? params) =>
      _http.get("/app/order/orderGoodsChecklist", params: params);

  ///商品清单
  Future<BaseEntity> orderTabList() => _http.get("/app/order/orderListTitle");

  ///物流信息
  Future<BaseEntity> logistics({Map? params}) =>
      _http.get("/app/order/orderExpressList", params: params);

  ///测装数据
  Future<BaseEntity> measureData({Map? params}) =>
      _http.get("/app/order/orderGoodsMeasureData", params: params);

  ///确认测装数据
  Future<BaseEntity> updateMeasureData({Map? params}) =>
      _http.post("/app/order/confirmMeasureData", formData: params);

  ///取消商品提示
  Future<BaseEntity> cancelProductTip({Map? params}) =>
      _http.post("/app/refund/orderGoodsRefundMessage", formData: params);

  ///取消商品
  Future<BaseEntity> cancelProduct({Map? params}) =>
      _http.post("/app/refund/orderRefund", formData: params);

  ///确认选品
  Future<BaseEntity> confirmSelectedProduct({Map? params}) =>
      _http.post("/app/order/orderSelectedGoods", formData: params);

  ///确认支付
  Future<BaseEntity> pay({Map? params}) =>
      _http.post("/app/order/orderPay", formData: params);

  ///支付尾款
  Future<BaseEntity> payBalance({Map? params}) =>
      _http.post("/app/order/finalPay", formData: params);

  ///取消订单
  Future<BaseEntity> cancelOrder({Map? params}) =>
      _http.post("/app/refund/cancelOrder", formData: params);

  ///申请退款
  Future<BaseEntity> refund({Map? params}) =>
      _http.post("/app/refund/applyOrderRefund", formData: params);

  ///取消退款
  Future<BaseEntity> cancelRefund({Map? params}) =>
      _http.post("/app/refund/cancelRefund", formData: params);

  ///选品
  Future<BaseEntity> select({Map? params}) =>
      _http.post("/app/order/selectGoods", formData: params);

  ///删除订单
  Future<BaseEntity> deleteOrder({Map? params}) =>
      _http.post("/app/refund/deleteOrder", formData: params);

  ///发送付款请求到后台服务器  创建订单
  Future<BaseEntity> sendPayRequest(String path, {Map? params}) =>
      _http.post(path, formData: params);

  ///获取测量或者安装时间记录
  Future<BaseEntity> editLog({Map? params}) =>
      _http.get("/app/order/measureOrInstallRecords", params: params);

  ///订单操作弹窗提醒文字
  Future<BaseEntity> operationHint({Map? params}) =>
      _http.get("/app/order/orderOperationMessage", params: params);
}
