//deals with the components of home screen
import 'package:easy_coffee_copy_1/models/products.dart';
import 'package:flutter/material.dart';
import 'body2.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.75),
            itemBuilder: (context, index) => itemcard(
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        finalScreen(product: products[index]), //in body2.dart
                  )),
              product: products[index],
            ),
          ),
        ))
      ],
    );
  }
}

//this deals with the category section designs

class Categories extends StatefulWidget {
  const Categories({key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  //list of words in the category section
  List<String> categories = [
    'Home',
    'Farmers',
    'coffeebean',
    'Dry seeds',
    'Readycoffee',
    'Farm tips ', //url
    'Fertilizers', //destributors
    'Processed coffee',
    'Price Fructuations',
    'Coffee well being'
  ];
//positioning the black bar to starting category
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildcategory(index)),
      ),
    );
  }

//styling the category text
  Widget buildcategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontSize: 15,
                  color: selectedIndex == index
                      ? Colors.brown[400]
                      : Color.fromARGB(255, 121, 118, 118)),
            ),
            //black line on category text
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 40,
              color: selectedIndex == index ? Colors.blue : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
