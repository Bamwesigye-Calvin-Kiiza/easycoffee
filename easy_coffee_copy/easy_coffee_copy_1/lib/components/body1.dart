//deals with the components of home screen
import 'package:easy_coffee_copy_1/components/coffee_well_being.dart';
import 'package:easy_coffee_copy_1/components/dry_seeds.dart';
import 'package:easy_coffee_copy_1/components/farm_tools.dart';
import 'package:easy_coffee_copy_1/components/price_Fructuations.dart';
import 'package:easy_coffee_copy_1/components/proccessed_coffee.dart';
import 'package:easy_coffee_copy_1/components/start_up.dart';
import 'package:flutter/material.dart';
import 'farmers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromARGB(255, 252, 234, 224)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GridView(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => farmersScreen() //HomePage()
                              ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(50),),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/landhealth.webp'),
                                      fit: BoxFit.cover,
                                    )),
                              )),
                        ),
                        // out putting required information
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'Farmer',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dry_seeds() //HomePage()
                              ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/coffe_type.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                        // out putting required information
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'Harvest',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  coffee_well_being() //HomePage()
                              ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/coffee_well_being.webp'),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                        // out putting required information
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              ' Coffee Well being',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  price_fructuatations() //HomePage()
                              ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/graph.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                        // out putting required information
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              ' Price Fructuation',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => start_up() //HomePage()
                              ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/start_up.webp'),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                        // out putting required information
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              ' Start up ',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => farm_tools() //HomePage()
                              ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/farmtools.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                        // out putting required information
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'Farm tools',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
              ),
            ),
          ),
        ],
      ),
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
    'Harvest',
    'Coffee well being',
    'Processed coffee',
    'Prices',
    'start up',
    'farmtools',
  ];
  List<Widget> route = [
    Body(),
    farmersScreen(),
    Dry_seeds(),
    coffee_well_being(),
    proccessed_coffee(),
    price_fructuatations(),
    start_up(),
    farm_tools()
  ];
//positioning the black bar to starting category
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 27,
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => route[index]));
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
            //blue line on category text
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
