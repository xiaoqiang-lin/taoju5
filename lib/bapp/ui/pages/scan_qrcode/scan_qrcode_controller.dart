import 'package:get/get.dart';
import 'package:scan/scan.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ScanQRCodeController extends GetxController {
  ScanController scanController;

  bool isFlashOn = false;
  @override
  void onInit() {
    scanController = ScanController();
    super.onInit();
  }

  dynamic scan(String path) {
    List<String> list = path.split(",");
    String type = list?.first ?? "";
    String name = list?.last ?? "";
    _parse(type, name);
  }

  Future _parse(String type, String name) {
    ProductRepository repository = ProductRepository();
    return repository.scanFromCode(params: {"type": type, "model": name}).then(
        (BaseResponse response) {
      String id;
      if (response?.data is Map) {
        id = response.data["goods_id"];
      }
      if (response.data is int || response.data is String) {
        id = "${response.data}";
      }
      Get.toNamed(BAppRoutes.productDetail + "/$id");
    });
  }

  void stop() {
    scanController?.pause();
    Get.back();
  }

  void toggleTorchMode() {
    isFlashOn = !isFlashOn;
    update(["flash"]);
    scanController.toggleTorchMode();
  }

  @override
  void onClose() {
    scanController?.pause();
    scanController = null;
    super.onClose();
  }
}
