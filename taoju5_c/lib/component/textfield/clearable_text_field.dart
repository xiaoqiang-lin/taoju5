import 'package:flutter/material.dart';

class ClearableTextField extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final InputDecoration decoration;
  final ValueChanged<String>? onChanged;
  final Widget suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final BoxConstraints constraints;
  const ClearableTextField(
      {Key? key,
      this.initialValue,
      this.controller,
      required this.decoration,
      this.onChanged,
      this.suffixIcon = const Icon(
        Icons.cancel,
        color: Color(0xFFD5D5D5),
      ),
      this.keyboardType,
      this.validator,
      this.onSubmitted,
      this.constraints = const BoxConstraints(maxHeight: 36)})
      : super(key: key);

  @override
  _ClearableTextFieldState createState() => _ClearableTextFieldState();
}

class _ClearableTextFieldState extends State<ClearableTextField> {
  late String? _value;

  late TextEditingController _controller;

  bool _clearable = false;

  void _onChanged(String text) {
    if (text.isEmpty) {
      _clearable = false;
    } else {
      _clearable = true;
    }
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
    setState(() {
      _value = text;
    });
  }

  void _onClear() {
    setState(() {
      _controller.clear();

      _clearable = false;
    });
  }

  @override
  void initState() {
    _value = widget.initialValue;

    _controller = widget.controller ?? TextEditingController(text: _value);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: widget.constraints,
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType,
        controller: _controller,
        onChanged: _onChanged,
        decoration: widget.decoration.copyWith(
            suffixIcon: Visibility(
          visible: _clearable,
          child: IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.zero,
            onPressed: _onClear,
            icon: widget.suffixIcon,
          ),
        )),
      ),
    );
  }
}
