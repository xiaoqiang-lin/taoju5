import 'package:flutter/material.dart';

class FutureErrorView extends StatelessWidget {
  const FutureErrorView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("网络请求错误"),
    );
  }
}
