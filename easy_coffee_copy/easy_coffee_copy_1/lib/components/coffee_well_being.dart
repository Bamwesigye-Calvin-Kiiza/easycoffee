import 'package:flutter/material.dart';
import 'farm_tools.dart';

class coffee_well_being extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 250, 238),
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
                          image: AssetImage(
                              'assets/images/coffee_well_being.webp'),
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
                  child:Text('') //coffee_well_being_body()

                  //desighn of the background
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Coffee well being',
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
