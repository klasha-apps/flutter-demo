import 'dart:js' as js;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klasha/constants.dart';
import 'package:provider/provider.dart';

import '../bloc/cart_block.dart';

class DesktopCheckoutScreen extends StatefulWidget{
  const DesktopCheckoutScreen({Key? key}) : super(key: key);


  @override
  DesktopCheckoutScreenState createState()=> DesktopCheckoutScreenState();

}

class DesktopCheckoutScreenState extends State<DesktopCheckoutScreen> {

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
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _checkoutCurrency = CheckoutCurrency.NGN;
  // }


  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int? totalCount = 0;
    if (bloc.cart.isNotEmpty) {
      totalCount = bloc.cart.values.reduce((a, b) => a! + b!);
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          centerTitle: true,
          // title: Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 400, top: 10),
          //       child: Container(
          //         height: 40,
          //         width: 40,
          //         decoration:
          //         BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          //         child: Image.asset("assets/images/logo.png"),
          //       ),
          //     ),
          //     Text("Store", style: Theme.of(context).textTheme.bodyLarge),
          //   ],
          // ),
          flexibleSpace:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(left: 0),
                      height: 40,
                      width: 40,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0,left: 10),
                      child: Text("Store", style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 400),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Row(
                  children: [
                    const Center(
                      child: Icon(
                        CupertinoIcons.cart,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Center(
                        child:
                        Text("Cart", style: Theme.of(context).textTheme.bodySmall)),
                    const SizedBox(width: 10),
                    Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(32.0)),
                        child:  Center(
                          child:  Text("$totalCount",
                              style: const TextStyle(color:Colors.white,fontSize: 12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 550),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Checkout",
                  style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,fontSize: 35),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "1. Address details",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Change",
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 0.0, top: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Ada Adiche\n',  style: TextStyle(fontSize: 14),),
                      TextSpan(
                        text: 'Plot 6 & 7 Elemo Layout, Off Oda Road, Akure-Oda Road, Ondo\n+2349071603960',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                )
                // Text(
                //   "Plot 6 & 7 Elemo Layout, Off Oda Road, Akure-Oda Road, Ondo +2349071603960",
                //   style: TextStyle(fontSize: 14, color: Colors.grey),
                // ),
              ),
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '2. Delivery method\n',  style: TextStyle(fontSize: 16),),
                      TextSpan(
                        text: 'How do you want your order delivered?',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                )
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
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '3. Payment method\n',  style: TextStyle(fontSize: 16),),
                      TextSpan(
                        text: 'How do you want your order delivered?',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                )
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
                  Expanded(
                    child: Image.asset("assets/images/kpm.png"),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Center(
                child: Container(
                  height: 50,
                  width: 400,
                  color: primaryColor,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: (){
                          js.context.callMethod("payWithKlasha");
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
      ),
    );
  }
}


