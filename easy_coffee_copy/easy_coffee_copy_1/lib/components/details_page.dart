import 'package:flutter/material.dart';

import 'flutterwave.dart';

class Detail extends StatelessWidget {
  Detail(this.data, {Key key}) : super(key: key);
  Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(data['imagePath']),
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
                                  text: data['name'],
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextSpan(
                                  text: '             \t${data['price']}',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
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
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.asset(
                              'assets/icons/heart.png',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      RichText(
                        text: TextSpan(
                          text: data['description'],
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
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
                          color: Colors.black.withOpacity(0.9),
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
                              color: Colors.black, height: 24.0),
                          Image.asset('assets/icons/drop.png',
                              color: Colors.black, height: 24.0),
                          Image.asset('assets/icons/temperature.png',
                              color: Colors.black, height: 24.0),
                          Image.asset('assets/icons/up_arrow.png',
                              color: Colors.black, height: 24.0),
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
                    color: Colors.black, height: 40.0),
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

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Container(
      //         color: Colors.black12,
      //         padding: EdgeInsets.all(18),
      //         child: Text(data['title'])),

      // Expanded(
      //   child: ListView.builder(
      //       itemCount: 40,
      //       itemBuilder: (contexr,index){
      //     return ListTile(title: Text('Hello world'),);
      //   }),
      // ),
      // ],
      // )
    );
  }
}

// import 'package:easy_coffee_copy_1/components/flutterwave.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_coffee_copy_1/core/color.dart';
// import 'package:easy_coffee_copy_1/models/farmtools_model.dart';

// class DetailsPage extends StatelessWidget {
//   final Farmtool farmtool;
//   const DetailsPage({Key key, this.farmtool}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: height / 2,
//                   decoration: BoxDecoration(
//                     color: lightGreen,
//                     boxShadow: [
//                       BoxShadow(
//                         color: green.withOpacity(0.2),
//                         blurRadius: 15,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(60),
//                       bottomRight: Radius.circular(60),
//                     ),
//                     image: DecorationImage(
//                       image: AssetImage(farmtool.imagePath),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20.0, vertical: 20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: farmtool.name,
//                                   style: TextStyle(
//                                     color: black.withOpacity(0.8),
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18.0,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: '  (${farmtool.category})',
//                                   style: TextStyle(
//                                     color: black.withOpacity(0.5),
//                                     fontSize: 18.0,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 30.0,
//                             width: 30.0,
//                             padding: const EdgeInsets.all(8.0),
//                             decoration: BoxDecoration(
//                               color: green,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: green.withOpacity(0.2),
//                                   blurRadius: 15,
//                                   offset: const Offset(0, 5),
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: Image.asset(
//                               'assets/icons/heart.png',
//                               color: white,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 20.0),
//                       RichText(
//                         text: TextSpan(
//                           text: farmtool.description,
//                           style: TextStyle(
//                             color: black.withOpacity(0.5),
//                             fontSize: 15.0,
//                             height: 1.4,
//                             letterSpacing: 0.5,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       Text(
//                         'Treatment',
//                         style: TextStyle(
//                           color: black.withOpacity(0.9),
//                           fontSize: 18.0,
//                           height: 1.4,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 0.5,
//                         ),
//                       ),
//                       const SizedBox(height: 20.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Image.asset('assets/icons/sun.png',
//                               color: black, height: 24.0),
//                           Image.asset('assets/icons/drop.png',
//                               color: black, height: 24.0),
//                           Image.asset('assets/icons/temperature.png',
//                               color: black, height: 24.0),
//                           Image.asset('assets/icons/up_arrow.png',
//                               color: black, height: 24.0),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back),
//                 ),
//                 Image.asset('assets/icons/cart.png',
//                     color: black, height: 40.0),
//               ],
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SizedBox(
//                   height: 40,
//                   width: 100,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => farm_tools_screen(),
//                           ));
//                     },
//                     child: Text('BUY'),
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(Colors.orange.shade300)),
//                   ),
//                 ),
//               ),
//             ) //code here
//           ],
//         ),
//       ),
//     );
//   }
// }
