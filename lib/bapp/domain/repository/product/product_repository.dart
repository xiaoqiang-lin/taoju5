/*
 * @Description: 商品列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:28:50
 * @LastEditTime: 2021-01-25 09:44:56
 */
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_filter_tag_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/provider/product/product_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ProductRepository {
  final ProductAPI _api = ProductAPI();

  Future<BaseResponse> categoryList({Map params}) {
    return _api.categoryList("/api/goods/getGoodsCategory");
  }

  Future<ProductModelListWrapper> productList({Map params}) {
    return _api
        .productList("/api/goods/goodsListByConditions", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return ProductModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<ProductDetailModelWrapper> productDetail({Map params}) => _api
          .productDetail("/api/goods/goodsDetail", params: params)
          .then((BaseResponse response) {
        if (response.isValid) {
          return ProductDetailModelWrapper.fromJson(response.data);
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });
  Future<ProductDetailModelWrapper> productWebDetail({Map params}) => _api
          .productDetail("/api/goods/goodsDetailForWeb", params: params)
          .then((BaseResponse response) {
        if (response.isValid) {
          return ProductDetailModelWrapper.fromJson(response.data);
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });
  Future<BaseResponse> productShare({Map params}) => _api
          .productDetail("/api/goods/goodsShare", params: params)
          .then((BaseResponse response) async {
        if (response.isValid) {
          return response;
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });

  ///购物车数量
  Future<BaseResponse> cartCount({Map params}) {
    return _api.cartCount("/api/goods/cartCount", params: params);
  }

  Future<CartPorductModelListWrapper> cartList({Map params}) {
    return _api
        .cartList("/api/goods/cartList", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return CartPorductModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<BaseResponse> modifyProductAttr({Map params}) {
    return _api.modifyProductAttr("/api/goods/modifyCartAccessory",
        params: params);
  }

  Future<ProductFilterTagModelListWrapper> filterTag({Map params}) {
    return _api
        .cartList("/api/goods/filtrateTag", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return ProductFilterTagModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  //// {'scenes_id': widget.scenesId
  Future<DesignProductDetailModelWrapper> sceneDesignProductDetail(
      {Map params}) {
    return _api
        .cartList("/api/goods/scenesDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return DesignProductDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  //// {'scenes_id': widget.scenesId
  Future<DesignProductDetailModelWrapper> softDesignProductDetail(
      {Map params}) {
    return _api
        .cartList("/api/goods/scenesDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return DesignProductDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<BaseResponse> isLiked({Map params}) {
    return _api.isLiked("/api/goods/whetherCollection", params: params);
  }

  Future<BaseResponse> like({Map params}) {
    return _api.like("/api/member/addCollection", params: params);
  }

  Future<BaseResponse> dislike({Map params}) {
    return _api.dislike("/api/member/cancelCollection", params: params);
  }

  Future addToCart() {}
}
