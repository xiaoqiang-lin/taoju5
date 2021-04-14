import 'package:flutter/material.dart';

enum PrimaryButtonSize { normal, large, middle, small, mini, custom }

enum PrimaryButtonMode {
  elevatedButton,
  outlinedButton,
  textButton,
  materialButton
}

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  final PrimaryButtonSize size;
  final PrimaryButtonMode mode;
  final String text;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPressed;
  final double radius;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color fillColor;
  final BoxConstraints constraints;
  PrimaryButton(
      {Key key,
      this.size = PrimaryButtonSize.normal,
      this.mode = PrimaryButtonMode.elevatedButton,
      this.constraints,
      @required this.text,
      this.margin,
      this.padding,
      @required this.onPressed,
      this.radius = 25,
      this.backgroundColor,
      this.foregroundColor,
      this.textStyle,
      this.fillColor = const Color(0xFFF5F5F5)})
      : assert((size != PrimaryButtonSize.custom) || (constraints == null),
            "please provide a concrete size for the button"),
        assert(text != null, "please provide a text describing the button"),
        super(key: key) {
    _initSize();
    _initMargin();
    _initPadding();
    _initColor();
    _initButtonMode();
  }

  EdgeInsets _margin;
  EdgeInsets _padding;

  BoxConstraints _constraints;

  Widget _child;
  Color _color;

  _initSize() {
    _constraints = constraints;
    if (size == PrimaryButtonSize.large) {
      _constraints ??= BoxConstraints(minWidth: double.maxFinite);
    }

    if (mode == PrimaryButtonMode.materialButton) {
      // _constraints
    }
  }

  _initMargin() {
    _margin = margin;

    if (size == PrimaryButtonSize.large) {
      _margin ??= EdgeInsets.symmetric(horizontal: 56);
    }
  }

  _initPadding() {
    if (size == PrimaryButtonSize.large) {
      _padding = EdgeInsets.symmetric(vertical: 13);
    }
    if (size == PrimaryButtonSize.middle) {
      _padding = EdgeInsets.symmetric(horizontal: 40, vertical: 10);
    }
    _padding ??= padding ?? EdgeInsets.zero;
  }

  _initColor() {
    _color = backgroundColor ?? foregroundColor;
    if (mode == PrimaryButtonMode.materialButton) {
      _color ??= fillColor;
    }
  }

  _initButtonMode() {
    _child = Padding(
      padding: _padding,
      child: Text(text, style: textStyle),
    );

    switch (mode) {
      case PrimaryButtonMode.elevatedButton:
        {
          _child = ElevatedButton(onPressed: onPressed, child: _child);
          break;
        }
      case PrimaryButtonMode.outlinedButton:
        {
          _child = OutlinedButton(onPressed: onPressed, child: _child);
          break;
        }
      case PrimaryButtonMode.textButton:
        {
          _child = TextButton(onPressed: onPressed, child: _child);
          break;
        }
      case PrimaryButtonMode.materialButton:
        {
          _child = RawMaterialButton(
            fillColor: _color,
            elevation: 0,
            focusElevation: 0,
            highlightElevation: 0,
            hoverElevation: 0,
            disabledElevation: 0,
            onPressed: onPressed,
            child: _child,
            constraints: _constraints,
          );
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      constraints: _constraints,
      decoration: BoxDecoration(
          color: _color, borderRadius: BorderRadius.circular(radius)),
      child: _child,
    );
  }
}
