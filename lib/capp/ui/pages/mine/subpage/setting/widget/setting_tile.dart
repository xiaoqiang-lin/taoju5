/*
 * @Description: 设置通用组件
 * @Author: iamsmiling
 * @Date: 2021-04-14 18:05:10
 * @LastEditTime: 2021-04-15 17:41:06
 */
import 'package:flutter/material.dart';
import 'package:taoju5/capp/res/R.dart';
import 'package:taoju5/capp/ui/pages/mine/subpage/setting/setting_controller.dart';

class CSettingListTile extends StatelessWidget {
  final CSettingTileEntity entity;
  const CSettingListTile({Key key, @required this.entity})
      : assert(entity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: entity.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: R.dimen.dp18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entity.label,
                  style: TextStyle(fontSize: R.dimen.sp14),
                ),
                Icon(R.icon.next)
              ],
            ),
          ),
          Divider()
        ],
      )),
    );
  }
}
