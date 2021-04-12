import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_model.dart';
import 'package:taoju5/bapp/domain/model/order/order_detail_product_model.dart';
import 'package:taoju5/bapp/ui/dialog/order/edit_deltaY.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/room/room_attr_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/size/size_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_style/window_style_selector_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/selectable_product_list/selectable_product_list_controller.dart';

class OrderMeasureDataController extends GetxController {
  SelectProductEvent event;
  OrderDetailProductModel product;

  OrderMeasureDataModel get measureData => product.measureData;
  String id = Get.parameters["id"];
  String tag = Get.parameters["productId"];

  Future openEditDeltaYDialog() {
    return showEditDeltaYDialog(initialValue: measureData.deltaY)
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
    measureData.data.addAll({
      // "安装选项": [measureData.openMode],
      "打开方式": controller.openMode
    });
    update(["openMode"]);
    Get.back();
  }

  Future saveData() {
    if (Get.isRegistered<RoomAttrSelectorController>(tag: tag)) {
      Get.find<RoomAttrSelectorController>(tag: tag)
          .initWithMeasureData(measureData);
    }
    if (Get.isRegistered<SizeSelectorController>(tag: tag)) {
      Get.find<SizeSelectorController>(tag: tag)
          .initWithMeasureData(measureData);
    }
    Get.back();

    measureData.data.addAll({
      "num": 1,
      "goods_id": tag,
      // "打开方式": controller.openMode
    });
    measureData.hasChecked = true;
    return Future.value();
  }

  @override
  void onInit() {
    // OrderDetailController controller = Get.find<OrderDetailController>();
    if (Get.arguments != null && Get.arguments is SelectProductEvent) {
      event = Get.arguments;
      product = event.orderProduct;
    }
    // id = Get.parameters["id"];
    // tag = Get.parameters["productId"];
    // controller?.selectProductArgs?.productId = "$id";
    // controller?.selectProductArgs?.deltaY =
    //     measureData?.newDeltaY ?? measureData?.deltaY;

    // controller?.selectProductArgs?.installMode = [measureData?.installMode];
    // controller?.selectProductArgs?.openMode = [measureData?.openMode];
    super.onInit();
  }
}
