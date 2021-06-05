/*
 * @Description: 业务逻辑相关的拦截器 （比如在商品加入购物成功之后需要刷新购物车页面的数据）
 * @Author: iamsmiling
 * @Date: 2021-05-06 11:15:44
 * @LastEditTime: 2021-06-03 15:54:27
 */
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:taoju5_c/ui/pages/cart/cart_controller.dart';

class BlocInterceptor extends InterceptorsWrapper {
  // List<_Taoju5Bloc> blocs = [AddToCartBloc()];
  Map<String, _Taoju5Bloc> blocs = {"/app/cart/addCart": _AddToCartBloc()};
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
