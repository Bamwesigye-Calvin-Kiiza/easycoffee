import 'package:easy_coffee_copy_1/models/products.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.colour,
      appBar: buildappbar(context),
      //body: Body2(product: product),
    );
  }

  AppBar buildappbar(BuildContext context) {
    return AppBar(
      backgroundColor: product.colour,
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=> Navigator.pop(context),color: Colors.black,),
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu,
    color: Colors.black),color: Colors.transparent),SizedBox(
      width: 10,
    )]
    );
  }
}
