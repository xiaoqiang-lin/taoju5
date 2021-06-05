/*
 * @Description: 文章详情骨架屏
 * @Author: iamsmiling
 * @Date: 2021-06-04 11:09:02
 * @LastEditTime: 2021-06-04 11:11:33
 */
import 'package:flutter/material.dart';

class ArticleDetailSkeleton extends StatelessWidget {
  const ArticleDetailSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("加载"),
    );
  }
}
