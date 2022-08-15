import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(product.name!),
        backgroundColor: const Color(0xFFF4E8484),
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
      ),
      body: Container(
        color:  Color(0xFFF4E8484),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Column(
            children: [
              Image.network("https://192.168.15.103/you/assets/${product.image!}",
                height: MediaQuery.of(context).size.height *1/2 - 20.0,
                fit: BoxFit.cover,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children :[
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                        child: Text('Rs. ${product.pricePerKg!} / kg', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    )
                  ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children :[
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text('${product.description}', style: TextStyle(fontSize: 12,),),
                  ),
                ],
              ),
              
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
