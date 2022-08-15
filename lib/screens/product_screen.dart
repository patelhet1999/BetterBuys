import 'package:better_buys/models/seller.dart';
import 'package:better_buys/server_handler.dart';
import 'package:better_buys/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget {

  final Seller seller;

  const ProductScreen({Key? key, required this.seller}) : super(key: key);
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  List<Product> _products = [];
  bool _firstExec = true;

  void getProductsPerSeller(int sellerId){
    ServerHandler().getProductsPerSeller(sellerId).then((value){ print(value); setState((){_products = value;});}).catchError((e){print(e);});
  }

  @override
  Widget build(BuildContext context) {

    if(_firstExec) {
      getProductsPerSeller(widget.seller.id!);
      _firstExec = false;
    }
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Better Buys", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan,),),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              //loading widget
              if(_products.isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                      strokeWidth: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("Loading Products"),
                  ),
                ],
              ),

              //Listt  of items
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _products.length,
                  itemBuilder: (context, index) => ProductItem(product: _products[index], productIndex: index),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
