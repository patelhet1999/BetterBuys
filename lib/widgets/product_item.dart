import 'package:better_buys/screens/product_details_screen.dart';
import 'package:better_buys/utility/colors.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {

  final Product product;
  final int productIndex;

  const ProductItem({Key? key, required this.product, required this.productIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product,),));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: primaryColors[productIndex],
                      width: 3,

                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        primaryColors[productIndex],
                        primaryColors[productIndex].withOpacity(0.0),
                      ],
                    ),
                  ),
                  child: Image.network("https://192.168.15.103/you/assets/${product.image!}"),
                ),
              ],
            ),
          ),
        ),

        //product name
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(product.name!, style: TextStyle(fontSize: 12),),
        ),

      ],
    );
  }
}
