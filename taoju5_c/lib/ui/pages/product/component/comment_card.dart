/*
 * @Description: 用户评论
 * @Author: iamsmiling
 * @Date: 2021-04-23 15:51:39
 * @LastEditTime: 2021-04-23 16:06:43
 */

import 'package:flutter/material.dart';
import 'package:taoju5_c/domain/entity/comment/comment_entity.dart';
import 'package:taoju5_c/res/R.dart';

class CommentCard extends StatelessWidget {
  final CommentEntity comment;
  const CommentCard({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: R.dimen.sp24,
              backgroundImage: NetworkImage(comment.userAvatar),
            ),
            Container(
              margin: EdgeInsets.only(left: R.dimen.dp6),
              child: Column(
                children: [
                  Text(
                    comment.username,
                    style: TextStyle(fontSize: R.dimen.sp12),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: R.dimen.dp3),
                    child: Text(
                      comment.date,
                      style: TextStyle(
                          fontSize: R.dimen.sp10, color: R.color.ff999999),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: R.dimen.dp10, bottom: R.dimen.dp15),
          child: Text(
            comment.content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: R.dimen.sp12),
          ),
        )
      ],
    ));
  }
}
