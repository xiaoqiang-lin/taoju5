/*
 * @Description: 搜索
 * @Author: iamsmiling
 * @Date: 2020-12-25 13:32:49
 * @LastEditTime: 2021-04-20 12:42:18
 */

import 'package:flutter/material.dart';

class XSearchBar extends StatefulWidget implements PreferredSizeWidget {
  XSearchBar(
      {Key key,
      this.autoFocus = false,
      this.focusNode,
      this.controller,
      this.value,
      this.leading,
      this.suffix,
      this.actions = const [],
      this.hintText,
      this.onTap,
      this.onClear,
      this.onCancel,
      this.onChanged,
      this.onSearch,
      this.bottom,
      this.readOnly = false,
      this.preferredSize = const Size.fromHeight(108)})
      : super(key: key);
  final bool autoFocus;
  final FocusNode focusNode;
  final TextEditingController controller;

  // 默认值
  final String value;

  final bool readOnly;

  // 最前面的组件
  final Widget leading;

  // 搜索框后缀组件
  final Widget suffix;
  final List<Widget> actions;

  // 提示文字
  final String hintText;

  // 输入框点击
  final VoidCallback onTap;

  // 单独清除输入框内容
  final VoidCallback onClear;

  // 清除输入框内容并取消输入
  final VoidCallback onCancel;

  // 输入框内容改变
  final ValueChanged<String> onChanged;

  // 点击键盘搜索
  final ValueChanged<String> onSearch;

  final PreferredSizeWidget bottom;

  @override
  _XSearchBarState createState() => _XSearchBarState();

  @override
  final Size preferredSize;
}

class _XSearchBarState extends State<XSearchBar> {
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.value != null) _controller.text = widget.value;
    super.initState();
  }

  // 清除输入框内容
  void _onClearInput() {
    setState(() {
      _controller.clear();
    });
    if (widget.onClear != null) widget.onClear();
  }

  // 取消输入框编辑
  void _onCancelInput() {
    setState(() {
      _controller.clear();
      _focusNode.unfocus();
    });
    if (widget.onCancel != null) widget.onCancel();
  }

  void _onInputChanged(String value) {
    setState(() {});
    if (widget.onChanged != null) widget.onChanged(value);
  }

  void dispose() {
    if (FocusManager.instance.primaryFocus.hasFocus) {
      FocusManager.instance.primaryFocus.unfocus();
    }

    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  Widget _suffix() {
    if (_controller.text.isNotEmpty) {
      return GestureDetector(
        onTap: _onClearInput,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.cancel,
            size: 22,
            color: Color(0xFF999999),
          ),
        ),
      );
    }
    return widget.suffix ?? SizedBox();
  }

  List<Widget> _actions() {
    List<Widget> list = [];
    if (_controller.text.isNotEmpty) {
      list.add(GestureDetector(
        onTap: _onCancelInput,
        child: Container(
          width: 48,
          alignment: Alignment.center,
          child: Text(
            '取消',
            style: TextStyle(color: Color(0xFF666666), fontSize: 15),
          ),
        ),
      ));
    } else if (widget.actions.isNotEmpty) {
      list.addAll(widget.actions);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    double left = 0;
    double right = 0;
    if (!canPop && !hasDrawer && widget.leading == null) left = 15;
    if (_controller.text.isEmpty && widget.actions.isEmpty) right = 15;
    return AppBar(
      titleSpacing: 0,
      leading: widget.leading,
      bottom: widget.bottom ??
          PreferredSize(child: SizedBox.shrink(), preferredSize: Size(0, 0)),
      title: Container(
        margin: EdgeInsets.only(right: right, left: left),
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.search,
                size: 22,
                color: Color(0xFF999999),
              ),
            ),
            Expanded(
              child: TextField(
                key: ValueKey(widget.value),
                autofocus: widget.autoFocus,
                focusNode: _focusNode,
                controller: _controller,
                readOnly: widget.readOnly,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  hintText: widget.hintText ?? '请输入关键字',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF999999),
                  ),
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF333333),
                  height: 1.3,
                ),
                textInputAction: TextInputAction.search,
                onTap: widget.onTap,
                onChanged: _onInputChanged,
                onSubmitted: widget.onSearch,
              ),
            ),
            _suffix(),
          ],
        ),
      ),
      actions: _actions(),
    );
  }
}
