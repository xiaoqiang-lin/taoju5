/*
 * @Description: //TODO
 * @Author: iamsmiling
 * @Date: 2021-05-13 17:51:31
 * @LastEditTime: 2021-05-17 17:08:22
 */
// /*
//  * @Description: //TODO
//  * @Author: iamsmiling
//  * @Date: 2021-05-13 17:51:31
//  * @LastEditTime: 2021-05-14 09:14:20
//  */
// // /*
// //  * @Description: 订单商品卡片
// //  * @Author: iamsmiling
// //  * @Date: 2021-05-13 17:51:31
// //  * @LastEditTime: 2021-05-13 17:52:05
// //  */
// import 'package:flutter/widgets.dart';
// import 'package:taoju5_c/component/image/chimera_image.dart';
// import 'package:taoju5_c/domain/entity/order/order_entity.dart';
// import 'package:taoju5_c/res/R.dart';

// class OrderProductCard extends StatelessWidget {
//   final OrderProductEntity product;
//   const OrderProductCard({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(right: R.dimen.dp6),
//                 child: ChimeraImage(
//                   imageUrl: product.image,
//                   width: R.dimen.dp85,
//                   height: R.dimen.dp85,
//                 ),
//               ),
//               Expanded(
//                   child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text("${product.name}"),
//                       Text("${product.status}")
//                     ],
//                   ),
//                   Text("${product.description}")
//                 ],
//               ))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
