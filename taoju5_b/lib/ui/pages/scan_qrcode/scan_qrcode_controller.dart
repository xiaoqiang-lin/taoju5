/*
 * @Description: 权限
 * @Author: iamsmiling
 * @Date: 2021-03-05 16:12:25
 * @LastEditTime: 2021-04-17 17:37:07
 */
import 'package:get/get.dart';
import 'package:scan/scan.dart';
import 'package:taoju5_b/domain/repository/product/product_repository.dart';
import 'package:taoju5_b/routes/bapp_pages.dart';
import 'package:taoju5_bc/utils/permission_kit.dart';
import 'package:taoju5_b/xdio/x_dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanQRCodeController extends GetxController {
  ScanController scanController;

  bool isFlashOn = false;
  @override
  void onInit() {
    _requestPermission();
    scanController = ScanController();

    super.onInit();
  }

  Future<bool> _requestPermission() async {
    bool isGranted = await PermissionKit.isGranted(Permission.camera);
    // if (!isGranted) {
    //   return showAppPermissionRequestDialog("淘居屋暂没有权限使用您的相机哦")
    //       .then((value) async {
    //     if (value == true) {
    //       isGranted = await PermissionKit.requestPerssion(Permission.camera);
    //       Get.back();
    //       return true;
    //     }
    //     Get.back();
    //     return false;
    //   });
    // }
    return isGranted;
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
        id = "${response.data["goods_id"]}";
      }
      if (response.data is int || response.data is String) {
        id = "${response.data}";
      }
      Get.offAndToNamed(BAppRoutes.productDetail + "/$id");
    }).catchError((err) {
      EasyLoading.showInfo("二维码无效");
      Get.back();
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
