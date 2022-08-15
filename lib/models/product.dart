class Product{
  int? id;
  int? sellerId;
  String? name;
  String? image;
  String? pricePerKg;
  String? description;
  String? interactionCount;

  //Constructor
  Product.fromMap(Map<dynamic, dynamic> map){
    id = int.parse(map['id']);
    sellerId = int.parse(map['seller_id']);
    name = map['name'];
    image = map['image'];
    pricePerKg = map['price_per_kg'];
    description = map['description'];
    interactionCount = map['interaction_count'];
  }

}