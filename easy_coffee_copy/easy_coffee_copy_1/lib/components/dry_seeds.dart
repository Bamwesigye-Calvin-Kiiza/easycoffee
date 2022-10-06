import 'package:flutter/material.dart';
import '../core/color.dart';
import 'farm_tools.dart';
import 'flutterwave.dart';

class Dry_seeds extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 141, 121),
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
            width: 10,
          )
        ]);
  }
}

//calvo code for final screen
class finalScreen extends StatelessWidget {
  // final Product product;
  // const finalScreen({key, this.product});
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
                            image: AssetImage('assets/images/coffe_type.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.12),
                    height: 1000,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 238, 232),
                        //curving at the top
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              padding: EdgeInsets.only(bottom: 50),
                              height: 649,
                              child: SingleChildScrollView(
                                child: Column(children: <Widget>[
                                  //
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Adongo.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\tHARVESTING TIME',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Depending on the variety, it will take approximately 3 to 4 years for the newly planted coffee trees to bear fruit. The fruit, called the coffee cherry, turns a bright, deep red when it is ripe and ready to be harvested. ',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'There is typically one major harvest a year. In some regions like Masaka, where there are two flowerings annually, there is a main and secondary crop.\nA farmer can haverst upto about 8kg on a single tree for every harvest if the tree is mature.A good picker averages approximately 100 to 200 pounds of coffee cherries a day, which will produce 20 to 40 pounds of coffee beans.',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture7.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tPICKING COFFEE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Container(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: Text(
                                  //     'PICKING COFFEE',
                                  //     style: TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Coffee is harvested in two ways;\n(i)Hand picking \n(ii)Machine picking',
                                        style: TextStyle(fontSize: 19)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture4.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tHand Picking',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'Hand Picking',
                                  //   style: TextStyle(
                                  //       fontSize: 19,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                    'Strip Picked: All of the cherries are stripped off of the branch at one time, either by machine or by hand.\nSelectively Picked: Only the ripe cherries are harvested, and they are picked individually by hand.Pickers rotate among the trees every 8 to 10 days, choosing only the cherries which are at the peak of ripeness. Because this kind of harvest is labor intensive and more costly, it is used primarily to harvest the finer Arabica beans.',
                                    style: TextStyle(fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture3.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\Machine Picking',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'Machine Picking',
                                  //   style: TextStyle(
                                  //       fontSize: 19,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Text(
                                      'This is basically strip picking whereby specalised machinery is used to do that work. Some strip the whole tree while other strip just a branch on the trees.It should be noted that those using the strip picker find it difficult to get the all busket of coffee beans ripe',
                                      style: TextStyle(fontSize: 19)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture8.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tPROCESSING THE CHERRIES',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Container(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: Text(
                                  //     'PROCESSING THE CHERRIES',
                                  //     style: TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "Processing coffee so separating the coffee cherry’s fruit flesh and skin from the coffee beans is one of the most crucial aspects of farming coffee.",
                                      style: TextStyle(fontSize: 19)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture2.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tThe Dry Method',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'The Dry Method ',
                                  //   style: TextStyle(
                                  //       fontSize: 19,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'This is the age-old method of processing coffee, and still used in many countries where water resources are limited. The freshly picked cherries are simply spread out on huge surfaces to dry in the sun. In order to prevent the cherries from spoiling, they are raked and turned throughout the day, then covered at night or during rain to prevent them from getting wet. Depending on the weather, this process might continue for several weeks for each batch of coffee until the moisture content of the cherries drops to 11%. ',
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture5.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tThe Wet Method',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'The Wet Method',
                                  //   style: TextStyle(
                                  //       fontSize: 19,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'removes the pulp from the coffee cherry after harvesting so the bean is dried with only the parchment skin left on. First, the freshly harvested cherries are passed through a pulping machine to separate the skin and pulp from the bean.\nThen the beans are separated by weight as they pass through water channels. The lighter beans float to the top, while the heavier ripe beans sink to the bottom. They are passed through a series of rotating drums which separate them by size.\nAfter separation, the beans are transported to large, water-filled fermentation tanks. Depending on a combination of factors -- such as the condition of the beans, the climate and the altitude -- they will remain in these tanks for anywhere from 12 to 48 hours to remove the slick layer of mucilage (called the parenchyma) that is still attached to the parchment. While resting in the tanks, naturally occurring enzymes will cause this layer to dissolve.\nWhen fermentation is complete, the beans feel rough to the touch.  The beans are rinsed by going through additional water channels, and are ready for drying.',
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture2.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tDRYING THE BEANS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Container(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: Text(
                                  //     'DRYING THE BEANS',
                                  //     style: TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Coffee is dried in two main ways. The first is by spreading beans out under the sun on raised beds or patios. The second is by using dedicated mechanical coffee dryers',
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture1.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tSun Drying',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'Sun Drying',
                                  //   style: TextStyle(
                                  //       fontSize: 19,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Ultimately, sun-drying relies on consistent heat and low humidity without adverse weather conditions or precipitation. In periods of heavy rainfall, producers may face delays or risk the quality of their coffee (which could cause them to lose at least a year’s worth of hard work).\n\nThe risks of sun-drying coffee include uncontrolled fermentation, animal contamination, improper manual drying, and adverse weather conditions, all of which can have a major impact on cup quality.\n\nUncontrolled fermentation may occur when coffee is not dried quickly enough, as microorganisms break down compounds within the coffee and generate undesirable flavours. Animal contamination includes larger wild animals causing physical damage to the beans and animal droppings (such as those from birds) falling among the drying coffee. Finally, improper manual drying occurs when coffee is not turned properly, leading to uneven exposure to temperature and airflow.",
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/picture6.jpeg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '\n\n\n\n\tMachine Drying',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   'Machine Drying',
                                  //   style: TextStyle(
                                  //       fontSize: 19,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "The three main advantages that mechanical dryers have over drying coffee in the sun are;\n-Removing uncontrolled environmental variables which may affect coffee quality\n-Improving accuracy\n-Minimising delays.\n\nOne of the most important features of many modern rotary coffee dryers are drying control systems. These systems offer producers the ability to manage the temperature through three separate variables: the heat source, the air, and the coffee.\nBy doing so, drying control systems offer producers more control throughout the drying process. Some systems even allow producers to create “drying curves” that interrupt the dryer before it reaches a maximum designated temperature.",
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ]),
                              ),
                            )) //code here
                      ],
                    )),
                //content of the card_0n tap ui

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''),
                      Text('Harvest',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold)),

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
                ),
              ],
            )),
        DetailContentMenu()
      ]),
    );
  }
}
