import 'package:easy_coffee_copy_1/models/products.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.colour,
      appBar: buildappbar(context),
      body: finalScreen(product: product),
    );
  }

  AppBar buildappbar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.black),
              color: Colors.transparent),
          SizedBox(
            width: 10,
          )
        ]);
  }
}

class Body2 extends StatelessWidget {
  final Product product;
  const Body2({
    key,
    this.product,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, [Index]) {
          Product;
          products[Index];
          return Card(
            child: ListTile(
              title: Text(product.title),
              subtitle: Text(product.description),
              leading: Image.asset(product.image),
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinalproductsDetailsScreen()));
              },
            ),
          );
        });
  }
}

class FinalproductsDetailsScreen extends StatelessWidget {
  final Product product;
  const FinalproductsDetailsScreen({key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.colour,
      appBar: buildappbar(context),
      body: finalScreen(),
    );
  }

  AppBar buildappbar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.black),
              color: Colors.transparent),
          SizedBox(
            width: 5,
          )
        ]);
  }
}

class finalScreen extends StatelessWidget {
  final Product product;
  const finalScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(product.image), fit: BoxFit.cover)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.12),
                height: 100000,
                decoration: BoxDecoration(
                    color: Colors.white,
                    //curving at the top
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),

                //contents of the white background
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
                                      color: Colors.black,
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

//copyright code and social media handles
class DetailContentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "© All rights reserved. e_coffee Limited",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                height: 1.50),
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.whatsapp,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.telegram,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.tiktok,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



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
