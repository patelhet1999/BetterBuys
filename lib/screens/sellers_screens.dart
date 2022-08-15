import 'package:better_buys/widgets/seller_item.dart';
import 'package:flutter/material.dart';
import 'package:better_buys/server_handler.dart';
import '../models/seller.dart';

class SellersScreen extends StatefulWidget {
  
  List<Seller> sellers;
  SellersScreen({Key? key, required this.sellers}) : super(key: key);

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {

  List<Color> sellerItemsBackgroundColor = [];

  @override
  void initState() {
    super.initState();

    sellerItemsBackgroundColor.add(const Color(0xFFE6F3EC));
    sellerItemsBackgroundColor.add(const Color(0xFFE6E6F2));
    sellerItemsBackgroundColor.add(const Color(0xFFE6F3EC));
    sellerItemsBackgroundColor.add(const Color(0xFFE6E6F2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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

                //List of Sellers
                Column(
                  children: widget.sellers.map((e) => SellerItem(seller: e,backgroundColor: sellerItemsBackgroundColor[widget.sellers.indexOf(e)],)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
