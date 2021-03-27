import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/widgets/bloc/x_sms_button.dart';
import 'package:taoju5/type_defs/type_defs.dart';

class XSmsTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FutureCallback fetchSMS;
  const XSmsTextField({Key key, this.onChanged, @required this.fetchSMS})
      : super(key: key);

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
        Positioned(
            right: 0,
            child: Container(
                height: 40,
                child: XSmsButton(
                  onFuture: fetchSMS,
                ))),
      ],
    );
  }
}
