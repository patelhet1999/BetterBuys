import 'package:better_buys/models/product.dart';
import 'package:http/http.dart' as http;
import 'models/seller.dart';
import 'dart:convert';

class ServerHandler{
  final String _baseUrl = "https://192.168.15.103/you/api";

  //Get list of sellers
  Future<List<Seller>> getSellers() async{
    try{
      List<Seller> sellers = [];

      http.Response response = await http.get(Uri.parse('$_baseUrl/gen/sellers'));

      // print(response.body);
      List sellersList = (json.decode(response.body))['sellers'];
      print(sellersList.toString());
      for(Map m in sellersList){
        sellers.add(Seller.fromMap(m));
      }

      return sellers;
    }
    catch(e){
      print('Server Handler Error' + e.toString());
      rethrow;
    }
  }

  //Getting list of product per seller
  Future<List<Product>> getProductsPerSeller(int? sellerId) async{

    try{
      List<Product> products = [];

      http.Response response = await http.get(Uri.parse('$_baseUrl/gen/products?seller_id=$sellerId'));
      print(response.body);
      List productsList = (json.decode(response.body))['products'];

      return products;
    }
    catch(e){
      print('Server Handler Error'+ e.toString());
      rethrow;
    }

  }


}