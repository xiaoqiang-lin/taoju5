/*
 * @Description: 设置通用组件
 * @Author: iamsmiling
 * @Date: 2021-04-14 18:05:10
 * @LastEditTime: 2021-06-08 09:41:13
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/subpage/setting/setting_controller.dart';

class SettingListTile extends StatelessWidget {
  final SettingTileEntity entity;
  final bool enable;
  const SettingListTile({Key? key, required this.entity, this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: entity.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: R.dimen.dp15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entity.label,
                  style: TextStyle(fontSize: R.dimen.sp14),
                ),
                Spacer(),
                Text(
                  entity.value,
                  style: TextStyle(
                      fontSize: R.dimen.sp12, color: R.color.ff999999),
                ),
                Visibility(visible: enable, child: Image.asset(R.image.next))
              ],
            ),
          ),
          Divider()
        ],
      )),
    );
  }
}
