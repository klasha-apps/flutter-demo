import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';

import '../constants.dart';
import '../data.dart';

class ProductTab extends StatelessWidget {

  final Products products;
  final VoidCallback onTap;

  const ProductTab(
      {
        Key? key,
        required this.products,
        required this.onTap,
      }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(products.productImage,
            fit: BoxFit.fitWidth, width: 500,
            filterQuality: FilterQuality.high,),
          const SizedBox(height: 10.0),
          Text(
            products.productName,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10.0),
          Text(
            products.productPrice,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10.0),
          Text(
            products.productDescription,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GiveStarReviews(
                  starData: [
                    GiveStarData(
                        text: '4.05  ',
                        size: 10,
                        starCount: 5,
                        onChanged: (rate) {}),
                  ],
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    width: 100,
                    height: 50,
                    color: primaryColor,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                        child: Center(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      CupertinoIcons.cart,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Add to Cart",
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      );
  }
}