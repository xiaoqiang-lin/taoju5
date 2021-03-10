/*
 * @Description: 分享按钮
 * @Author: iamsmiling
 * @Date: 2021-01-15 15:24:50
 * @LastEditTime: 2021-02-02 17:52:48
 */
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/share/taojuwu_share_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/bapp/ui/modal/share/share.dart';
import 'package:taoju5/utils/net_kit.dart';
import 'package:taoju5/xdio/x_dio.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class XShareButtonController extends GetxController {
  final int id;
  ProductRepository _repository = ProductRepository();

  XShareButtonController({@required this.id});

  TaojuwuShareModel shareModel;

  Future<TaojuwuShareModel> _parse(BaseResponse response) async {
    Map json = response.data;
    String image = json["img"];
    String url = json["url"];
    String description = json["others_title"];
    String title = json["title"];
    String suffix = image.substring(image.lastIndexOf("."));
    Uint8List source = await NetKit.resolveImageFromUrl(image);
    WeChatImage weChatImage = WeChatImage.binary(source, suffix: suffix);
    return TaojuwuShareModel(
        weChatImage: weChatImage,
        url: url,
        sessionShareModel: WeChatShareWebPageModel(url,
            thumbnail: weChatImage,
            description: description,
            title: title,
            scene: WeChatScene.SESSION),
        momentShareModel: WeChatShareWebPageModel(url,
            description: description,
            title: title,
            scene: WeChatScene.TIMELINE,
            thumbnail: weChatImage));
  }

  Future loadData() {
    return _repository.productShare(params: {"goods_id": id}).then(
        (BaseResponse response) async {
      shareModel = await _parse(response);
      update();
    });
  }

  StreamSubscription _subscription;
  @override
  void onInit() {
    loadData();
    _subscription =
        weChatResponseEventHandler.listen((BaseWeChatResponse response) {
      if (response is WeChatShareResponse) {
        if (response.isSuccessful) {
          Get.back();
          EasyLoading.showSuccess("分享成功!");
        } else {
          EasyLoading.showSuccess("分享失败!");
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _subscription?.cancel();
    _subscription = null;
  }

  share() {
    return showShareModal(Get.context, shareModel: shareModel);
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
            icon: Image.asset("assets/images/" + "share.png"),
            onPressed: _.share);
      },
    );
  }
}
