/*
 * @Description: 分享按钮
 * @Author: iamsmiling
 * @Date: 2021-01-15 15:24:50
 * @LastEditTime: 2021-02-02 17:52:48
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/modal/share/share.dart';

class XShareButtonController extends GetxController {
  final int id;

  XShareButtonController({@required this.id});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  share() {
    return showShareModal(Get.context, id);
  }
}

class XShareButton extends StatelessWidget {
  final int id;
  const XShareButton({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<XShareButtonController>(
      init: XShareButtonController(id: id),
      tag: "$id",
      builder: (_) {
        return IconButton(
            icon: Image.asset("assets/images/share.png"
                // color: Colors.black54,
                ),
            onPressed: _.share);
      },
    );
  }
}
