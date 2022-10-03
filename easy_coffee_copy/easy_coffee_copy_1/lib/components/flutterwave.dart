import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

// void main() {
//   runApp(flutterwaveapp());
// }

// class flutterwaveapp extends StatelessWidget {
//   const flutterwaveapp({key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: farm_tools_screen(),
//     );
//   }
// }

class farm_tools_screen extends StatefulWidget {
  const farm_tools_screen({key});

  @override
  State<farm_tools_screen> createState() => _farm_tools_screenState();
}

class _farm_tools_screenState extends State<farm_tools_screen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _amount = TextEditingController();

  String _ref;

  void setRef() {
    Random rand = Random();
    int number = rand.nextInt(2000);
    if (Platform.isAndroid) {
      setState(() {
        _ref = 'android123489$number';
      });
    } else {
      setState(() {
        _ref = 'IOS123456$number';
      });
    }
  }

  @override
  void initState() {
    setRef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        title: Text('Flutter wave'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(labelText: 'Enter email'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _amount,
                    decoration: InputDecoration(labelText: 'Enter Amount'),
                  ),
                )
              ],
            ),
          ),
          //button
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                final email = _email.text;
                final amount = _amount.text;

                if (email.isEmpty || amount.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar( 
                      SnackBar(content: Text('Fields are empty')));
                } else {
                  //proceed to flutterwave payment
                  _makepayment(context,email.trim(),amount.trim());
                }
              },
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                color: Colors.orange.shade300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.payment),
                    Text(
                      'Make payement',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makepayment(
      BuildContext context, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST446c4063b52a",
          publicKey: "FLWPUBK_TEST-e472e6cf586e3dde1dc7749b38fdbd39-X",
          currency: "ugx",
          amount: amount,
          email: email,
          fullName: "Bamwesigye",
          txRef: _ref,
          isDebugMode: true,
          phoneNumber: "+256000000",
          acceptCardPayment: false,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: true,
          acceptZambiaPayment: false);

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
     if (response == null) {
        print("Transaction Failed");
      } else {
        ///
        if (response.status == "success") {
          print(response.data);
          print(response.message);

        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }
}

