/*
 * @Description:向下弹出
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:07:49
 * @LastEditTime: 2020-12-25 15:09:53
 */

import 'package:flutter/material.dart';

import 'x_animated_mask.dart';

Future<T> showXModalPopdown<T>(BuildContext context,
    {@required WidgetBuilder builder, double offset = 0}) {
  return Navigator.of(context)
      .push(XPopdownRoute(builder: builder, offset: offset));
}

class XPopdownRoute<T> extends TransitionRoute<T> {
  final bool barrierDismissible;
  final bool maintainState;
  final Color barrierColor;
  final bool semanticsDismissible;
  final Duration animationDuration;
  final WidgetBuilder builder;
  final double offset;

  OverlayEntry modalbarrier;
  OverlayEntry modalScope;

  Color _kTransparent = Color(0x00000000);

  XPopdownRoute(
      {this.barrierDismissible = true,
      this.maintainState = true,
      this.barrierColor = Colors.black54,
      this.semanticsDismissible,
      this.animationDuration = const Duration(milliseconds: 246),
      @required this.builder,
      this.offset = 0});
  bool get offstage => _offstage;
  Curve get barrierCurve => Curves.ease;

  bool _offstage = false;
  Animation<double> sizeFactor;

  Widget _buildMask(BuildContext context) {
    Widget barrier;

    if (barrierColor != null && !offstage) {
      // changedInternalState is called if barrierColor or offstage updates
      assert(barrierColor != _kTransparent);
      final Animation<Color> color = animation.drive(
        ColorTween(
          begin: _kTransparent,
          end:
              barrierColor, // changedInternalState is called if barrierColor updates
        ).chain(CurveTween(
            curve:
                barrierCurve)), // changedInternalState is called if barrierCurve updates
      );
      sizeFactor = animation.drive(Tween(begin: 0.0, end: 1.0));
      barrier = XAnimatedMask(
        color: color,

        dismissible:
            barrierDismissible, // changedInternalState is called if barrierDismissible updates
        // changedInternalState is called if barrierLabel updates
        barrierSemanticsDismissible: semanticsDismissible,
      );
    }

    barrier = IgnorePointer(
      ignoring: animation.status ==
              AnimationStatus
                  .reverse || // changedInternalState is called when animation.status updates
          animation.status ==
              AnimationStatus
                  .dismissed, // dismissed is possible when doing a manual pop gesture
      child: barrier,
    );

    return Positioned.fill(
      child: barrier,
      top: offset,
    );
  }

  Widget _buildModalScope(BuildContext context) {
    return Positioned(
      child: XAnimationPopdownModal(
        animation: sizeFactor,
        builder: builder,
      ),
      top: offset,
    );
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() sync* {
    yield modalbarrier = OverlayEntry(builder: _buildMask);
    yield modalScope =
        OverlayEntry(builder: _buildModalScope, maintainState: maintainState);
  }

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => animationDuration;
}

///弹出层 方向向下
class XAnimationPopdownModal extends StatefulWidget {
  final WidgetBuilder builder;
  final Animation<double> animation;

  XAnimationPopdownModal({
    Key key,
    @required this.builder,
    @required this.animation,
  }) : super(key: key);

  @override
  XAnimationPopdownModalState createState() => XAnimationPopdownModalState();
}

class XAnimationPopdownModalState extends State<XAnimationPopdownModal>
    with SingleTickerProviderStateMixin {
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: size.height,
      width: size.width,
      child: SizeTransition(
        sizeFactor: widget.animation,
        child: Builder(
          builder: widget.builder,
        ),
      ),
    );
  }
}
