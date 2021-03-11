import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/ui/pages/scan_qrcode/scan_qrcode_controller.dart';
import 'package:get/get.dart';

class ScanQRCodePage extends GetView<ScanQRCodeController> {
  const ScanQRCodePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: BColors.scanLineColor),
        title: Text(
          "扫描二维码",
          style: TextStyle(color: BColors.scanLineColor),
        ),
        actions: [
          GetBuilder<ScanQRCodeController>(
            id: "flash",
            builder: (_) {
              return IconButton(
                  icon: Icon(
                    _.isFlashOn ? Icons.flash_off : Icons.flash_on,
                    color: BColors.scanLineColor,
                  ),
                  onPressed: controller.toggleTorchMode);
            },
          ),
          TextButton(
              child: Text(
                "取消",
                style: TextStyle(color: BColors.scanLineColor),
              ),
              onPressed: controller.stop)
        ],
      ),
      body: ScanView(
        controller: controller.scanController,
        scanAreaScale: .7,
        scanLineColor: BColors.scanLineColor,
        onCapture: controller.scan,
      ),
    );
  }
}
