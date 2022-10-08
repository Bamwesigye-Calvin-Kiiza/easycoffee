import 'package:flutter/material.dart';

class farmersprofile_page extends StatefulWidget {
  const farmersprofile_page({Key key}) : super(key: key);

  @override
  State<farmersprofile_page> createState() => _farmersprofile_pageState();
}

class _farmersprofile_pageState extends State<farmersprofile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/disulfoton.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('NAME:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('AGE:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('FARM NAME:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('LOCATION:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('COFFEE TYPE:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('PHONE NO.:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    children: [
                                      Text('Email:'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('ghdjsggshd')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        'BRIEF BACKGROUND',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'jfdjt;uyvxrcvbhjgytezrxcfvgbhyiturxctvbhbuvcirxecrtvybunbuvotc6rx8rcvtbnmobuipyvt7c9vobhdtcyuhghfxdzxcvbjknjktjrhsegrdtfyguhijok;iluytdrsrdtyfguhioklhfkvcghgfcvhkjhjhgfdfhjkhljjhfgdffghjlkytdrhsdyuioiuytrhgcghjghgdkjljhgfgfghkjlkjlhgghkljjfhdfhfghhlkdghkjhdgfsdfghkjghfdlnmjiuypct7vybnj;k;jitcovulhbkj',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        'FARM ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/disulfoton.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'farm infofjkjhgdfsghfjgkhljgfdhfgfjgkhlj;kgfdjfsgghdhjfgkhljhjghdfgfgfghvyfchyufdhgjyxfcvbtxghbcgfhbkyfxg',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ElevatedButton(
                          child: Text(
                            'Message farmer',
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            // shape:BeveledRectangleBorder(
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(0))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
