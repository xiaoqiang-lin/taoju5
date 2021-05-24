/*
 * @Description: 卷帘商品逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-05-24 10:38:13
 * @LastEditTime: 2021-05-24 11:12:11
 */
import 'package:get/get.dart';
import 'package:taoju5_c/domain/entity/params/cart/add_to_cart_params.dart';
import 'package:taoju5_c/domain/entity/params/order/measure_data_params.dart';
import 'package:taoju5_c/domain/entity/product/curtain_attribute_entity.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/domain/repository/cart_repository.dart';
import 'package:taoju5_c/domain/repository/product_repository.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/price_delegator/price_delegator.dart';

class RollingCurtainProductAttributeController extends GetxController {
  late CurtainAttributeEntity attribute;
  late RollingCurtainProductPriceDelegator priceDelegator;
  late ProductDetailEntity product;
  RollingCurtainProductAttributeController(
      {required this.product, required this.attribute}) {
    priceDelegator = RollingCurtainProductPriceDelegator(product, attribute);
  }

  selectRoom(WindowRoomOptionEntity option) {
    for (WindowRoomOptionEntity o in attribute.measureData.room.options) {
      o.selected = o == option;
    }
    update();
  }

  Future saveMeasureData() {
    ProductRepository repository = ProductRepository();
    MeasureDataParamsEntity arg =
        MeasureDataParamsEntity(measureData: attribute.measureData);
    if (arg.validate()) {
      throw ArgumentError.value(arg, "测装数据未填写完整");
    }
    return repository.saveMeasureData(arg.params);
  }

  Future addToCart() {
    CartRepository repository = CartRepository();
    return saveMeasureData().then((value) {
      ///此时还没有获取到测量id ，初始化为-1
      AddToCartParamsEntity arg =
          AddToCartParamsEntity(measureId: value, product: product);
      repository.addToCart(params: arg.params);
    }).catchError((err) {
      print(err);
      throw err;
    });
  }
}
