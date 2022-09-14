// manages our card and gridview display
import 'package:flutter/material.dart';
import '../models/products.dart';
import '../screens/details/details_screen.dart';

class itemcard extends StatelessWidget {
  final Product product;
  final Function press;
  const itemcard({
    Key? key, required this.product, required this.press ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap:() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: product),
                  )),//to be updated 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover
                    )
                  ),
                )
                ),
            ),
          
          // out putting requiredd information
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(product.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),),
          ),
        //Text('\$${product.price}')
        ],
      ),
    );
  }
}
