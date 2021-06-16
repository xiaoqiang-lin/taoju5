/*
 * @Description: 某些接口需要提示操作成功的信息
 * @Author: iamsmiling
 * @Date: 2021-05-14 14:26:35
 * @LastEditTime: 2021-06-08 15:55:29
 */
import 'package:dio/dio.dart';
import 'package:taoju5_c/utils/toast.dart';

class ToastInterceptor extends InterceptorsWrapper {
  // List<_Taoju5Bloc> blocs = [AddToCartBloc()];
  // Map<String, _Taoju5Bloc> blocs = {"/app/user/addCart": _AddToCartBloc()};
  List<String> paths = [
    "/app/cart/addCart",
    // "/app/user/delCart",
    "/app/goods/wcAttr",
    "/app/cart/goodsSkuList",
    "/app/user/setDefaultAddress",
    "/app/user/delAddress",
    "/app/user/changePassword",
    // "/app/user/deleteFootprint"
  ];

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (paths.contains(options.path)) {
      ToastKit.loading();
    }
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    if (paths.contains(response.requestOptions.path) &&
        response.data.success &&
        response.data.message.isNotEmpty &&
        response.data.message != "success") {
      ToastKit.success(response.data.message);
    }
    ToastKit.dismiss();
    handler.next(response);
  }
}
