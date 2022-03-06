import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';

import '../constants.dart';

class MobilePaymentScreen extends StatefulWidget{

  const MobilePaymentScreen({Key? key}) : super(key: key);


  @override
  MobilePaymentScreenState createState()=> MobilePaymentScreenState();


}

class MobilePaymentScreenState extends State<MobilePaymentScreen> {

  var _yourGroupValue = 0;

  // late CheckoutCurrency _checkoutCurrency;
  //
  // void _launchKlashaPay( String _email, String _amount){
  //   KlashaCheckout.checkout(
  //     context,
  //     email: _email,
  //     amount: double.parse(_amount),
  //     merchantKey: merchantKey,
  //     checkoutCurrency: _checkoutCurrency,
  //     onComplete: (KlashaCheckoutResponse klashaCheckoutResponse) {
  //       print(
  //           'checkout response transaction reference is  ${klashaCheckoutResponse.transactionReference}');
  //       print('checkout response status is ${klashaCheckoutResponse.status}');
  //       print(
  //           'checkout response message is ${klashaCheckoutResponse.message}');
  //       if (klashaCheckoutResponse.status) {
  //         // show success dialog -> transaction  successful
  //
  //       } else {
  //         // show error dialog -> transaction not successful
  //       }
  //     },
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_checkoutCurrency = CheckoutCurrency.NGN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        //physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Colors.grey[100],
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'Lorem Ipsum set amit Lorem Ipsum set amit\n',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: 'bold',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Image.asset(
                        "assets/images/nike1.png",
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Change",
                    style: TextStyle(fontSize: 14, color: primaryColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Text(
                "Plot 6 & 7 Elemo Layout, Off Oda Road, Akure-Oda Road, Ondo +2349071603960",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                "Delivery Method",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Door Delivery',
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Radio(
                      activeColor: primaryColor,
                      value: 0,
                      groupValue: _yourGroupValue,
                      onChanged: (int? value) {
                        setState(() {
                          _yourGroupValue = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Pickup Station',
                        style: TextStyle(fontSize: 14)),
                    leading: Radio(
                      activeColor: primaryColor,
                      value: 1,
                      groupValue: _yourGroupValue,
                      onChanged: (int? value) {
                        setState(() {
                          _yourGroupValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text(
                      'Pay with Klasha',
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: Radio(
                      activeColor: primaryColor,
                      value: 2,
                      groupValue: _yourGroupValue,
                      onChanged: (int? value) {
                        setState(() {
                          _yourGroupValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Center(
              child: Container(
                height: 50,
                width: 300,
                color: primaryColor,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      // _launchKlashaPay( ' yowivig426@goonby.com', '1000');
                    },
                      child: const Center(
                          child: Text(
                    "Continue to Payment",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
