/*
 * @Description: 计数器
 * @Author: iamsmiling
 * @Date: 2021-01-04 14:13:51
 * @LastEditTime: 2021-01-05 09:04:11
 */

import 'package:flutter/material.dart';
import 'package:taoju5/bapp/interface/i_xcountalbe.dart';

class XStepCounter extends StatefulWidget {
  final IXCountable target;
  const XStepCounter({Key key, @required this.target}) : super(key: key);

  @override
  _XStepCounterState createState() => _XStepCounterState();
}

class _XStepCounterState extends State<XStepCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.target.count -= 1;
              });
            },
            child: Text("减"),
          ),
          Flexible(
              key: ValueKey(widget.target.count),
              child: TextFormField(
                initialValue: "${widget.target?.count}",
                keyboardType: TextInputType.number,
                onChanged: (String text) {
                  // widget.target.count = int.tryParse(text);
                },
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.target.count += 1;
              });
            },
            child: Text("加"),
          ),
        ],
      ),
    );
  }
}
