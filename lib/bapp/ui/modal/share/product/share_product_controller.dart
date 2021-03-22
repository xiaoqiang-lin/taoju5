import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/model/share/taojuwu_share_model.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';
import 'package:taoju5/utils/net_kit.dart';
import 'package:fluwx/fluwx.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ShareProductController extends GetxController {
  String productId;
  ShareProductController(this.productId);
  ProductRepository _repository = ProductRepository();
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
    return _repository.productShare(params: {"goods_id": productId}).then(
        (BaseResponse response) async {
      shareModel = await _parse(response);
      update();
    });
  }
}
