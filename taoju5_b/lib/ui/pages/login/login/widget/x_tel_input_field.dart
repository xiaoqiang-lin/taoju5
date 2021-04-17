import 'package:flutter/material.dart';
import 'package:taoju5_b/res/b_colors.dart';
import 'package:taoju5_b/res/b_dimens.dart';

class XTelInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const XTelInputField({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 48,
            margin: EdgeInsets.only(right: BDimens.gap16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "+86",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: BDimens.sp32, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  width: 32,
                  height: .96,
                  color: BColors.dividerColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(hintText: "请输入手机号码"),
            ),
          ),
        ],
      ),
    );
  }
}
