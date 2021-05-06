/*
 * @Description: 商品详情
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:05:21
 * @LastEditTime: 2021-04-29 20:22:42
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/mixin/product_browse_history.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as finishedProductModal;

class ProductDetailController
    extends BaseFutureLoadStateController<ProductDetailEntity> {
  ProductRepository _repository = ProductRepository();

  String? id = Get.parameters["id"];

  late ProductDetailEntity product;

  @override
  Future<ProductDetailEntity> loadData({Map? params}) {
    return _repository.productDetail({"goods_id": id}).then((value) {
      product = value;
      if (product.productType is! FinishedProductType) {
        _repository.productAttribute({"goods_id": id});
      }
      return value;
    });
  }

  ///选择属性
  openFinishedProductAttributeModal() {
    finishedProductModal.openFinishedProductAttributeModal(Get.context!,
        product: product, onPurchase: () {}, onAddToCart: addToCart);
  }

  Future addToCart() {
    print("_________加入购物车");
    CartRepository cartRepository = CartRepository();
    AddToCartParamsEntity arg = AddToCartParamsEntity(product: product);
    return cartRepository.addToCart(params: arg.params);
  }
}
