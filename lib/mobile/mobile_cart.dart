import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klasha/data.dart';
import 'package:klasha/widgets/product_mobile.dart';
import 'package:provider/provider.dart';

import '../bloc/cart_block.dart';
import '../constants.dart';
import '../widgets/cartproduct.dart';

class MobileCartScreen extends StatelessWidget {
  const MobileCartScreen({Key? key}) : super(key: key);

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
          )
        ],
      ),
    );
  }
}

