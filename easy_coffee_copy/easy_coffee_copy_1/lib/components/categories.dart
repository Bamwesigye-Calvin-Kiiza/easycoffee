//this deals with the category section designs

import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  //list of words in the category section
  List<String> categories = [
    'Home',
    'Fresh coffee',
    'Dry seeds',
    'Farm health',
    'Farm tips ',
    'Processed coffee',
    'Price Starts',
    'Fertilizers',
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
              style: TextStyle(fontSize: 15,
              color: selectedIndex == index? Colors.blue:Color.fromARGB(255, 121, 118, 118)),          
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
