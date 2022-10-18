import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_coffee_copy_1/components/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<QuerySnapshot> _future;
  Future<QuerySnapshot<Map<String, dynamic>>> _Future =
      FirebaseFirestore.instance.collection('tools').get();
  // // PageController controller = PageController();
  // @override
  // void initState() {
  //   controller = PageController(viewportFraction: 0.6, initialPage: 0);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => Toolscreen()));
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: FutureBuilder<QuerySnapshot>(
        future: _Future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error:${snapshot.error}'));
          }

          if (snapshot.hasData) {
            QuerySnapshot data = snapshot.data;
            List<QueryDocumentSnapshot> documents = data.docs;
            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'uid': e['uid'],
                      'imagePath': e['imagePath'],
                      'price': e['price'],
                      'description': e['description'],
                      'category': e['category'],
                      'name': e['name'],
                    })
                .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0)),
                  Container(
                    height: 600.0,
                    width: 900,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    // height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: documents.length,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(left: 20.0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (itemBuilder, index) {
                        Map thisItem = items[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Detail(thisItem)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200.0,
                              height: 200.0,
                              margin:
                                  const EdgeInsets.only(right: 20, bottom: 10),
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Container(
                                          height: 180,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  thisItem['imagePath'],
                                                ),
                                                fit: BoxFit.fill

                                                // height: 250,
                                                ), // width: 100,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      SizedBox(
                                        height: 150,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Category',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                const SizedBox(width: 10.0),
                                                Text(
                                                  thisItem['category'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Tool:',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                const SizedBox(width: 10.0),
                                                Text(
                                                  thisItem['name'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                            255, 133, 83, 66)
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Price',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  thisItem['price'],
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
            // ListView.builder(
            //     itemCount: documents.length,
            //     itemBuilder: (context,index){
            //       Map thisItem=items[index];
            //       return ListTile(
            //         onTap: (){
            //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detail(thisItem)));
            //         },
            //         title: Text(thisItem['title']),);
            //     });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
    // return
    // Scaffold(
    //   backgroundColor: Color.fromARGB(255, 250, 235, 229),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //             padding: const EdgeInsets.symmetric(
    //                 horizontal: 15.0, vertical: 15.0)),
    //         SizedBox(
    //           height: 390.0,
    //           width: 900,
    //           child: PageView.builder(
    //             itemCount: farmtool.length,
    //             controller: controller,
    //             physics: const BouncingScrollPhysics(),
    //             padEnds: false,
    //             pageSnapping: true,
    //             onPageChanged: (value) => setState(() => activePage = value),
    //             itemBuilder: (itemBuilder, index) {
    //               bool active = index == activePage;
    //               return slider(active, index);
    //             },
    //           ),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.all(20.0),
    //                 child: Text(
    //                   'Most bought',
    //                   style: TextStyle(
    //                     color: black.withOpacity(0.7),
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 18.0,
    //                   ),
    //                 ),
    //               ),
    //               Image.asset(
    //                 'assets/icons/more.png',
    //                 color: Colors.brown,
    //                 height: 20,
    //               ),
    //             ],
    //           ),
    //         ),
    //         SizedBox(
    //           height: 200.0,
    //           child: ListView.builder(
    //             itemCount: mostboughttool.length,
    //             physics: const BouncingScrollPhysics(),
    //             padding: const EdgeInsets.only(left: 20.0),
    //             scrollDirection: Axis.horizontal,
    //             itemBuilder: (itemBuilder, index) {
    //               return Container(
    //                 width: 200.0,
    //                 margin: const EdgeInsets.only(right: 20, bottom: 10),
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.green.withOpacity(0.1),
    //                       blurRadius: 10,
    //                       offset: const Offset(0, 5),
    //                     ),
    //                   ],
    //                   borderRadius: BorderRadius.circular(30.0),
    //                 ),
    //                 child: Stack(
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Image.asset(
    //                           mostboughttool[index].imagePath,
    //                           width: 70,
    //                           height: 70,
    //                         ),
    //                         const SizedBox(width: 10.0),
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Text(
    //                               mostboughttool[index].name,
    //                               style: TextStyle(
    //                                 color: black.withOpacity(0.7),
    //                                 fontWeight: FontWeight.w800,
    //                               ),
    //                             ),
    //                             Text(
    //                               '\$${mostboughttool[index].price.toStringAsFixed(0)}',
    //                               style: TextStyle(
    //                                 color: black.withOpacity(0.4),
    //                                 fontWeight: FontWeight.w600,
    //                                 fontSize: 12.0,
    //                               ),
    //                             ),
    //                           ],
    //                         )
    //                       ],
    //                     ),
    //                     // Positioned(
    //                     //   right: 20,
    //                     //   bottom: 20,
    //                     //   child: CircleAvatar(
    //                     //     backgroundColor: green,
    //                     //     radius: 15,
    //                     //     child: Image.asset(
    //                     //       'assets/icons/add.png',
    //                     //       color: white,
    //                     //       height: 15,
    //                     //     ),
    //                     //   ),
    //                     // ),
    //                   ],
    //                 ),
    //               );
    //             },
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  // AnimatedContainer slider(active, index) {
  //   double margin = active ? 20 : 30;
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOutCubic,
  //     margin: EdgeInsets.all(margin),
  //     child: mainfarmtoolcard(index),
  //   );
  // }

  // Widget mainfarmtoolcard(index) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (builder) => DetailsPage(farmtool: farmtool[index]),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.all(8.0),
  //       decoration: BoxDecoration(
  //         color: white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: black.withOpacity(0.05),
  //             blurRadius: 15,
  //             offset: const Offset(5, 5),
  //           ),
  //         ],
  //         border:
  //             Border.all(color: Color.fromARGB(255, 253, 171, 19), width: 2),
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       child: Stack(
  //         children: [
  //           SizedBox(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: lightGreen,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: black.withOpacity(0.05),
  //                     blurRadius: 15,
  //                     offset: const Offset(5, 5),
  //                   ),
  //                 ],
  //                 borderRadius: BorderRadius.circular(25.0),
  //                 image: DecorationImage(
  //                   image: AssetImage(farmtool[index].imagePath),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           // Positioned(
  //           // //   right: 8,
  //           // //   top: 8,
  //           // //   child: CircleAvatar(
  //           // //     backgroundColor: green,
  //           // //     radius: 15,
  //           // //     child: Image.asset(
  //           // //       'assets/icons/add.png',
  //           // //       color: white,
  //           // //       height: 25,
  //           // //     ),
  //           // //   ),
  //           // ),
  //           Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Padding(
  //               padding: const EdgeInsets.only(bottom: 5),
  //               child: Text(
  //                 '${farmtool[index].name} - \Ugx${farmtool[index].price.toStringAsFixed(0)}',
  //                 style: TextStyle(
  //                   color: black.withOpacity(0.7),
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16.0,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // int selectId = 0;
  // int activePage = 0;
}
