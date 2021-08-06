/*
 * @Description: 卷帘商品逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-05-24 10:38:13
 * @LastEditTime: 2021-08-05 10:52:37
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/params/order/measure_data_params.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/price_delegator/price_delegator.dart';

class RollingCurtainProductAttributeController
    extends BaseFutureLoadStateController {
  late RollingCurtainProductPriceDelegator priceDelegator;
  late ProductDetailEntity product;
  RollingCurtainProductAttributeController({required this.product}) {
    priceDelegator = RollingCurtainProductPriceDelegator(product);
  }

  Future<CurtainAttributeEntity> loadData({Map? params}) {
    ProductRepository repository = ProductRepository();

    return repository.productAttribute({"goods_id": product.id}).then((value) {
      product.attribute = value;
      return value;
    }).whenComplete(update);
  }

  selectRoom(WindowRoomOptionEntity option) {
    for (WindowRoomOptionEntity o
        in product.attribute.measureData.room.options) {
      o.selected = o == option;
    }
    update();
  }

  Future saveMeasureData() {
    ProductRepository repository = ProductRepository();
    MeasureDataParamsEntity arg =
        MeasureDataParamsEntity(measureData: product.attribute.measureData);
    try {
      arg.validate();
      product.attribute.finished = true;
      return repository.saveMeasureData(arg.params);
    } catch (err, stack) {
      print(err);
      print(stack);
      product.attribute.finished = false;
    } finally {
      update();
    }
    throw ArgumentError.value(arg, "测装数据未填写完整");
  }

  ///在关闭弹窗时调用
  hasFinished() {
    // attribute.finished = (attribute.measureData.room.selectedOption != null) &&
    //     (attribute.measureData.sizeIsNotEmpty);
    // if (attribute.finished) {
    //   product.specTip =
    //       "${attribute.measureData.room.selectedOption?.name ?? ''},宽：${attribute.measureData.size.width}，高：${attribute.measureData.size.width}";
    // }
  }

  void setHeight(String val) {
    product.attribute.measureData.size.setHeight(val);
    product.height = product.attribute.measureData.size.height;
    update();
  }

  void setWidth(String val) {
    product.attribute.measureData.size.setWidth(val);
    product.width = product.attribute.measureData.size.width;
    update();
  }

  Future addToCart() {
    CartRepository repository = CartRepository();
    return saveMeasureData().then((value) {
      product.measureId = value;

      ///此时还没有获取到测量id ，初始化为-1
      AddToCartParamsEntity arg = AddToCartParamsEntity(
        product: product,
      );

      repository.addToCart(params: arg.params);
    }).catchError((err) {
      print(err);
      throw err;
    });
  }

  Future buy() {
    return saveMeasureData().then((value) {
      ///此时还没有获取到测量id ，初始化为-1

      return Get.toNamed(AppRoutes.commitOrder, arguments: [product.adapt()]);
    }).catchError((err) {
      print(err);
      throw err;
    });
  }
}
