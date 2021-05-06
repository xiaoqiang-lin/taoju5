/*
 * @Description: cart
 * @Author: iamsmiling
 * @Date: 2021-04-21 14:33:06
 * @LastEditTime: 2021-04-30 10:29:58
 */

import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/cart/cart_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/open_finished_product_attribute_modal.dart'
    as modal;
import 'package:taoju5_c/utils/toast.dart';

import 'dialog/remove_from_cart_dialog.dart' as dialog;

class CartController extends BaseFutureLoadStateController<List<CartEntity>> {
  CartRepository _repository = CartRepository();

  List<CartEntity> carts = [];
  @override
  Future<List<CartEntity>> loadData({Map? params}) {
    return _repository.cartList().then((value) {
      carts = value;
      return value;
    });
  }

  Future openRemoveFromCartDialog(int id) {
    return dialog.openRemoveFromCartDialog(Get.context!,
        onMoveToCollection: () {},
        onRemoveFromCart: () => removeFromCart(id).whenComplete(Get.back));
  }

  Future removeFromCart(int id) {
    ToastKit.loading();
    return _repository.removeFromCart(params: {"cart_id": id}).then((value) {
      carts = value;
      if (carts.isEmpty) {
        change([], status: RxStatus.empty());
      }
      return value;
    }).whenComplete(() {
      ToastKit.dismiss();
      update();
    });
  }

  Future openFinishedProductAttributeModal(CartEntity cart) {
    ProductRepository productRepository = ProductRepository();
    ToastKit.loading();
    return productRepository.productDetail({"goods_id": cart.productId}).then(
        (ProductDetailEntity value) {
      ToastKit.dismiss();
      modal.openFinishedProductAttributeModal(Get.context!,
          product: value, onAddToCart: () {});
    });
  }

  void select(CartEntity cart, bool checked) {
    cart.checked = checked;
  }

  final totalPrice = 0.00.obs;
}
