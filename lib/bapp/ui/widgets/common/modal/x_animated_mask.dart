/*
 * @Description: 遮罩层
 * @Author: iamsmiling
 * @Date: 2020-12-25 15:06:58
 * @LastEditTime: 2020-12-25 15:07:14
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class XAnimatedMask extends AnimatedWidget {
  /// Creates a widget that blocks user interaction.
  const XAnimatedMask({
    Key key,
    Animation<Color> color,
    this.dismissible = true,
    this.semanticsLabel,
    this.barrierSemanticsDismissible,
  }) : super(key: key, listenable: color);

  /// If non-null, fill the barrier with this color.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierColor], which controls this property for the
  ///    [AnimatedMask] built by [ModalRoute] pages.
  Animation<Color> get color => listenable as Animation<Color>;

  /// Whether touching the barrier will pop the current route off the [Navigator].
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierDismissible], which controls this property for the
  ///    [AnimatedMask] built by [ModalRoute] pages.
  final bool dismissible;

  /// Semantics label used for the barrier if it is [dismissible].
  ///
  /// The semantics label is read out by accessibility tools (e.g. TalkBack
  /// on Android and VoiceOver on iOS) when the barrier is focused.
  /// See also:
  ///
  ///  * [ModalRoute.barrierLabel], which controls this property for the
  ///    [Mask] built by [ModalRoute] pages.
  final String semanticsLabel;

  /// Whether the modal barrier semantics are included in the semantics tree.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.semanticsDismissible], which controls this property for
  ///    the [Mask] built by [ModalRoute] pages.
  final bool barrierSemanticsDismissible;

  @override
  Widget build(BuildContext context) {
    return _XMask(
      color: color?.value,
      dismissible: dismissible,
      semanticsLabel: semanticsLabel,
      barrierSemanticsDismissible: barrierSemanticsDismissible,
    );
  }
}

class _XMask extends StatelessWidget {
  /// Creates a widget that blocks user interaction.
  const _XMask({
    Key key,
    this.color,
    this.dismissible = true,
    this.semanticsLabel,
    this.barrierSemanticsDismissible = true,
  }) : super(key: key);

  /// If non-null, fill the barrier with this color.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierColor], which controls this property for the
  ///    [Mask] built by [ModalRoute] pages.
  final Color color;

  /// Whether touching the barrier will pop the current route off the [Navigator].
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierDismissible], which controls this property for the
  ///    [Mask] built by [ModalRoute] pages.
  final bool dismissible;

  /// Whether the modal barrier semantics are included in the semantics tree.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.semanticsDismissible], which controls this property for
  ///    the [Mask] built by [ModalRoute] pages.
  final bool barrierSemanticsDismissible;

  /// Semantics label used for the barrier if it is [dismissible].
  ///
  /// The semantics label is read out by accessibility tools (e.g. TalkBack
  /// on Android and VoiceOver on iOS) when the barrier is focused.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierLabel], which controls this property for the
  ///    [Mask] built by [ModalRoute] pages.
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    assert(!dismissible ||
        semanticsLabel == null ||
        debugCheckHasDirectionality(context));
    bool platformSupportsDismissingBarrier;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        platformSupportsDismissingBarrier = false;
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        platformSupportsDismissingBarrier = true;
        break;
    }
    assert(platformSupportsDismissingBarrier != null);
    final bool semanticsDismissible =
        dismissible && platformSupportsDismissingBarrier;
    // ignore: non_constant_identifier_names
    final bool MaskSemanticsDismissible =
        barrierSemanticsDismissible ?? semanticsDismissible;
    return BlockSemantics(
      child: ExcludeSemantics(
        // On Android, the back button is used to dismiss a modal. On iOS, some
        // modal barriers are not dismissible in accessibility mode.
        excluding: !semanticsDismissible || !MaskSemanticsDismissible,
        child: _MaskGestureDetector(
          onDismiss: () {
            if (dismissible) Navigator.maybePop(context);
          },
          child: Semantics(
            label: semanticsDismissible ? semanticsLabel : null,
            textDirection: semanticsDismissible && semanticsLabel != null
                ? Directionality.of(context)
                : null,
            child: MouseRegion(
              cursor: SystemMouseCursors.basic,
              opaque: true,
              child: ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: color == null
                    ? null
                    : GestureDetector(
                        onTap: () => Navigator.maybePop(context),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// A GestureDetector used by Mask. It only has one callback,
// [onAnyTapDown], which recognizes tap down unconditionally.
class _MaskGestureDetector extends StatelessWidget {
  const _MaskGestureDetector({
    Key key,
    @required this.child,
    @required this.onDismiss,
  })  : assert(child != null),
        assert(onDismiss != null),
        super(key: key);

  /// The widget below this widget in the tree.
  /// See [RawGestureDetector.child].
  final Widget child;

  /// Immediately called when an event that should dismiss the modal barrier
  /// has happened.
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final Map<Type, GestureRecognizerFactory> gestures =
        <Type, GestureRecognizerFactory>{
      _AnyTapGestureRecognizer:
          _AnyTapGestureRecognizerFactory(onAnyTapUp: onDismiss),
    };

    return RawGestureDetector(
      gestures: gestures,
      behavior: HitTestBehavior.opaque,
      semantics: _MaskSemanticsDelegate(onDismiss: onDismiss),
      child: child,
    );
  }
}

class _AnyTapGestureRecognizer extends BaseTapGestureRecognizer {
  _AnyTapGestureRecognizer({Object debugOwner}) : super(debugOwner: debugOwner);

  VoidCallback onAnyTapUp;

  @protected
  @override
  bool isPointerAllowed(PointerDownEvent event) {
    if (onAnyTapUp == null) return false;
    return super.isPointerAllowed(event);
  }

  @override
  String get debugDescription => 'any tap';

  @override
  void handleTapCancel(
      {PointerDownEvent down, PointerCancelEvent cancel, String reason}) {}

  @override
  void handleTapDown({PointerDownEvent down}) {}

  @override
  void handleTapUp({PointerDownEvent down, PointerUpEvent up}) {}
}

class _MaskSemanticsDelegate extends SemanticsGestureDelegate {
  const _MaskSemanticsDelegate({this.onDismiss});

  final VoidCallback onDismiss;

  @override
  void assignSemantics(RenderSemanticsGestureHandler renderObject) {
    renderObject.onTap = onDismiss;
  }
}

class _AnyTapGestureRecognizerFactory
    extends GestureRecognizerFactory<_AnyTapGestureRecognizer> {
  const _AnyTapGestureRecognizerFactory({this.onAnyTapUp});

  final VoidCallback onAnyTapUp;

  @override
  _AnyTapGestureRecognizer constructor() => _AnyTapGestureRecognizer();

  @override
  void initializer(_AnyTapGestureRecognizer instance) {
    instance.onAnyTapUp = onAnyTapUp;
  }
}
