/*
 * @Description: 分享
 * @Author: iamsmiling
 * @Date: 2021-01-17 19:31:14
 * @LastEditTime: 2021-02-01 11:12:59
 */
import 'package:flutter/foundation.dart';
import 'package:fluwx/fluwx.dart';

class XShareModel {
  String description;
  String icon;
  Function onTap;

  XShareModel({this.description, this.icon, this.onTap});
}

class TaojuwuShareModel {
  WeChatShareWebPageModel sessionShareModel;
  WeChatShareWebPageModel momentShareModel;
  WeChatImage weChatImage;
  String url;
  String copyTip;

  TaojuwuShareModel(
      {@required this.sessionShareModel,
      @required this.momentShareModel,
      @required this.url,
      @required this.weChatImage,
      this.copyTip = "链接复制成功"});

  TaojuwuShareModel.fromJson(Map json) {
    url = json["url"];
    String description = json["others_title"];
    String title = json["title"];

    weChatImage = json["img"];
    sessionShareModel = WeChatShareWebPageModel(url,
        thumbnail: weChatImage,
        description: description,
        title: title,
        scene: WeChatScene.SESSION);
    momentShareModel = WeChatShareWebPageModel(url,
        description: description,
        title: title,
        scene: WeChatScene.TIMELINE,
        thumbnail: weChatImage);
  }
}
