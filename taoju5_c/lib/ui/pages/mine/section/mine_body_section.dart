/*
 * @Description: 个人中心
 * @Author: iamsmiling
 * @Date: 2021-04-14 09:40:34
 * @LastEditTime: 2021-04-18 00:27:01
 */
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:taoju5_bc/utils/common_kit.dart';
import 'package:taoju5_c/res/R.dart';
import 'package:taoju5_c/ui/pages/mine/mine_controller.dart';

class MineBodySection extends StatelessWidget {
  final List<MineKongoEntity> kongos;
  const MineBodySection({Key? key, required this.kongos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: R.dimen.dp20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: R.dimen.dp10),
            child: Row(
              children: [
                Text("我的订单", style: R.style.headline6),
                Spacer(),
                Text("查看全部", style: R.style.tileTip),
                Icon(R.icon.next)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: R.dimen.dp20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (MineKongoEntity item in kongos)
                  GestureDetector(
                    onTap: item.onTap,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Image.asset(item.icon),
                              Container(
                                margin: EdgeInsets.only(top: R.dimen.dp5),
                                child: Text(
                                  item.label,
                                  style: TextStyle(fontSize: R.dimen.sp12),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            child: Visibility(
                              visible: !CommonKit.isNullOrZero(item.count),
                              child: Container(
                                width: 16,
                                height: 16,
                                alignment: Alignment.center,
                                child: Text(
                                  "${item.count}",
                                  style: TextStyle(
                                      fontSize: 8, color: R.color.ffff5005),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: R.color.ffff5005),
                                ),
                              ),
                            ),
                            top: 0,
                            right: 0)
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
