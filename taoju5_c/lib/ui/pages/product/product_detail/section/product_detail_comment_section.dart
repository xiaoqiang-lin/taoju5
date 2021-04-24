/*
 * @Description:商品详情客户评论
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:39:42
 * @LastEditTime: 2021-04-23 16:43:34
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/comment/comment_entity.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/product/component/comment_card.dart';

class ProductDetailCommentSection extends StatelessWidget {
  final List<CommentEntity> comments;
  const ProductDetailCommentSection({Key? key, required this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: R.dimen.dp20),
            child: Row(
              children: [
                Text("用户评论", style: R.style.h3),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp5),
                  child: Text(
                    "(121)",
                    style: TextStyle(
                        color: R.color.ff999999, fontSize: R.dimen.sp9),
                  ),
                ),
                Spacer(),
                Text(
                  "查看更多",
                  style: TextStyle(
                      color: R.color.ffee9b5f, fontSize: R.dimen.sp12),
                ),
                Image.asset(R.image.next, color: R.color.ffee9b5f)
              ],
            ),
          ),
          for (CommentEntity item in comments) CommentCard(comment: item)
        ],
      ),
    );
  }
}
