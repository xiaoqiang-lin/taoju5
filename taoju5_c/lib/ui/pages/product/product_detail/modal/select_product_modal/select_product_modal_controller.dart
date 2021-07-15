/*
 * @Description: 选品弹窗
 * @Author: iamsmiling
 * @Date: 2021-07-02 15:46:11
 * @LastEditTime: 2021-07-07 10:35:14
 */
import 'package:get/get.dart';
import 'package:taoju5_c/component/net/future_loadstate_controller.dart';
import 'package:taoju5_c/domain/entity/params/cart/select_product_params.dart';
import 'package:taoju5_c/domain/entity/product/product_detail_entity.dart';
import 'package:taoju5_c/domain/repository/order_repository.dart';
import 'package:taoju5_c/routes/app_routes.dart';
import 'package:taoju5_c/ui/pages/order/order_detail/subpage/measure_data/measure_data_controller.dart';
import 'package:taoju5_c/ui/pages/product/product_detail/modal/curtain_product_attribute_modal/curtain_product_attribute_controller.dart';

class SelectProductModalController extends BaseFutureLoadStateController {
  late ProductDetailEntity product;

  SelectProductModalController({required this.product});

  @override
  void onInit() {
    Get.put(MeasureDataController());
    Get.put(CurtainProductAttributeController(product: product));
    super.onInit();
  }

  @override
  Future loadData({Map? params}) {
    return Get.find<CurtainProductAttributeController>()
        .loadData()
        .then((value) {
      Get.find<MeasureDataController>().loadData();
    });
  }

  Future select() {
    OrderRepository repository = OrderRepository();
    SelectProductParamsEntity arg = SelectProductParamsEntity(
        orderProductId: Get.parameters["order_goods_id"] ?? "",
        product: product);
    return repository.select(params: arg.params).then((value) {
      Get.until((route) {
        return Get.currentRoute.contains(AppRoutes.orderDetail);
      });
    });
  }

  @override
  void onClose() {
    Get.delete<CurtainProductAttributeController>(force: true);
    Get.delete<MeasureDataController>(force: true);
    super.onClose();
  }
}
