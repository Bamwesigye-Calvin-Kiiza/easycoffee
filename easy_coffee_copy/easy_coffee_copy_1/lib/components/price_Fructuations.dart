import 'package:flutter/material.dart';

class price_fructuatations extends StatelessWidget {
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
                          image: AssetImage('assets/images/graph.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.12),
                  height: 4500,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 231, 223),
                      //curving at the top
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView(children: <Widget>[
                    Center(
                        child: Text(
                      'In Uganda shillings per Kg',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Text('Locality',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Price in UGX',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Kiboko')),
                          DataCell(Text('2,500/= -\n3,000/=')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica Parchment')),
                          DataCell(Text('11,000/= - 12,000/=')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Drugar Coffee (Clean)')),
                          DataCell(Text('10,000/= - 11,000/=')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('FAQ')),
                          DataCell(Text('6,800/= -\n7,300/=')),
                        ]),
                      ],
                    ),
                    Center(
                        child: Text(
                      // 'MARKET PRICES\n'
                      'In US Cents per lb',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    DataTable(
                      columns: [
                        DataColumn(
                            label: Text('Locality',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text("Price in USD",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Robusta –\n Screen 18')),
                          DataCell(Text('\$117.90')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Robusta –\n Screen 15')),
                          DataCell(Text('\$112.90')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Robusta –\n Screen 12')),
                          DataCell(Text('\$109.90')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica –\n Bugisu AA')),
                          DataCell(Text('\$215.70')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica –\n Bugisu A')),
                          DataCell(Text('\$214.70')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica –\n Bugisu PB')),
                          DataCell(Text('\$214.70')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica –\n Bugisu B')),
                          DataCell(Text('\$212.70')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica –\n  Wugar')),
                          DataCell(Text('\$213.70')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Arabica –  Drugar')),
                          DataCell(Text('\$194.70')),
                        ]),
                      ],
                    ),
                  ])
                  //content of the card_0n tap ui
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,

                  // children: [

                  //   Padding(
                  //       padding: EdgeInsets.all(20),
                  //       child: (Text('dhggfhgfjhhghgf')
                  //       )) //code here
                  //],
                  //)

                  //desighn of the background
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Price  Fructuation',
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

//copyright code and social media handles
class DetailContentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "© All rights reserved. e_coffee Limited",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                height: 1.50),
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.whatsapp,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.telegram,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.tiktok,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// //price bar and chart code
// class BarChartModel {
//   String year;
//   int financial;
//   final color;

//   BarChartModel({
//     this.year,
//     this.financial,
//     this.color,
//   });
// }

// class Prices extends StatelessWidget {
//   Prices({Key key}) : super(key: key);
//   final List<BarChartModel> data = [
//     BarChartModel(
//       year: "2014",
//       financial: 250,
//       color: (Colors.blueGrey),
//     ),
//     BarChartModel(
//       year: "2015",
//       financial: 300,
//       color: (Colors.red),
//     ),
//     BarChartModel(
//       year: "2016",
//       financial: 100,
//       color: (Colors.green),
//     ),
//     BarChartModel(
//       year: "2017",
//       financial: 450,
//       color: (Colors.yellow),
//     ),
//     BarChartModel(
//       year: "2018",
//       financial: 630,
//       color: (Colors.lightBlueAccent),
//     ),
//     BarChartModel(
//       year: "2019",
//       financial: 950,
//       color: (Colors.pink),
//     ),
//     BarChartModel(
//       year: "2020",
//       financial: 400,
//       color: (Colors.purple),
//     ),
//   ];

class PriceFlautuation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: //Scaffold(
            // appBar: AppBar(
            //   title: Text('MARKET PRICES'),
            // ),
            //body:
            ListView(children: <Widget>[
      Center(
          child: Text(
        'MARKET PRICES\n'
        'In US Cents per lb',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      DataTable(
        columns: [
          DataColumn(
              label: Text('Locality',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Robusta – Screen 18')),
            DataCell(Text('117.90')),
          ]),
          DataRow(cells: [
            DataCell(Text('Robusta – Screen 15')),
            DataCell(Text('112.90')),
          ]),
          DataRow(cells: [
            DataCell(Text('Robusta – Screen 12')),
            DataCell(Text('109.90')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica – Bugisu AA')),
            DataCell(Text('215.70')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica – Bugisu A')),
            DataCell(Text('214.70')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica – Bugisu PB')),
            DataCell(Text('214.70')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica – Bugisu B')),
            DataCell(Text('212.70')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica –  Wugar')),
            DataCell(Text('213.70')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica –  Drugar')),
            DataCell(Text('194.70')),
          ]),
        ],
      ),
      Center(
          child: Text(
        'In Uganda shillings per Kg',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      DataTable(
        columns: [
          DataColumn(
              label: Text('Locality',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Kiboko')),
            DataCell(Text('2,500/= - 3,000/=')),
          ]),
          DataRow(cells: [
            DataCell(Text('FAQ')),
            DataCell(Text('6,800/= - 7,300/=')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica Parchment')),
            DataCell(Text('11,000/= - 12,000/=')),
          ]),
          DataRow(cells: [
            DataCell(Text('Drugar Coffee (Clean)')),
            DataCell(Text('10,000/= to 11,000/=')),
          ]),
          DataRow(cells: [
            DataCell(Text('Arabica –  Drugar')),
            DataCell(Text('194.70')),
          ]),
        ],
      ),
    ])
        // ),
        );
  }
}
