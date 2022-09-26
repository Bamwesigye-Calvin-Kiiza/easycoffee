import 'package:easy_coffee_copy_1/models/products.dart';
import 'package:flutter/material.dart';
import 'body2.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    //provides total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                child: Image.asset(product.image),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.12),
                height: 1500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    //curving at the top
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text(product.title,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                        ])),
                      ],
                    ) //headlining word
                  ],
                ),
              )
            ],
          ),
        ),
        DetailContentMenu()
      ]),
    );
  }
}







//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(product.image),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   (product.description),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   (product.description),
//                   textAlign: TextAlign.justify,
//                   style: TextStyle(fontSize: 22.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(children: [
//         SizedBox(
//           height: size.height,
//           child: Stack(
//             children: [
//               Container(
//                 child: Image.asset(product.image),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: size.height * 0.12),
//                 height: 1500,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     //curving at the top
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10))),

//                 //contents of the white background
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(''),
//                     Text(product.title,
//                         style: Theme.of(context).textTheme.headline4?.copyWith(
//                             color: Colors.white, fontWeight: FontWeight.bold)),
//                     Row(
//                       children: [
//                         RichText(
//                             text: TextSpan(children: [
//                           TextSpan(
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline4
//                                   ?.copyWith(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold))
//                         ])),
//                       ],
//                     ) //headlining word
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         // DetailContentMenu()
//       ]),
//     );
//   }
// }
