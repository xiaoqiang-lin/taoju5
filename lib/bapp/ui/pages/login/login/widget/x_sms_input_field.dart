import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XSmsTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const XSmsTextField({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // padding: EdgeInsets.symmetric(vertical: BDimens.gap16),
          child: TextFormField(
            onChanged: onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(hintText: "请输入验证码"),
          ),
        ),
        // Positioned(right: 0, child: Container(height: 40, child: XSmsButton())),
      ],
    );
  }
}
