// /*
//  * @Description: 下拉按钮
//  * @Author: iamsmiling
//  * @Date: 2021-05-20 11:02:19
//  * @LastEditTime: 2021-05-20 11:11:10
//  */
// import 'package:flutter/material.dart';

// import 'drop_select_controller.dart';
// import 'dropdown_menu.dart';

// class DropdownButton extends DropSelectWidget {
//   final Future Function() onPressed;
//   DropdownButton(
//       {Key? key,
//       required this.onPressed,
//       required DropSelectController controller})
//       : super(key: key, controller: controller);

//   @override
//   DropSelectState<DropSelectWidget> createState() {
//     return new _DropdownButtonState();
//   }
// }

// class _DropdownButtonState extends DropSelectState<DropdownButton>
//     with SingleTickerProviderStateMixin {
//   late Animation<double> _iconTurns;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);
//     Animatable<double> _easeInTween = CurveTween(curve: Curves.linear);
//     _controller =
//         AnimationController(duration: Duration(milliseconds: 300), vsync: this);
//     _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
//     super.initState();
//   }

//   _onTap() {
//     widget.onPressed().whenComplete(() {
//       _controller.reverse();
//     });
//     if (_controller.status == AnimationStatus.dismissed) {
//       _controller
//         ..reset()
//         ..forward().then<void>((void value) {
//           // if (widget.onTap != null)
//           //   widget?.onTap().whenComplete(() {
//           //     _controller.reverse();
//           //   });
//         });
//     } else {
//       _controller.reverse();
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _onTap,
//       child: RotationTransition(
//         turns: _iconTurns,
//         child: Image.asset("resources/images/dropdown.png"),
//       ),
//     );
//   }

//   @override
//   void onEvent(DropSelectEvent event) {
//     switch (event) {
//       case DropSelectEvent.SELECT:
//         {
//           // setState(() {
//           //   _activeIndex = null;
//           //   String label = widget.showTitle(controller.data, _activeIndex);
//           //   _titles[controller.menuIndex] = label;
//           // });
//         }
//         break;
//       case DropSelectEvent.HIDE:
//         {
//           // if (_activeIndex == null) return;
//           // setState(() {
//           //   _activeIndex = null;
//           // });
//         }
//         break;
//       case DropSelectEvent.ACTIVE:
//         {
//           // if (_activeIndex == controller.menuIndex) return;
//           // setState(() {
//           //   _activeIndex = controller.menuIndex;
//           // });
//         }
//         break;
//     }
//   }
// }
