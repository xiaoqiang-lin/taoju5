/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2021-04-17 21:31:19
 * @LastEditTime: 2021-06-03 09:12:38
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';

class MineFooterSection extends StatelessWidget {
  final List<MineTileEntity> tiles;
  const MineFooterSection({Key? key, required this.tiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: R.dimen.dp5),
            child: Text(
              "其他",
              style: R.style.headline6,
            ),
          ),
          for (MineTileEntity item in tiles)
            GestureDetector(
              onTap: item.onTap,
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: R.dimen.dp16),
                    child: Row(
                      children: [
                        Image.asset(item.icon),
                        Container(
                          margin: EdgeInsets.only(left: R.dimen.dp5),
                          child: Text(
                            item.label,
                            style: TextStyle(fontSize: R.dimen.sp12),
                          ),
                        ),
                        Spacer(),
                        Image.asset(R.image.next)
                      ],
                    ),
                  ),
                  Visibility(
                      visible: item != tiles.last,
                      child: Divider(indent: 0, endIndent: 0))
                ],
              ),
            )
        ],
      ),
    );
  }
}
