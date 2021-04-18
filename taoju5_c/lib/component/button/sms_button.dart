/*
 * @Description: 验证码按钮
 * @Author: iamsmiling
 * @Date: 2021-04-17 18:16:40
 * @LastEditTime: 2021-04-18 08:33:05
 */
import 'dart:async';

import 'package:flutter/material.dart';

class SmsButton extends StatefulWidget {
  final Function onPressed;
  const SmsButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _SmsButtonState createState() => _SmsButtonState();
}

class _SmsButtonState extends State<SmsButton> {
  int _initialCount = 60;
  int _maxCount = 60;

  late StreamController<int> _streamController;

  late Timer _timer;

  @override
  void initState() {
    _streamController = StreamController<int>();
    super.initState();
  }

  void _countDown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_maxCount <= 0) {
        timer.cancel();
        _maxCount = _initialCount;
      } else {
        _maxCount--;
      }
      _streamController.add(_maxCount);
    });
  }

  void _onPressed() {
    widget.onPressed();
    _countDown();
  }

  @override
  void dispose() {
    _streamController.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: _initialCount,
        stream: _streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          bool enabled = snapshot.data == _initialCount;
          return IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              onPressed: enabled ? _onPressed : () {},
              constraints: BoxConstraints(minWidth: 72, minHeight: 36),
              icon: Text(
                enabled ? "获取验证码" : "${snapshot.data}s",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFEE9B5F)),
                textAlign: TextAlign.right,
              ));
        });
  }
}
