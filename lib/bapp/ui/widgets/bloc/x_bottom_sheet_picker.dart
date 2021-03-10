/*
 * @Description:底部弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-11 10:23:11
 * @LastEditTime: 2021-01-11 12:56:10
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetPicker extends StatelessWidget {
  final String title;
  final Function onConfirm;
  const BottomSheetPicker({
    Key key,
    this.title = "",
    this.onConfirm,
    @required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  // static double _kPickerItemHeight = 32.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      height: 360,
      // padding: const EdgeInsets.only(top: 6.0),
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            '取消',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            color: const Color(0xFF333333), fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: onConfirm,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            '确定',
                            style: TextStyle(
                                color: const Color(0xFF2196f3), fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: child)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
