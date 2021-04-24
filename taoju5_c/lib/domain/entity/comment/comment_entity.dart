/*
 * @Description: 用户评论
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:41:26
 * @LastEditTime: 2021-04-23 16:04:26
 */
class CommentEntity {
  late String content;
  late String userAvatar;
  late String username;
  late String date;

  CommentEntity.sample() {
    content = """质量非常好，与卖家描述的完全一致，非常满意，真的很喜欢，
完全超出期望值，发货速度非常快，包装非常仔细、严实，...一样一样一样一样一样一样一样""";
    userAvatar =
        "https://tse1-mm.cn.bing.net/th/id/OIP.GVlBBN34hUKly3D4pSGEHwHaHa?pid=ImgDet&rs=1";
    username = "杨超越";
    date = "三天前";
  }
}
