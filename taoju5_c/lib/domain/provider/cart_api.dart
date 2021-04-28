/*
 * @Description: 购物车相关的接口
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:44:07
 * @LastEditTime: 2021-04-27 16:14:02
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class CartAPI {
  HttpKit _http = HttpKit();

  ///加入购物车
  Future<BaseEntity> addToCart({Map? params}) {
    return _http.post("/app/user/addCart", params: params);
  }

  ///购物车列表
  Future<BaseEntity> cartList({Map? params}) {
    return _http.post("/app/user/cartList", params: params);
  }
}
