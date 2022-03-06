import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klasha/data.dart';
import 'package:klasha/widgets/product_mobile.dart';
import 'package:provider/provider.dart';

import '../bloc/cart_block.dart';
import '../constants.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

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
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 200,
          leading:Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              Text("Store", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          actions: [
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Nike Collection",
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,fontSize: 35),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ProductMobile(
                      products: productList[index],
                      onTap: (){
                        bloc.addToCart(index);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

