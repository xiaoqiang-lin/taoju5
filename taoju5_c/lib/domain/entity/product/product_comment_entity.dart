/*
 * @Description: 商品评论
 * @Author: iamsmiling
 * @Date: 2021-04-27 16:34:30
 * @LastEditTime: 2021-04-27 17:15:25
 */

class ProductCommentEntity {
  late int id;
  late String content;
  late String userAvatar;
  late String createdAt;
  late String username;

  ///点赞数量
  late int favorCount;
  late bool hasLiked;

  late List<String> images;

  ProductCommentEntity.fromJson(Map json);

  ProductCommentEntity.sample() {
    id = 1;
    username = "杨超越";
    images = [
      "https://i.loli.net/2021/04/20/E5SK9ahjTvM3tqN.png",
      "https://i.loli.net/2021/04/13/t3M15Z8oQCSLAgb.png",
      "https://i.loli.net/2021/04/13/67rn3TmJ1Y4RIlu.png"
    ];
    hasLiked = true;
    favorCount = 188;
    createdAt = "三天前";
    content =
        "质量非常好，与卖家描述的完全一致，非常满意，真的很喜欢 完全超出期望值，发货速度非常快，包装非常仔细、严实，卖 家描述的完全一致，非常满意，真的很喜欢。";
    userAvatar = "https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png";
  }
}
