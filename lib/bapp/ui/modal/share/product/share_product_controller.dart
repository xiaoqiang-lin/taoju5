import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/share/taojuwu_share_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/utils/net_kit.dart';
import 'package:fluwx/fluwx.dart';
import 'package:taoju5/xdio/x_dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ShareProductController extends GetxController {
  int productId;
  ShareProductController(this.productId);
  ProductRepository _repository = ProductRepository();
  TaojuwuShareModel shareModel;

  StreamSubscription _subscription;

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

  void shareToWxSession() async {
    print("++_____分享到最近联系人");
    try {
      bool flag = await shareToWeChat(shareModel.sessionShareModel);
      if (!flag) {
        EasyLoading.showInfo("分享出错,请检查微信是否安装");
      }
    } catch (err) {
      EasyLoading.showInfo("分享出错");
    }
  }

  void shareToWeChatMoment() async {
    try {
      bool flag = await shareToWeChat(shareModel.momentShareModel);
      if (!flag) {
        EasyLoading.showInfo("分享出错,请检查微信是否安装");
      }
    } catch (err) {
      EasyLoading.showInfo("分享出错");
    }
  }

  void copyLink() {
    Clipboard.setData(ClipboardData(text: shareModel.url));
    EasyLoading.showSuccess(shareModel.copyTip);
  }

  List<XShareModel> list = [];

  Future loadData() {
    return _repository.productShare(params: {"goods_id": productId}).then(
        (BaseResponse response) async {
      shareModel = await _parse(response);
      update();
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    _subscription = null;
    super.onClose();
  }

  @override
  void onInit() {
    loadData();
    list = [
      XShareModel(
          description: "微信好友", icon: "wechat.png", onTap: shareToWxSession),
      XShareModel(
          description: "朋友圈",
          icon: "wechat_moment.png",
          onTap: shareToWeChatMoment),
      XShareModel(description: "复制链接", icon: "copy_link.png", onTap: copyLink),
    ];
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
}
