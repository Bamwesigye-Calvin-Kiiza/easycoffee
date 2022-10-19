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
  const farm_tools_screen({key, farmtool});

  @override
  State<farm_tools_screen> createState() => _farm_tools_screenState();
}

class _farm_tools_screenState extends State<farm_tools_screen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _amount = TextEditingController();
  TextEditingController _currency = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _contact = TextEditingController();

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
        backgroundColor: Colors.orange.shade500,
        title: Text('Purchase form'),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 253, 238, 233),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _fullname,
                        decoration: InputDecoration(labelText: 'Full name'),
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _contact,
                        decoration: InputDecoration(labelText: 'Phone Number'),
                      )),
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
                        controller: _currency,
                        decoration: InputDecoration(
                            labelText: 'Enter currency (UGX,USD,NGN)'),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: _amount,
                      decoration: InputDecoration(labelText: 'Enter Amount'),
                    ),
                  ),
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
                  final currency = _currency.text;
                  final fullname = _fullname.text;
                  final phone_number = _contact.text;

                  if (email.isEmpty ||
                      amount.isEmpty ||
                      currency.isEmpty ||
                      phone_number.isEmpty ||
                      fullname.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')));
                  } else {
                    //proceed to flutterwave payment
                    _makepayment(context, email.trim(), amount.trim(),
                        currency.trim(), fullname, phone_number.trim());
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
      ),
    );
  }

  Future<void> _makepayment(BuildContext context, String email, String amount,
      String currency, String fullname, String phone_number) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST446c4063b52a",
          publicKey: "FLWPUBK_TEST-e472e6cf586e3dde1dc7749b38fdbd39-X",
          currency: currency,
          amount: amount,
          email: email,
          fullName: fullname,
          txRef: _ref,
          isDebugMode: true,
          phoneNumber: phone_number,
          acceptCardPayment: false,
          acceptUSSDPayment: true,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: true,
          acceptRwandaMoneyPayment: true,
          acceptUgandaPayment: true,
          acceptBankTransfer: false,
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
