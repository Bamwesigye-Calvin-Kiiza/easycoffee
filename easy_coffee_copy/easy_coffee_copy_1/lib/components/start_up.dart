import 'package:flutter/material.dart';



class start_up extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 252, 118),
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
                          image: AssetImage('assets/images/start_up.webp'),
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

                  //content of the card_0n tap ui
                  child: startup2()

                  //desighn of the background
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Start Ups',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.brown, fontWeight: FontWeight.bold)),
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
        //DetailContentMenu()
      ]),
    );
  }
}

class startup2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        //Image.asset('assets/images/Bizzy-Coffee-logo.webp'),

        Center(
          child: Text(
            " Land Preparation ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "\t First of all, divide the land into blocks of convenient size with footpaths and roads laid out in between. In the slopy area, you can adopt terracing and contour planting. Spacing for arabica and robusta coffee is 2-2.5m and 2.5 to 4m respectively on either way. \n\n  Usually, you can open pits of 45cm after the first few summer shower. You can plant the seedlings of 16 to 18months old during June or September-October. Place the seedling in the hole with its taproot and lateral roots spread out in the proper position. \n\n  Then, pack the soil around the seedling firmly and evenly in such a way that 3-cm high above the ground to prevent stagnation of water around the collar. Finally, provide the seedlings cross stakes to prevent wind damage.\n \n",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Nursery Practice ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "Broadly, you can raise the seedlings in two ways. Either in the nursery beds or in the small bags.\n\n  For sowing the coffee seeds, prepare the germination beds of 1-meter width and of convenient length to a height of 15 cm from the ground level. Sow only the selected and certified coffee seeds. After sowing, cover the seeds with a thin layer of finely sieved soil. Additionally, mulch with a layer of paddy straw ensures optimum temperature for seed germination and protects the seeds from desiccation.\n\n",
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        // Divider(),
        // Divider(),
        // Divider(),

        /// the first idea stops here
        ///

        //Image.asset('assets/images/Cometeer-logo.webp'),
        Center(
          child: Text(
            "Coffee Care & Management ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "When the plant reaches a height of 75cm in Arabica or 110-120 cm in robusta, is topped. Actually, this facilitates lateral spreading and increases the bearing area. In this system, sometimes you may provide a second-tier depending upon the soil fertility and plant’s vigor. After harvesting, immediately you will need to provide pruning till the onset of the monsoon. \n\n",
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Soil Management ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "Digging: In the new clearing, give the field a thorough digging to a depth of about 35-45cm towards the end of the monsoon.\n\n  Scuffling or soil stirring: In established coffee fields, you can do scuffling or soil stirring towards the beginning of the dry period. Actually, it controls weeds and also conserves soil moisture.\n\tTrenching: Dig or renovate the trenches and pits in a staggered manner between rows of coffee along the contour during August-October when the soil is fairly easy to work.\n\tMulching: Basically, mulching young coffee clearings helps to maintain optimum soil temperature and conserves soil moisture, and acts as an effective erosion control measure. \n\n",
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Manuring",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "Actually, the peak periods of demand for nutrients are at the time of flowering, fruit set, development, and crop maturation. Therefore, you will need to plan accordingly. In general, you need to provide the Nitrogen Phosphorus, and Potash in the right ratio. \n\n",
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Irrigation",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "Generally, coffee is a rainfed crop. However, irrigation with sprinklers during the summer increases blossoming and results in higher yields. \n\n",
          //textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Weed Control",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "Generally, during monsoon, you will need to put attention to weed control \n\n",
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Shade Tree Management",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "There are several different shade trees you can use on the coffee plantation. Commonly you can use Dadap as a lower canopy shade. Plant the two-meter-long stakes for every two plants of coffee. You can plant Silver Oak and Dadaps during June when rains of the South-West monsoon commences.\n\n  During summer, paint the stem of young Dadaps with diluted lime or wrap in agave leaves or polythene sheets in order to prevent them from sun scorching. Additionally, regulate shade by cutting criss-cross branches during monsoon season. Basically, for permanent shade, you can plant silver oak trees.\n\n",
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Plant Protection",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "For protecting the plant, you must save the coffee garden from pests and diseases. Generally, Mealybug, White stem borer, and Shoot-hole borer are the most potential pests to damage the coffee plantation.\n\n  On the other hand, you have to protect the garden from the diseases like Leaf rust, Black rot, and Root Diseases. \n\n",
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "Harvesting & Storage",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "Actually, you can pick the coffee fruits as and when they become ripe to get better quality. Arabica comes for harvesting earlier since they take 8-9 months for fruit development from flowering while robusta takes 10-11 months.\n\n You must pick the coffee fruits manually. The first picking consists of selective picking of ripe berries and is called fly picking. Thereafter, there will be 4-6 main pickings at 10-15days intervals and final harvest.\n\tIf proper care and management are provided, you can expect 750 – 1000 kg dry parchment /ha from your coffee plantation business. \n\n",
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
