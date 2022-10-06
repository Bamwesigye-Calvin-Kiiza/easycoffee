import 'package:easy_coffee_copy_1/models/coffee_model.dart';
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

                    //content of the card_0n tap ui
                    child: DrySeedListScreen()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''),
                      Text('Dry seeds',
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

// class DrySeedListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         Divider(),
//         Ink(
//           color: Colors.blueGrey[50],
//           child: ListTile(
//             title: Text("How To Dry"),
//             trailing: Icon(Icons.arrow_forward_rounded),
//             onTap: () {},
//           ),
//         ),
//         Divider(),
//         Ink(
//           color: Colors.blueGrey[100],
//           child: ListTile(
//             title: Text('Prices'),
//             trailing: Icon(Icons.arrow_forward_rounded),
//             onTap: () {},
//           ),
//         ),
//         Divider(),
//         Ink(
//           color: Colors.blueGrey[150],
//           child: ListTile(
//             title: Text('Locations'),
//             trailing: Icon(Icons.arrow_forward_rounded),
//             onTap: () {},
//           ),
//         ),
//         Divider(),
//       ],
//     );
//   }
// }

class DrySeedListScreen extends StatefulWidget {
  const DrySeedListScreen({Key key}) : super(key: key);

  @override
  State<DrySeedListScreen> createState() => _HomePageState();
}

class _HomePageState extends State<DrySeedListScreen> {
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 235, 229),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0)),
            SizedBox(
              height: 390.0,
              width: 900,
              child: PageView.builder(
                itemCount: coffeetype.length,
                controller: controller,
                physics: const BouncingScrollPhysics(),
                padEnds: false,
                pageSnapping: true,
                onPageChanged: (value) => setState(() => activePage = value),
                itemBuilder: (itemBuilder, index) {
                  bool active = index == activePage;
                  return slider(active, index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Most bought',
                      style: TextStyle(
                        color: black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/more.png',
                    color: Colors.brown,
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: mostboughttool.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (itemBuilder, index) {
                  return Container(
                    width: 200.0,
                    margin: const EdgeInsets.only(right: 20, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              mostboughttool[index].imagePath,
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  mostboughttool[index].name,
                                  style: TextStyle(
                                    color: black.withOpacity(0.7),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  '\$${mostboughttool[index].price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: black.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        // Positioned(
                        //   right: 20,
                        //   bottom: 20,
                        //   child: CircleAvatar(
                        //     backgroundColor: green,
                        //     radius: 15,
                        //     child: Image.asset(
                        //       'assets/icons/add.png',
                        //       color: white,
                        //       height: 15,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: maindryseedscard(index),
    );
  }

  Widget maindryseedscard(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) =>
                DrySeedsDetailsPage(Coffeetype: coffeetype[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border:
              Border.all(color: Color.fromARGB(255, 253, 171, 19), width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage(coffeetype[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Positioned(
            // //   right: 8,
            // //   top: 8,
            // //   child: CircleAvatar(
            // //     backgroundColor: green,
            // //     radius: 15,
            // //     child: Image.asset(
            // //       'assets/icons/add.png',
            // //       color: white,
            // //       height: 25,
            // //     ),
            // //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '${coffeetype[index].name} - \$${coffeetype[index].price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: white, //white.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int selectId = 0;
  int activePage = 0;
}

class DrySeedsDetailsPage extends StatelessWidget {
  final Coffeetype;
  const DrySeedsDetailsPage({Key key, this.Coffeetype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2,
                  decoration: BoxDecoration(
                    color: lightGreen,
                    boxShadow: [
                      BoxShadow(
                        color: green.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    image: DecorationImage(
                      image: AssetImage(Coffeetype.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: Coffeetype.name,
                                  style: TextStyle(
                                    color: black.withOpacity(0.8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text: '  (${Coffeetype.category})',
                                  style: TextStyle(
                                    color: black.withOpacity(0.5),
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 30.0,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: green,
                              boxShadow: [
                                BoxShadow(
                                  color: green.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset(
                              'assets/icons/heart.png',
                              color: white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          text: Coffeetype.description,
                          style: TextStyle(
                            color: black.withOpacity(0.5),
                            fontSize: 15.0,
                            height: 1.4,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Treatment',
                        style: TextStyle(
                          color: black.withOpacity(0.9),
                          fontSize: 18.0,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/sun.png',
                              color: black, height: 24.0),
                          Image.asset('assets/icons/drop.png',
                              color: black, height: 24.0),
                          Image.asset('assets/icons/temperature.png',
                              color: black, height: 24.0),
                          Image.asset('assets/icons/up_arrow.png',
                              color: black, height: 24.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Image.asset('assets/icons/cart.png',
                    color: black, height: 40.0),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => farm_tools_screen(),
                          ));
                    },
                    child: Text('BUY'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange.shade300)),
                  ),
                ),
              ),
            ) //code here
          ],
        ),
      ),
    );
  }
}
