import 'package:easy_coffee_copy_1/screen/crud.dart';

import 'package:flutter/material.dart';

import '../components/price_Fructuations.dart';

class PricePage extends StatefulWidget {
  const PricePage({Key key}) : super(key: key);

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  String title, cherry, bean, Dry, husk, Processed, M1, M2, M3, M4;
  bool _isloading = false;
  Crudprices cruds = new Crudprices();
  Uploadprices() async {
    Map<String, String> blogMap = {
      if (title != null) 'title': title,
      if (bean != null) 'bean': bean,
      if (cherry != null) 'cherry': cherry,
      if (Dry != null) 'Dry': Dry,
      if (husk != null) 'husk': husk,
      if (Processed != null) 'Processed': Processed,
      if (M1 != null) '3 Months': M1,
      if (M2 != null) '6 Months': M2,
      if (M3 != null) '9 Months': M3,
      if (M4 != null) '12 Months': M4
    };

    cruds.addData(blogMap).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => price_fructuatations())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'Price Fluctuation',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: _isloading
              ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : Container(
                  child: Builder(builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter Coffe Type',
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter Cherry price',
                            ),
                            onChanged: (value) {
                              cherry = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter Bean price',
                            ),
                            onChanged: (value) {
                              bean = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter Dry seeds price',
                            ),
                            onChanged: (value) {
                              Dry = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter Husked coffee price',
                            ),
                            onChanged: (value) {
                              husk = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter Processed coffee price',
                            ),
                            onChanged: (value) {
                              Processed = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter 3 Months price',
                            ),
                            onChanged: (value) {
                              M1 = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter 6 Months price',
                            ),
                            onChanged: (value) {
                              M2 = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter 9 Months price',
                            ),
                            onChanged: (value) {
                              M3 = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter 12 Months price',
                            ),
                            onChanged: (value) {
                              M4 = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: Text('Add Prices'),
                                onPressed: (() {
                                  Uploadprices();
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
