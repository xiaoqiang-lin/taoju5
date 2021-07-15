/*
 * @Description: 订单相关
 * @Author: iamsmiling
 * @Date: 2021-05-07 16:02:45
 * @LastEditTime: 2021-07-13 10:45:55
 */
// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/json_kit.dart';
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/domain/entity/logistics/package_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_detail_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_edit_log_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_mainfest_entity.dart';
import 'package:taoju5_c/domain/entity/order/order_tab_entity.dart';
import 'package:taoju5_c/domain/entity/order/preorder_info_entity.dart';
import 'package:taoju5_c/domain/entity/pay/pay_entity.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/provider/order_api.dart';

class OrderRepository {
  OrderAPI _api = OrderAPI();

  Future<PayOrderEntity> createOrder(Map params) =>
      _api.createOrder(params).then((value) {
        if (value.data is Map) {
          var params = value.data["pay_param"];
          return params is Map
              ? WxPayOrderEntity.fromJson(value.data)
              : AliPayOrderEntity.fromJson(value.data);
        }

        // if (value.data is String) {
        //   return AliPayOrderEntity.fromJson(value.data);
        // }
        return WxPayOrderEntity.fromJson(value.data);
      });
  Future<PayOrderEntity> createMeasureOrder(Map params) =>
      _api.createMeasureOrder(params).then((value) {
        if (value.data is Map) {
          var params = value.data["pay_param"]["pay_param"];

          print(params is Map);
          return params is Map
              ? WxPayOrderEntity.fromJson(value.data)
              : AliPayOrderEntity.fromJson(value.data);
        }

        // if (value.data is String) {
        //   return AliPayOrderEntity.fromJson(value.data);
        // }
        return WxPayOrderEntity.fromJson(value.data);
      });

  Future<List<OrderEntity>> orderList(Map? params) =>
      _api.orderList(params).then((BaseEntity response) {
        return OrderListWrapperEntity.fromJson(response.data).orders;
      });

  Future<OrderDetailEntity> orderDetail(Map? params) =>
      _api.orderDetail(params).then((value) {
        return OrderDetailEntity.fromJson(value.data);
      });

  Future<OrderMainfestEntity> mainfest(Map? params) =>
      _api.mainfest(params).then((value) {
        return OrderMainfestEntity.fromJson(value.data);
      });

  Future<List<OrderTabEntity>> orderTabList() =>
      _api.orderTabList().then((value) {
        return JsonKit.asList(value.data)
            .map((e) => OrderTabEntity.fromJson(e))
            .toList();
      });

  //物流

  Future<List<PackageEntity>> logistics({Map? params}) =>
      _api.logistics(params: params).then((value) {
        List list = JsonKit.asList(value.data);
        return list
            .map((e) => PackageEntity.fromJson(e, expand: list.length <= 1))
            .toList();
      });

  /// 获取测装数据
  Future<CurtainMeasureDataAttributeEntity> measureData({Map? params}) {
    return rootBundle.loadString("assets/data/measure_data.json").then((value) {
      return (jsonDecode(value) as Map);
    }).then((Map v) {
      return _api.measureData(params: params).then((value) {
        return CurtainMeasureDataAttributeEntity.fromJson2(v, value.data);
      });
    });
  }

  /// 　修改测装数据
  Future updateMeasureData({Map? params}) {
    return _api.updateMeasureData(params: params);
  }

  /// 取消商品弹窗提示信息
  Future cancelProductTip({Map? params}) {
    return _api.cancelProductTip(params: params);
  }

  /// 取消商品
  Future cancelProduct({Map? params}) {
    return _api.cancelProduct(params: params);
  }

  ///确认选品
  Future confirmSelectedProduct({Map? params}) {
    return _api.confirmSelectedProduct(params: params);
  }

  ///确认支付
  Future pay({Map? params}) {
    return _api.pay(params: params);
  }

  ///确认支付
  Future payBalance({Map? params}) {
    return _api.payBalance(params: params);
  }

  ///取消订单
  Future cancelOrder({Map? params}) {
    return _api.cancelOrder(params: params);
  }

  ///申请退款
  Future refund({Map? params}) {
    return _api.refund(params: params);
  }

  ///选品
  Future select({Map? params}) {
    return _api.select(params: params);
  }

  ///删除订单
  Future deleteOrder({Map? params}) {
    return _api.deleteOrder(params: params);
  }

  ///发送付款请求到后台服务器
  Future<PayOrderEntity> sendPayRequest(String path, {Map? params}) {
    return _api.sendPayRequest(path, params: params).then((value) {
      if (value.data is Map) {
        var params = value.data["pay_param"];
        return params is Map
            ? WxPayOrderEntity.fromJson(value.data)
            : AliPayOrderEntity.fromJson(value.data);
      }
      // if (value.data is String) {
      //   return AliPayOrderEntity.fromJson(value.data);
      // }
      return WxPayOrderEntity.fromJson(value.data);
    });
  }

  ///获取测量或者安装时间记录
  Future<List<OrderEditLogEntity>> editLog({Map? params}) {
    return _api.editLog(params: params).then((value) {
      return JsonKit.asList(value.data)
          .map((e) => OrderEditLogEntity.fromJson(e))
          .toList();
    });
  }

  ///订单操作弹窗提醒文字
  Future<String> operationHint({Map? params}) =>
      _api.operationHint(params: params).then((value) => value.data);

  ///预提交的订单信息
  Future<PreOrderInfoEntity> orderInfo(Map params) =>
      _api.orderInfo(params).then((value) {
        return PreOrderInfoEntity.fromJson(value.data);
      });
}
