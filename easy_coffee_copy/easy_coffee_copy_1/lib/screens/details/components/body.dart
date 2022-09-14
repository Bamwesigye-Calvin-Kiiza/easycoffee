// import 'package:easy_coffee_copy_1/models/products.dart';
// import 'package:flutter/material.dart';

// class Body2 extends StatelessWidget {
//   final Product product;
//   const Body2({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     //provides total height and width
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(children: [
//         SizedBox(
//           height: size.height,
//           child: Stack(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: size.height*0.3),
//                 height: 500,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20))
//                 ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('@product entry words'),
//                       Text(product.title,
//                       style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
//                       ),
//                       Row(
//                         children: [
//                           RichText(text: TextSpan(
//                             children: [
//                               TextSpan(text: '#####\n'),
//                               TextSpan(text: '@@@@@@@@',
//                               style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white,fontWeight: FontWeight.bold))
//                             ]
//                           )),
//                           SizedBox(width: 20),
//                           Expanded(child: Image.asset(product.image))
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }
