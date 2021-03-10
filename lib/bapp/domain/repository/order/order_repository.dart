/*
 * @Description: 订单相关api
 * @Author: iamsmiling
 * @Date: 2020-12-22 14:04:37
 * @LastEditTime: 2021-02-02 17:52:03
 */

import 'package:flutter/foundation.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_log_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_logistics_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_mainfest_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_price_model.dart';
import 'package:taoju5/bapp/domain/provider/order/order_api.dart';
import 'package:taoju5/utils/x_logger.dart';

import 'package:taoju5/xdio/x_dio.dart';

class OrderRepository {
  OrderAPI _api = OrderAPI();

  Future<OrderModelListWrapper> orderList({Map params}) {
    return _api
        .orderList("/api/order/order", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<OrderDetailModelWrapper> orderDetail({Map params}) {
    return _api
        .orderDetail("/api/order/orderDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  ///选品
  Future selectProduct({Map params}) {
    return _api
        .selectProduct("/api/order/addMeasureOrderGoods", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return;
      }
      // throw EasyLoading.showInfo(response.message);/
    }).catchError((err) {
      throw err;
    });
  }

  ///确认选品
  Future confirmSelect({Map params}) {
    return _api
        .selectProduct("/api/order/addMeasureOrderGoods", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return;
      }
      // throw EasyLoading.showInfo(response.message);/
    }).catchError((err) {
      throw err;
    });
  }

  ///订单提醒
  Future remind({Map params}) {
    XLogger.v(params);
    return _api
        .remind("/api/order/notice", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return;
      }
      // throw EasyLoading.showInfo(response.message);/
    }).catchError((err) {
      throw err;
    });
  }

  /// [adjust_money]: deltaPrice,
  /// [adjust_money_remark] 'adjust_money_remark': remark,
  ///  [order_id]  'order_id': orderId ?? -1
  Future<OrderPriceModel> modifyPrice({Map params}) {
    XLogger.v(params);
    return _api
        .modifyPrice("/api/order/orderAdjustMoney", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        XLogger.v(response.data);
        return OrderPriceModel.fromJson(response.data);
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  /// [order_id]: orderId,
  /// [order_close_reason]: reason
  Future<BaseResponse> cancelOrder({Map params}) {
    XLogger.v(params);
    return _api
        .cancelOrder("/api/order/orderClose", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return response;
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  Future<BaseResponse> cancelProduct({Map params}) {
    XLogger.v(params);
    return _api
        .cancelProduct("/api/order/orderRefund", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return response;
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  Future submitOrder(
      {Map params, bool isMeasureOrder = false, bool isWeb = false}) {
    return _api
        .submitOrder(
      isMeasureOrder
          ? isWeb
              ? "/api/order/orderWebMeasureCreate"
              : "/api/order/orderMeasureCreate"
          : "/api/order/orderCreate",
      params: params,
    )
        .then((BaseResponse response) {
      if (response.isValid) {
        return response;
      }

      throw response.message;
    }).catchError((err) {
      throw err;
    });
  }

  ///物流信息
  Future<PacketLogisticsModelListWrapper> logistics({@required Map params}) {
    return _api
        .logistics("/api/order/orderExpressList", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return PacketLogisticsModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    });
  }

  ///售后服务
  Future<BaseResponse> aftersell({@required Map params}) =>
      _api.aftersell("/api/order/addOrderQuestion", params: params);

  ///商品清单

  Future<OrderMainfestModel> mainfest({Map params}) {
    return _api
        .mainfest("/api/order/productList", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderMainfestModel.fromJson(response.data);
      }
      throw Future.error(response.message);
    });
  }

  ///订单编辑记录
  Future<OrderLogModel> orderLog({Map params}) {
    return _api
        .orderLog("/api/order/getMeasureInstallRecords", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return OrderLogModel.fromJson(response.data);
      }
      return Future.error(response.message);
    });
  }
}
