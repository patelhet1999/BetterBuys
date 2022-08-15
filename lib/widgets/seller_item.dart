import 'package:better_buys/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../models/seller.dart';

class SellerItem extends StatelessWidget {
  final Seller seller;
  final Color backgroundColor;

  const SellerItem({Key? key, required this.seller, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(seller: seller,),));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(seller.name!,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                    child: Text(seller.address!,),
                ),
                Padding(
                  padding:const EdgeInsets.only(top: 15, left: 15),
                  child: Text("No Rating",),
                ),
              ],
            ),

            Container(
              height:100,
              width:100,
                margin: EdgeInsets.only(right: 20),
                child: Image.network("https://192.168.15.103/you/assets/${seller.image!}",),
            ),

          ],
        ),
      ),
    );
  }
}
