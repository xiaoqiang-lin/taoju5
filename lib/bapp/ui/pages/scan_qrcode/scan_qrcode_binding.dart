import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/scan_qrcode/scan_qrcode_controller.dart';

class ScanQRCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanQRCodeController());
  }
}
