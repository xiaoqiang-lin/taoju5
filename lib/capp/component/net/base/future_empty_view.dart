import 'package:flutter/material.dart';

class FutureEmptyView extends StatelessWidget {
  const FutureEmptyView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("暂无数据"),
    );
  }
}
