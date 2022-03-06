import 'package:flutter/material.dart';

import '../data.dart';

class CartProduct extends StatelessWidget {

  final Products products;

  CartProduct({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  products.productImage),
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: Text(products.productName),
        trailing: Text(products.productPrice),
      ),
    );
  }

}