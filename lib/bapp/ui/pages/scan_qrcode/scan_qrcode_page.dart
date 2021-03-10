import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:taoju5/bapp/ui/pages/scan_qrcode/scan_qrcode_controller.dart';
import 'package:get/get.dart';

class ScanQRCodePage extends GetView<ScanQRCodeController> {
  const ScanQRCodePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("扫描二维码"),
        actions: [
          IconButton(
              icon: Icon(Icons.flash_on), onPressed: controller.toggleTorchMode)
        ],
      ),
      body: ScanView(
        controller: controller.scanController,
        scanAreaScale: .7,
        scanLineColor: Color(0xFF4759DA),
      ),
    );
  }
}
