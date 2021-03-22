import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_product_model.dart';
import 'package:taoju5/bapp/ui/dialog/order/edit_deltaY.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';

class OrderMeasureDataController extends GetxController {
  SelectProductEvent event;
  OrderDetailProductModel product;

  OrderMeasureDataModel get measureData => product.measureData;
  String get id => Get.parameters["id"];

  Future openEditDeltaYDialog() {
    return showEditDeltaYDialog(Get.context, initialValue: measureData.deltaY)
        .then((String val) {
      measureData.newDeltaY = val;
      update(["deltaY"]);
    });
  }

  void saveOpenMode() {
    WindowStyleSelectorController controller =
        Get.find<WindowStyleSelectorController>(tag: id);
    measureData.newOpenModeName = measureData.openMode;
    measureData.openMode = controller.currentOpenModeOption.name;
    update(["openMode"]);
    Get.back();
  }

  @override
  void onInit() {
    // OrderDetailController controller = Get.find<OrderDetailController>();
    if (Get.arguments != null && Get.arguments is SelectProductEvent) {
      event = Get.arguments;
      product = event.orderProduct;
    }
    // controller?.selectProductArgs?.productId = "$id";
    // controller?.selectProductArgs?.deltaY =
    //     measureData?.newDeltaY ?? measureData?.deltaY;

    // controller?.selectProductArgs?.installMode = [measureData?.installMode];
    // controller?.selectProductArgs?.openMode = [measureData?.openMode];
    super.onInit();
  }
}
