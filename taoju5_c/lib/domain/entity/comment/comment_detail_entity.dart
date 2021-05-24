/*
 * @Description: 评论详情数据模型
 * @Author: iamsmiling
 * @Date: 2021-05-19 17:11:43
 * @LastEditTime: 2021-05-19 17:49:10
 */

import 'package:taoju5_c/domain/entity/picture/picture_entity.dart';

class CommentDetaiEntity {
  CommentProdcutEntity product = CommentProdcutEntity.fromJson({});
  late String userAvatar;
  late String userName;
  late String createAt;
  late int likeCount;
  late String content;
  List<String> pictures = [
    "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
    "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
    "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png",
    "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png"
  ];

  CommentDetaiEntity.fromJson(Map json) {
    userAvatar = "https://i.loli.net/2021/04/13/2VkqWFU5sxwSQcu.png";
    userName = "小居友一号";
    createAt = "10:55";
    likeCount = 88;
    content =
        "质量非常好，与卖家描述的完全一致，非常满意，真的很喜欢 完全超出期望值，发货速度非常快，包装非常仔细、严实，卖 家描述的完全一致，非常满意，真的很喜欢。";
  }
}

class CommentProdcutEntity {
  late String image;
  late String name;
  late String description;

  CommentProdcutEntity.fromJson(Map json) {
    image = "https://i.loli.net/2021/04/15/AQdINn9CJXDilPU.png";
    name = "BML200201";
    description = "【客厅】【单窗/非飘窗/无盒】【顶装】...";
  }

  CommentProdcutEntity.sample() {
    image = "https://i.loli.net/2021/04/15/AQdINn9CJXDilPU.png";
    name = "BML200201";
    description = "【客厅】【单窗/非飘窗/无盒】【顶装】...";
  }
}
