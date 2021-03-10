/*
 * @Description: 用户协议
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:32:00
 * @LastEditTime: 2021-01-09 20:50:10
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserProtocolPage extends StatefulWidget {
  const UserProtocolPage({Key key}) : super(key: key);

  @override
  _UserProtocolPageState createState() => _UserProtocolPageState();
}

class _UserProtocolPageState extends State<UserProtocolPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户协议"),
      ),
      body: WebView(
        initialUrl: 'https://flutter.cn',
      ),
    );
  }
}
