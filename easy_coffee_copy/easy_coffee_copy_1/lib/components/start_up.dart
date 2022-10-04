import 'package:flutter/material.dart';

import 'farms.dart';

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
                  child: startup()

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
        DetailContentMenu()
      ]),
    );
  }
}

class startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        // CircleAvatar(
        //   maxRadius: 50,
        //   backgroundColor: Colors.black,
        //   child: Icon(Icons.person, color: Colors.white, size: 50),
        // ),

        Image.asset('assets/images/Bizzy-Coffee-logo.webp'),

        Center(
          child: Text(
            "The Idea ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "Bizzy Coffee was created by friends Alec French and Andrew Healy who bonded over their shared passion for cold brew coffee. To spread their passion, Bizzy provides cold brew coffee made with organic beans from sustainable growers. They aim to provide cold coffee that is sweet, flavorful, and creamy like no other. ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "The Details ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "Alex and Andrew developed a close friendship due to their love of cold brew coffee. Nicknamed ”The Bizzy Boys”, their natural affinity for a challenge led them to develop a roasting company that would supply beans for cold brew. Like many startups, they began with the ingredients they had on hand. The goal was to make a cold coffee that was not bitter. Instead, Alex and Andrew were on a mission to create a creamy, rich, and non-bitter brew. After many trials and tests with different roasting profiles, grind sizes, brewing temperatures, etc, Bizzy Boys found a unique blend that worked. The trick to maintaining flavor without bitterness, they found, was to boil the beans first.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Divider(),
        Divider(),
        Divider(),

        /// the first idea stops here
        ///

        Image.asset('assets/images/Cometeer-logo.webp'),
        Center(
          child: Text(
            "The Idea ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "Known for saying, “we’re the coffee nerds so you don’t have to be,” Cometeer has pioneered the coffee game. The founders developed a new extraction system that preserves nutrients in coffee while still maintaining the bold flavor people want.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Center(
          child: Text(
            "The Details ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),

        Text(
          "Cometeer was founded by Matthew Roberts in 2015 in Gloucester Massachusetts. The innovative new company developed a ground-breaking yet simple solution to preserving nutrients in ground coffee.When coffee beans are ground, they lose a lot of their natural nutrients. Cometeer found that by flash freezing it, nothing was lost in the process. Interestingly enough, freezing the coffee grounds not only preserved its antioxidants and vitamins, but the process also made the beans ten times stronger. To maintain freshness, Cometeer designed their coffee in single servings. It comes in small, round capsules that melt away when dropped into hot water. The grounds also stay good in the freezer for up to three years. Along the way, Cometeer has found innovative ways to inject flavor into its pods. That, along with their long-standing relationships with roasters and coffee farmers, has ensured consistency in Cometeer coffee.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
