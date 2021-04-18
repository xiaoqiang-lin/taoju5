// import 'package:flutter/material.dart';

// //4、新建需要使用动画的控件AnimationHeart，集成AnimatedWidget类
// class AnimationHeart extends AnimatedWidget {
// //5、设置AnimationHeart的构造参数，使用该控件时需要传入的参数
//   final List animations; //需要传入的动画list，list中为需要执行的动画，例如数值和颜色的变化
//   final AnimationController controller; //需要传入的控制器
//   AnimationHeart({this.animations, this.controller})
//       : super(listenable: controller);
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.favorite),
//       iconSize: animations[0].value, //使用动画list中第一个动画的值，也就是数值
//       color: animations[1].value, //使用动画list中第二个动画的值，也就是颜色
//       onPressed: () {
//         switch (controller.status) {
//           //根据控制器中的状态来switch动作
//           case AnimationStatus.completed: //状态为完成，点击就反向执行动画
//             controller.reverse();
//             break;
//           default:
//             controller.forward(); //默认是顺序执行
//         }
//       },
//     );
//   }
// }

// class LikeAnimationWidget extends StatefulWidget {
//   @override
//   _LikeAnimationWidgetState createState() {
//     return _LikeAnimationWidgetState();
//   }
// }

// class _LikeAnimationWidgetState extends State<LikeAnimationWidget>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   CurvedAnimation curve;
//   Animation animationSize;
//   double size = 25.0;
//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 150));
//     curve = CurvedAnimation(parent: controller, curve: Curves.easeInCirc);
//     animationSize = Tween(
//       begin: 40.0,
//       end: 35.0,
//     ).animate(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: LikeAnimation(
//         controller: controller,
//         list: [
//           animationSize,
//         ],
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class LikeAnimation extends AnimatedWidget implements StatefulWidget {
//   AnimationController controller;
//   List<Animation> list;
//   bool color = false;
//   LikeAnimation({this.controller, this.list}) : super(listenable: controller);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Icon(
//         Icons.favorite,
//         size: list[0].value,
//         color: color ? Colors.red : Colors.grey,
//       ),
//       onTapDown: (TapDownDetails _) {
//         controller.forward();
//       },
//       onTapUp: (TapUpDetails _) {
//         if (!color) {
//           new Future.delayed(Duration(milliseconds: 100), () {
//             controller.reverse();
//             color = true;
//           });
//           return;
//         }
//         new Future.delayed(Duration(milliseconds: 100), () {
//           controller.reverse();
//           color = false;
//         });
//         return;
//       },
//     );
//   }
// }
