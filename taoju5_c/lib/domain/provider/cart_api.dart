/*
 * @Description: 购物车相关的接口
 * @Author: iamsmiling
 * @Date: 2021-04-27 14:44:07
 * @LastEditTime: 2021-08-06 10:19:00
 */
import 'package:taoju5_c/domain/entity/base_entity.dart';
import 'package:taoju5_c/httpkit/http_kit.dart';

class CartAPI {
  HttpKit _http = HttpKit();

  ///加入购物车
  Future<BaseEntity> addToCart({Map? params}) {
    return _http.post("/app/cart/addCart", formData: params);
  }

  ///购物车列表
  Future<BaseEntity> cartList({Map? params}) {
    return _http.post("/app/cart/cartList", params: params);
  }

  ///购物车列表
  Future<BaseEntity> removeFromCart({Map? params}) {
    return _http.post("/app/cart/delCart", params: params);
  }

  ///购物车列表
  Future<BaseEntity> modifyCartCount({Map? params}) {
    return _http.post("/app/cart/modifyCartNum", params: params);
  }

  ///修改购物车属性
  Future<BaseEntity> modifyCartSku({Map? params}) {
    return _http.post("/app/cart/modifyCartAccessory", params: params);
  }

  ///批量添加到购物车
  Future<BaseEntity> batchAddToCart({Map? params}) {
    return _http.post("/app/cart/addCartList", formData: params);
  }

  ///购物车测量数据
  Future<BaseEntity> measureData({Map? params}) {
    return _http.post("/app/order/measureData", formData: params);
  }
}
