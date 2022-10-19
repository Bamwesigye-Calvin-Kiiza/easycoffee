import 'package:cloud_firestore/cloud_firestore.dart';
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
    );
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
                  child: wellbeing2() //coffee_well_being_body()

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
      ]),
    );
  }
}

class wellbeing2 extends StatelessWidget {
  wellbeing2({Key key}) : super(key: key) {
    _referencePosts = FirebaseFirestore.instance.collection('wellbeing');
    _future = _referencePosts.get();
  }
  CollectionReference _referencePosts;
  Future<QuerySnapshot> _future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _future,
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Text('something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          QuerySnapshot data = snapshot.data;
          List<QueryDocumentSnapshot> documents = data.docs;
          List<Map> items = documents
              .map((e) => {
                    'id': e.id,
                    'title': e['title'],
                    'content': e['content'],
                    'Url': e['Url'],
                  })
              .toList();

          return PageView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Map thisItem = items[index];
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Image.asset('assets/images/Bizzy-Coffee-logo.webp'),

                        Center(
                          child: Text(
                            //" Land Preparation ",
                            thisItem['title'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(thisItem['Url']),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          thisItem['content'].toString(),
                          // "\t First of all, divide the land into blocks of convenient size with footpaths and roads laid out in between. In the slopy area, you can adopt terracing and contour planting. Spacing for arabica and robusta coffee is 2-2.5m and 2.5 to 4m respectively on either way. \n\n  Usually, you can open pits of 45cm after the first few summer shower. You can plant the seedlings of 16 to 18months old during June or September-October. Place the seedling in the hole with its taproot and lateral roots spread out in the proper position. \n\n  Then, pack the soil around the seedling firmly and evenly in such a way that 3-cm high above the ground to prevent stagnation of water around the collar. Finally, provide the seedlings cross stakes to prevent wind damage.\n \n",
                          style: TextStyle(
                            fontSize: 19,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
