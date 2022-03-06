import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:klasha/data.dart';

import '../constants.dart';
import '../mobile/mobile_payment_screen.dart';

class ProductMobile extends StatelessWidget {

  final Products products;
  final VoidCallback onTap;

  const ProductMobile(
      {
        Key? key,
        required this.products,
        required this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MobilePaymentScreen()),
                );
              },
              child: Image.asset(products.productImage,
                fit: BoxFit.fitWidth, width: 500,
                filterQuality: FilterQuality.high,),
            ),
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
            const SizedBox(height: 20.0),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GiveStarReviews(
                  starData: [
                    GiveStarData(
                        text: '4.05  ',
                        size: 20,
                        starCount: 5,
                        onChanged: (rate) {}),
                  ],
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 1,
                  child: Container(
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
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Add to Cart",
                                    style: TextStyle(color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}