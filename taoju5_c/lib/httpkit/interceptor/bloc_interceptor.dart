/*
 * @Description: 业务逻辑相关的拦截器 （比如在商品加入购物成功之后需要刷新购物车页面的数据）
 * @Author: iamsmiling
 * @Date: 2021-05-06 11:15:44
 * @LastEditTime: 2021-07-20 10:03:06
 */
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:taoju5_c/ui/pages/cart/cart_controller.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/order_detail_controller.dart';
import 'package:taoju5_c/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5_c/utils/toast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BlocInterceptor extends InterceptorsWrapper {
  // List<_Taoju5Bloc> blocs = [AddToCartBloc()];
  Map<String, _Taoju5Bloc> blocs = {
    "/app/cart/addCart": _AddToCartBloc(),
    "/app/order/orderCreate": _AddToCartBloc(),

    ///订单相关
    ///选品
    "/app/order/selectGoods": _OrderOperationBloc(),

    ///保存或修改测量数据
    "/app/order/saveMeasure": _OrderOperationBloc(),

    ///取消商品
    "/app/refund/orderRefund": _OrderOperationBloc(),

    ///取消订单
    "/app/refund/cancelOrder": _OrderOperationBloc(),

    ///确认选品
    "/app/order/orderSelectedGoods": _OrderOperationBloc(),

    ///删除订单
    "/app/refund/deleteOrder": _OrderOperationBloc(),

    ///确认测装数据
    "/app/order/confirmMeasureData": _OrderOperationBloc(),
  };
  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    _Taoju5Bloc? bloc = blocs[response.requestOptions.path];
    bloc?.onSuccess(response);
    handler.next(response);
  }
}

abstract class _Taoju5Bloc {
  onSuccess(Response response);
}

///加入购物车的逻辑
class _AddToCartBloc implements _Taoju5Bloc {
  ///加入购物车的逻辑
  @override
  onSuccess(Response response) {
    if (response.data.success && g.Get.isRegistered<CartController>()) {
      ///刷新购物车页面的数据
      CartController controller = g.Get.find<CartController>();
      controller.fetchData().whenComplete(controller.update);
    }
  }
}

///登录成功的逻辑
// ignore: unused_element
class _LoginSuccessBloc implements _Taoju5Bloc {
  ///加入购物车的逻辑
  @override
  onSuccess(Response response) {
    if (response.data.success && g.Get.isRegistered<CartController>()) {
      ///刷新购物车页面的数据
      CartController controller = g.Get.find<CartController>();
      controller.fetchData().whenComplete(controller.update);
    }
  }
}

class _OrderOperationBloc implements _Taoju5Bloc {
  @override
  onSuccess(Response response) {
    if (response.data.success) {
      ///刷新订单详情页面数据
      if (g.Get.isRegistered<OrderDetailController>() &&
          response.requestOptions.path != "/app/refund/deleteOrder") {
        ToastKit.loading(maskType: EasyLoadingMaskType.black);
        g.Get.find<OrderDetailController>().fetchData().whenComplete(() {
          ToastKit.dismiss();
        });
      }

      ///刷新订单列表数据
      if (g.Get.isRegistered<OrderListParentController>()) {
        g.Get.find<OrderListParentController>().refreshData();
      }

      ///刷新我的页面数据
      if (g.Get.isRegistered<MineController>()) {
        g.Get.find<MineController>().fetchData();
      }
    }
  }
}
