import 'package:flutter/material.dart';

class UserProtocolSkeleton extends StatelessWidget {
  const UserProtocolSkeleton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户协议与隐私政策"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.8),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            minHeight: 2,
            valueColor:
                AlwaysStoppedAnimation(Colors.green[300].withAlpha(125)),
          ),
        ),
      ),
    );
  }
}
