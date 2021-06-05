/*
 * @Description: 下拉
 * @Author: iamsmiling
 * @Date: 2021-05-25 15:20:56
 * @LastEditTime: 2021-05-27 17:02:35
 */
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

class AnimatedMask extends AnimatedWidget {
  /// Creates a widget that blocks user interaction.
  const AnimatedMask({
    Key? key,
    required Animation<Color> color,
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
  final String? semanticsLabel;

  /// Whether the modal barrier semantics are included in the semantics tree.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.semanticsDismissible], which controls this property for
  ///    the [Mask] built by [ModalRoute] pages.
  final bool? barrierSemanticsDismissible;

  @override
  Widget build(BuildContext context) {
    return Mask(
      color: color.value,
      dismissible: dismissible,
      semanticsLabel: semanticsLabel,
      barrierSemanticsDismissible: barrierSemanticsDismissible,
    );
  }
}

class Mask extends StatelessWidget {
  /// Creates a widget that blocks user interaction.
  const Mask({
    Key? key,
    this.color,
    this.dismissible = true,
    this.semanticsLabel,
    this.barrierSemanticsDismissible,
  }) : super(key: key);

  /// If non-null, fill the barrier with this color.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierColor], which controls this property for the
  ///    [Mask] built by [ModalRoute] pages.
  final Color? color;

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
  final bool? barrierSemanticsDismissible;

  /// Semantics label used for the barrier if it is [dismissible].
  ///
  /// The semantics label is read out by accessibility tools (e.g. TalkBack
  /// on Android and VoiceOver on iOS) when the barrier is focused.
  ///
  /// See also:
  ///
  ///  * [ModalRoute.barrierLabel], which controls this property for the
  ///    [Mask] built by [ModalRoute] pages.
  final String? semanticsLabel;

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
    Key? key,
    required this.child,
    required this.onDismiss,
  }) : super(key: key);

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
  _AnyTapGestureRecognizer({Object? debugOwner})
      : super(debugOwner: debugOwner);

  VoidCallback? onAnyTapUp;

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
      {required PointerDownEvent down,
      PointerCancelEvent? cancel,
      required String reason}) {}

  @override
  void handleTapDown({required PointerDownEvent down}) {}

  @override
  void handleTapUp(
      {required PointerDownEvent down, required PointerUpEvent up}) {}
}

class _MaskSemanticsDelegate extends SemanticsGestureDelegate {
  const _MaskSemanticsDelegate({required this.onDismiss});

  final VoidCallback onDismiss;

  @override
  void assignSemantics(RenderSemanticsGestureHandler renderObject) {
    renderObject.onTap = onDismiss;
  }
}

class _AnyTapGestureRecognizerFactory
    extends GestureRecognizerFactory<_AnyTapGestureRecognizer> {
  const _AnyTapGestureRecognizerFactory({required this.onAnyTapUp});

  final VoidCallback onAnyTapUp;

  @override
  _AnyTapGestureRecognizer constructor() => _AnyTapGestureRecognizer();

  @override
  void initializer(_AnyTapGestureRecognizer instance) {
    instance.onAnyTapUp = onAnyTapUp;
  }
}

Future<T?> showModalPopdown<T>(BuildContext context,
    {required WidgetBuilder builder,
    double offset = 0,
    required RouteSettings settings}) {
  return Navigator.of(context).push<T?>(
      PopdownRoute(builder: builder, offset: offset, settings: settings));
}

class PopdownRoute<T> extends TransitionRoute<T> {
  final bool barrierDismissible;
  final bool maintainState;
  final Color? barrierColor;
  final bool? semanticsDismissible;
  final Duration animationDuration;
  final WidgetBuilder builder;
  final double offset;
  final RouteSettings settings;
  late OverlayEntry modalbarrier;
  late OverlayEntry modalScope;

  Color _kTransparent = Color(0x00000000);

  PopdownRoute(
      {this.barrierDismissible = true,
      this.maintainState = true,
      this.barrierColor = Colors.black54,
      this.semanticsDismissible,
      required this.settings,
      this.animationDuration = const Duration(milliseconds: 246),
      required this.builder,
      this.offset = 0});
  bool get offstage => _offstage;
  Curve get barrierCurve => Curves.ease;

  bool _offstage = false;
  late Animation<double> sizeFactor;

  Widget _buildMask(BuildContext context) {
    late Widget barrier;

    if (barrierColor != null && !offstage) {
      // changedInternalState is called if barrierColor or offstage updates
      assert(barrierColor != _kTransparent);
      final Animation<Color> color = animation!.drive(
        ColorTween(
          begin: _kTransparent,
          end:
              barrierColor, // changedInternalState is called if barrierColor updates
        ).chain(CurveTween(
            curve:
                barrierCurve)), // changedInternalState is called if barrierCurve updates
      ) as Animation<Color>;
      sizeFactor = animation!.drive(Tween(begin: 0.0, end: 1.0));
      barrier = AnimatedMask(
        color: color,

        dismissible:
            barrierDismissible, // changedInternalState is called if barrierDismissible updates
        // changedInternalState is called if barrierLabel updates
        barrierSemanticsDismissible: semanticsDismissible,
      );
    }

    barrier = IgnorePointer(
      ignoring: animation!.status ==
              AnimationStatus
                  .reverse || // changedInternalState is called when animation.status updates
          animation!.status ==
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
      child: AnimationPopdownModal(
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
class AnimationPopdownModal extends StatefulWidget {
  final WidgetBuilder builder;
  final Animation<double> animation;

  AnimationPopdownModal({
    Key? key,
    required this.builder,
    required this.animation,
  }) : super(key: key);

  @override
  AnimationPopdownModalState createState() => AnimationPopdownModalState();
}

class AnimationPopdownModalState extends State<AnimationPopdownModal>
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
