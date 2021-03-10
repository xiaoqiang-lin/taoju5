import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';

class XCopyButton extends StatelessWidget {
  final String content;
  final String successTip;
  const XCopyButton({Key key, @required this.content, this.successTip = "复制成功"})
      : super(key: key);

  void _copy() {
    Clipboard.setData(ClipboardData(text: content));
    EasyLoading.showInfo(successTip);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copy,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFC5C5C5)),
            borderRadius: BorderRadius.circular(3.2)),
        child: Text(
          "复制",
          style: TextStyle(fontSize: BDimens.sp20, color: BColors.tipColor),
        ),
      ),
    );
  }
}
