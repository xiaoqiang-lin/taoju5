/*
 * @Description: 分享按钮
 * @Author: iamsmiling
 * @Date: 2021-06-08 17:45:14
 * @LastEditTime: 2021-06-08 17:46:33
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/modal/open_share_modal.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset(R.image.share, color: R.color.ff00000),
        onPressed: () => openShareModal(context));
  }
}
