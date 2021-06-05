/*
 * @Description:  评论主题内容
 * @Author: iamsmiling
 * @Date: 2021-05-19 17:30:46
 * @LastEditTime: 2021-05-19 17:45:19
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/comment/comment_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class CommentDetailBody extends StatelessWidget {
  final CommentDetaiEntity comment;
  const CommentDetailBody({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: R.dimen.dp10),
      padding: EdgeInsets.symmetric(horizontal: R.dimen.dp20),
      child: Column(
        children: [
          Row(
            children: [
              ChimeraImage(
                comment.userAvatar,
                width: R.dimen.dp36,
                height: R.dimen.dp36,
                borderRadius: BorderRadius.circular(R.dimen.dp36 / 2),
              ),
              Container(
                margin: EdgeInsets.only(left: R.dimen.dp6),
                child: Text(
                  comment.userName,
                  style: TextStyle(fontSize: R.dimen.sp12),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp10),
            child: Row(
              children: [
                Text(
                  comment.createAt,
                  style: TextStyle(
                      fontSize: R.dimen.sp10, color: R.color.ff999999),
                ),
                Container(
                  margin: EdgeInsets.only(left: R.dimen.dp15),
                  child: Text(
                    "${comment.likeCount}人点赞",
                    style: TextStyle(
                        fontSize: R.dimen.sp10, color: R.color.ff999999),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: R.dimen.dp20, bottom: R.dimen.dp15),
            child: Text(
              comment.content,
              style: TextStyle(fontSize: R.dimen.sp12),
            ),
          )
        ],
      ),
    );
  }
}
