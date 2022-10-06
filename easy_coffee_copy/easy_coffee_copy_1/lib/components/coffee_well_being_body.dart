import 'package:flutter/material.dart';

class coffee_well_being_body extends StatefulWidget {
  const coffee_well_being_body({Key key}) : super(key: key);

  @override
  State<coffee_well_being_body> createState() => _coffee_well_being_bodyState();
}

class _coffee_well_being_bodyState extends State<coffee_well_being_body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 238, 233),
      body: SingleChildScrollView(
        child: Stack(
          children:[ Container(height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30))),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 70,
                      child: Container(
                      
                        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        color: Color.fromARGB(255, 196, 229, 255),
                        child: Center(child: Text('Brief about coffee',style: TextStyle(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container()
                        ],
                        )
                      ],
                    ),
                  )
                ],
              ),
          ),]
        ),
      ),
    );
  }
}