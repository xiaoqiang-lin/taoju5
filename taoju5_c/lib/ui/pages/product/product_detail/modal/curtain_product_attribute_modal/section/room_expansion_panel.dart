/*
 * @Description: 空间属性
 * @Author: iamsmiling
 * @Date: 2021-05-11 10:12:47
 * @LastEditTime: 2021-05-13 14:04:44
 */
import 'package:flutter/material.dart';
import 'package:taoju5_c/component/button/primary_button.dart';
import 'package:taoju5_c/component/expansion_tile/attribute_expansion_tile.dart';
import 'package:taoju5_c/domain/entity/window/window_room_entity.dart';
import 'package:taoju5_c/res/R.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shake_animation_widget/shake_animation_widget.dart';

class RoomExpansionPanel extends StatelessWidget {
  final WindowRoomEntity room;

  final Function(WindowRoomOptionEntity room) onRoomChanged;
  const RoomExpansionPanel({
    Key? key,
    required this.room,
    required this.onRoomChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ExpansionTile(title: Text("空间"));
    // return AttributeExpansionTile(
    //   title: Text("空间"),
    //   backgroundColor: R.color.transparent,
    //   trailingLabel: Text(
    //     "1212",
    //     style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
    //   ),
    //   children: [
    //     Text("测试"),
    //     Container(
    //       width: 200,
    //       height: 200,
    //       color: Colors.red,
    //     ),
    //     Text("1213")
    //   ],
    // );
    return AttributeExpansionTile(
      childrenPadding: EdgeInsets.zero,
      tilePadding: EdgeInsets.symmetric(horizontal: R.dimen.dp20, vertical: 0),
      title: ShakeAnimationWidget(
        isForward: false,
        shakeAnimationController: room.shakeController,
        shakeCount: 2,
        shakeAnimationType: ShakeAnimationType.LeftRightShake,
        shakeRange: 0.2,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${room.label}",
              style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
            ),
            Visibility(
              visible: room.value.isEmpty,
              child: Container(
                margin: EdgeInsets.only(left: R.dimen.dp6),
                child: Text(
                  room.message,
                  style:
                      TextStyle(fontSize: R.dimen.sp9, color: R.color.ffff5005),
                ),
              ),
            ),
          ],
        ),
      ),
      trailingLabel: Text(
        "${room.value}",
        style: TextStyle(fontSize: R.dimen.sp12, color: R.color.ff333333),
      ),

      // title: Row(
      //   // mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Text("${room.label}"),
      //     Visibility(
      //         visible: GetUtils.isNullOrBlank(room.value)!,
      //         child: Container(
      //           margin: EdgeInsets.only(left: R.dimen.dp6),
      //           child: Text(
      //             "请选择空间",
      //             style:
      //                 TextStyle(fontSize: R.dimen.sp9, color: R.color.ffff5005),
      //           ),
      //         ))
      //   ],
      // ),
      collapsedBackgroundColor: R.color.transparent,
      backgroundColor: R.color.transparent,
      expandedAlignment: Alignment.topCenter,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Wrap(
          runSpacing: -R.dimen.dp7,
          spacing: R.dimen.dp10,
          children: [
            for (WindowRoomOptionEntity item in room.options)
              PrimaryButton(
                text: item.name,
                textStyle: TextStyle(fontSize: R.dimen.sp12),
                onPressed: () => onRoomChanged(item),
                padding: EdgeInsets.symmetric(horizontal: R.dimen.dp12),
                radius: R.dimen.sp4,
                mode: item.selected
                    ? PrimaryButtonMode.elevatedButton
                    : PrimaryButtonMode.outlinedButton,
              )
          ],
        ),
      ],
    );
  }
}
