import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klasha/constants.dart';
import 'package:klasha/data.dart';
import 'package:klasha/desktop/desktop_checkout.dart';
import 'package:klasha/widgets/produc_desktop.dart';
import 'package:provider/provider.dart';

import '../bloc/cart_block.dart';
import '../widgets/cartproduct.dart';
import '../widgets/product_tab.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int? totalCount = 0;
    if (bloc.cart.isNotEmpty) {
      totalCount = bloc.cart.values.reduce((a, b) => a! + b!);
    }
    var cart = bloc.cart;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          flexibleSpace: Row(
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Text("Store",
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge),
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
                        child: Text("Cart",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall)),
                    const SizedBox(width: 10),
                    Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(32.0)),
                        child: Center(
                          child: Text("$totalCount",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DesktopCheckoutScreen()),
                    );
                  },
                  child: const Text(
                    "Nike Collection",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GridView.builder(
                            itemCount: productList.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 30,
                                childAspectRatio: 0.65),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductTab(
                                products: productList[index],
                                onTap: () {
                                  bloc.addToCart(index);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            left: 400,
            right: 250,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(0, 18),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: shadowColor,
                ),
              ]),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
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
                  Center(
                    child: Container(
                      height: 40,
                      width: 400,
                      color: primaryColor,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              // _launchKlashaPay( ' yowivig426@goonby.com', '1000');
                            },
                            child: const Center(
                                child: Text(
                                  "Proceed to Checkout",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

