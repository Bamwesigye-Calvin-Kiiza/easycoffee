import 'package:flutter/material.dart';

class coffee_well_being_body extends StatefulWidget {
  const coffee_well_being_body({Key key}) : super(key: key);

  @override
  State<coffee_well_being_body> createState() => _coffee_well_being_bodyState();
}

class _coffee_well_being_bodyState extends State<coffee_well_being_body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 238, 233),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    child: Container(
                      color: Color.fromARGB(255, 196, 229, 255),
                      child: Center(
                          child: Text(
                        'Welcome to Coffee Care center',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            'SUITABLE CLIMATIC CONDITIONS\n',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                      ),
                      Container(
                        color: Color.fromARGB(255, 255, 237, 183),
                        child: Text(
                          'The best climate conditions for the plant’s development and production are,temperatures between 21°C and 22°C, 1,800 hours of sunshine annually, and a yearly rainfall between 1,500 and 2,000 mm.Where there are temperatures greater than 25°C, more than 1,800 hours of solar brightness per year, little cloudiness, and annual rainfall of less than 1,500 mm,water deficiency may become an issue.This produces adverse conditions for crop development, presenting us with water deficiency, meaning that there is not enough water for the coffee plantation, which affects the productive development of the coffee crop.',
                          style: TextStyle(fontSize: 19),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Center(
                            child: Text(
                          'PESTICIDES\n',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/endosolfan.jpeg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color.fromARGB(255, 204, 247, 206),
                        child: Text(
                          'Endosulfan (brand name Thiodan) — used against coffee cherry borer. (UPDATE:  As of early 2011, Endosulfan has now been slated to be banned globally, although it does not take place immediately. Here is a 2016 article about its continued use around the world.) Does not dissolve readily (but does degrade) in water and sticks to soil particles, so may take years to completely break down. Its breakdown products are more persistent than parent compounds. It is toxic to mammals, birds, and fish. Effects the central nervous system, and in animals causes kidney, testes, and liver damage',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/chlorpyrifos.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color.fromARGB(255, 253, 223, 223),
                        child: Center(
                            child: Text(
                          'Chlorpyrifos (brand name Dursban). A broad spectrum organophosphate used against coffee cherry borer and coffee leaf miner. In the U.S., the Environmental Protection Agency banned most household uses in 2000.  It is a contact poison.  It has caused human deaths, and has been linked to birth defects. It is extremely toxic to birds, freshwater and marine organisms, bees, and other wildlife.  It can bioaccumulate and effect bird reproduction',
                          style: TextStyle(fontSize: 19),
                        )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/disulfoton.jpeg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color.fromARGB(255, 241, 213, 169),
                        child: Center(
                            child: Text(
                          '\nDisulfoton. A systemic organophosphate insecticide used against leaf miner.  In the U.S., restricted use due to its high toxicity to mammals by all routes of exposure.  It is also highly toxic to birds and fish. Secondary exposure and poisoning occurs after birds feed on insects that have consumed residue-laden plants; these insects are impaired by the disulfoton and are easier for birds to capture, compounding the problem. High levels of toxins can be attained in this manner and has resulted in avian mortality in connection with disulfoton use.  It is delivered in granular form, which poses the threat of runoff and contamination of other crops when applied on slopes, on which coffee is often grown. Degrades or is metabolized by plants into harmful compounds that are very persistent in the environment. Class 1a, extremely hazardous (highest toxicity)',
                          style: TextStyle(fontSize: 19),
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 4,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          'FERTILIZERS.\n',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Column(
                        children: [
                          Container(
                            child: Text(
                              'For optimum production, the crop should be provided with a proper nutrition. This includes both macro and micronutrients which is achieved through application of basal and foliar fertilizers. After pruning your coffee trees well, hoed up the weeds, then apply fertilizer. Basal fertilizers are absorbed through the roots and they include DAP, CAN, NPK.  All ground fertilizers should always be mixed with Humipower® at a rate of 50kgs fertilizer with 1kg humipower. Humipower improves nutrient uptake by the crop, adds organic matter to the soil, stimulates growth and stabilizes soil PH. Coffee trees need a lot of potash, nitrogen and a little of phosphoric acid. Spread the fertilizer in a ring around each coffee plant and be careful not to put any on its trunk, branches or leaves. MANURE could also be added depending on organic matter of the soil.',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text(
                            'Foliar fertilizers are absorbed through the foliage and thus are sprayed. They include OPTIMIZER, GOLDCHANCE/LAVENDER SURSTARTER, SUPERGROWTH, FRUIT AND FLOWER,, AND TOTAL, ZINC AND BORON.  The main reason we apply the above is because nutrients are lost by harvesting, erosion and leaching and hence have to be replenished through the above highlighted methods.\n\n',
                            style: TextStyle(fontSize: 19),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Center(
                                child: Text(
                              'ZINC AND BORON APPLICATION',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              'These are nutrients required by the crop. Boron plays a major role in processes and these are; root development, cell wall formation, cell division and enhances uptake of primary and secondary nutrients, water uptake, gives plant disease resistance, and thickens the cell wall hence reducing incidence of attack by white stem borer. Boron is a prerequisite for development of nodes, fruit size, flowering, fruit setting and also drought resistance.\n\nZinc on the other hand increases general crop yield, it increases the bean size, it reduces incidence of borer attack, it acts in protein synthesis, improves cup quality, increases coffee colour index,pottasim leaching and chlorogenic acid concentration.\n\nZinc and boron are the most important micro elements and require to be applied 1-2 months before flowering and should be applied twice in an year I. e. January /February and July /August for main crop and early crop or vice versa depending with your location. They reduces biennial cropping.\n\nAs greenlife we offer all the above foliars. We have ZINC GOLD at 10mls and VITABOR GOLD at 20mls per 20ltrs of water. They should be applied with Integra at a rate of 3ml/20l of water. These products are readily available at all stockists countrywide.',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
