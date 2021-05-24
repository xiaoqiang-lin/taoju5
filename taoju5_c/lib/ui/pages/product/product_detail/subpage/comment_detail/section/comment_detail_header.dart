/*
 * @Description: 评论头部
 * @Author: iamsmiling
 * @Date: 2021-05-19 17:10:25
 * @LastEditTime: 2021-05-19 17:31:11
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/image/chimera_image.dart';
import 'package:taoju5_c/domain/entity/comment/comment_detail_entity.dart';
import 'package:taoju5_c/res/R.dart';

class CommentDetailHeader extends StatelessWidget {
  final CommentDetaiEntity comment;
  const CommentDetailHeader({Key? key, required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(R.dimen.dp20),
          child: Row(
            children: [
              ChimeraImage(
                imageUrl: comment.product.image,
                width: R.dimen.dp60,
                height: R.dimen.dp60,
              ),
              Container(
                margin: EdgeInsets.only(left: R.dimen.dp10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.product.name,
                      style: TextStyle(
                          fontSize: R.dimen.sp14, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: R.dimen.dp10),
                      child: Text(
                        comment.product.description,
                        style: TextStyle(
                            fontSize: R.dimen.sp12, color: R.color.ff999999),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          indent: R.dimen.dp20,
          endIndent: R.dimen.dp20,
        )
      ],
    );
  }
}
