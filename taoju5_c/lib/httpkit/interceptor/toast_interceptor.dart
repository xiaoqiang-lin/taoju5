/*
 * @Description: 某些接口需要提示操作成功的信息
 * @Author: iamsmiling
 * @Date: 2021-05-14 14:26:35
 * @LastEditTime: 2021-05-14 15:58:07
 */
import 'package:dio/dio.dart';
import 'package:taoju5_c/utils/toast.dart';

class ToastInterceptor extends InterceptorsWrapper {
  // List<_Taoju5Bloc> blocs = [AddToCartBloc()];
  // Map<String, _Taoju5Bloc> blocs = {"/app/user/addCart": _AddToCartBloc()};
  List<String> paths = ["/app/user/addCart", "/app/goods/wcAttr"];

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
