import 'package:get/get.dart';
import 'package:scan/scan.dart';

class ScanQRCodeController extends GetxController {
  ScanController scanController;

  @override
  void onInit() {
    scanController = ScanController();
    super.onInit();
  }

  void toggleTorchMode() {
    scanController.toggleTorchMode();
  }

  @override
  void onClose() {
    scanController?.pause();
    scanController = null;
    super.onClose();
  }
}
