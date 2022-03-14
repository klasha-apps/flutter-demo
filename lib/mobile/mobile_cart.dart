import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klasha/data.dart';
import 'package:klasha/widgets/product_mobile.dart';
import 'package:klasha_flutter_checkout/klasha_flutter_checkout.dart';
import 'package:provider/provider.dart';

import '../bloc/cart_block.dart';
import '../constants.dart';
import '../widgets/cartproduct.dart';

class MobileCartScreen extends StatefulWidget{
  const MobileCartScreen({Key? key}) : super(key: key);

  @override
  MobileCartScreenState createState()=> MobileCartScreenState();

}

class MobileCartScreenState extends State<MobileCartScreen> {


  late CheckoutCurrency _checkoutCurrency;

  void _launchKlashaPay( String _email, String _amount){
    KlashaCheckout.checkout(
      context,
      email: _email,
      amount: double.parse(_amount),
      merchantKey: merchantKey,
      checkoutCurrency: _checkoutCurrency,
      onComplete: (KlashaCheckoutResponse klashaCheckoutResponse) {
        print(
            'checkout response transaction reference is  ${klashaCheckoutResponse.transactionReference}');
        print('checkout response status is ${klashaCheckoutResponse.status}');
        print(
            'checkout response message is ${klashaCheckoutResponse.message}');
        if (klashaCheckoutResponse.status) {
          // show success dialog -> transaction  successful

        } else {
          // show error dialog -> transaction not successful
        }
      },
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkoutCurrency = CheckoutCurrency.NGN;
  }

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int? totalCount = 0;
    if (bloc.cart.isNotEmpty) {
      totalCount = bloc.cart.values.reduce((a, b) => a! + b!);
    }
    var cart = bloc.cart;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Text("Cart"),
          leading:IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  int? productIndex = cart.keys.toList()[index];
                  int? count = cart[productIndex];
                  return CartProduct(
                    products: productList[index],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                height: 50,
                width: 300,
                color: primaryColor,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        _launchKlashaPay(testEmail,testAmount);
                      },
                      child: const Center(
                          child: Text(
                            "Continue to Payment",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

