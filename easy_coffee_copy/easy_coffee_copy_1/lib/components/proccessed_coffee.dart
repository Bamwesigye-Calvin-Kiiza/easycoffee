import 'package:flutter/material.dart';

import 'farm_tools.dart';

class proccessed_coffee extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          image: AssetImage('assets/images/farmstore.webp'),
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
                  child: ProcessedcoffeedListScreen()

                  //desighn of the background
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Proccessed coffee',
                        style: Theme.of(context).textTheme.titleLarge.copyWith(
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

class ProcessedcoffeedListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Divider(),
        // Ink(
        //   color: Colors.blueGrey[50],
        //   child: ListTile(
        //     title: Text("How To Dry"),
        //     trailing: Icon(Icons.arrow_forward_rounded),
        //     onTap: () {},
        //   ),
        // ),
        Divider(),
        Ink(
          color: Colors.blueGrey[100],
          child: ListTile(
            title: Text('Prices'),
            trailing: Icon(Icons.arrow_forward_rounded),
            onTap: () {},
          ),
        ),
        Divider(),
        Ink(
          color: Colors.blueGrey[150],
          child: ListTile(
            title: Text('Locations'),
            trailing: Icon(Icons.arrow_forward_rounded),
            onTap: () {},
          ),
        ),
        Divider(),
      ],
    );
  }
}
